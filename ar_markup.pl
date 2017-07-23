#!/usr/bin/perl
#use strict;
use POSIX;
use XML::LibXML;
use English;
#use XML::Parser;
use Encode;
use utf8;
use DBI;
use File::Spec;
use File::Basename;
use File::Find;
use File::Copy;
use Data::Dumper;
use Getopt::Long;
use Time::HiRes qw( time );
use FileHandle;
my $infile;
my $outfile;
my $safemode=0;
my $testmode=0;
my $remove=0;
my $siteRoot="";
my $verbose=0;
my $debug=0;
my $arClass="arabic";
my @sitefiles;
my @skip = qw(windows101_ini/index.html
              windows101_text/index.html);


binmode STDERR, ":encoding(UTF-8)";
binmode STDOUT, ":encoding(UTF-8)";
###########################################################
# can be used with document to add <span class="arabic"></span
# around arabic text
##########################################################
##########################
# test for arabic text
##########################
sub arabic {
  my $word = shift;

  if (! $word ) {
    return 0;
  }
  if ($word =~ /^[\p{InArabic}\p{IsSpace}\p{IsPunct}\p{Bidi_Class: NSM}]+$/) {
    return 1;
  }
  return 0;
}
#
# read the entire file and pass it to scanText
#
#
sub add_markup {
  my $fileName = shift;
  my $outf = shift;
  my $fh;

  foreach my $p (@skip) {
    if ($fileName =~ /$p/) {
      print STDERR "Skipping $fileName\n" if $verbose;
      return;
    }
  }
  open(IN,"<:encoding(UTF8)",$fileName) or die "No file $fileName";
  if (! $outf ) {
    open $fh, '>&:encoding(UTF8)', STDOUT or die "Error opening STDOUT: $!";
  } else {
    open($fh,">:encoding(UTF8)",$outf);
  }
  my $text = "";
  while (<IN>) {

    $text .= $_;
  }
  if ($verbose) {
    print STDERR "Processing $fileName ";
  }
  my ($count,$out) = scanText($text);
  print $fh  $out;
  close IN;
  close $fh;
  print STDERR sprintf "%s :   %d tags added\n",$fileName,$count if $verbose;
}
sub remove_markup {
  my $fileName = shift;
  my $outf = shift;
  my $fh;
  open(IN,"<:encoding(UTF8)",$fileName) or die "No file $fileName";
  if (! $outf ) {
    open $fh, '>&:encoding(UTF8)', STDOUT or die "Error opening STDOUT: $!";
  } else {
    open($fh,">:encoding(UTF8)",$outf);
  }
  my $txt;
  my $pos;
  my $rec;
  my $spanLength = length "<span class=\"arabic\">";
  my $matchCount;
  while (<IN>) {
    $rec = $_;
    $txt = "";
    $matchCount = 0;
    $pos = 0;
    while (/<span class="arabic">([^<]+)<\/span>/g) {
      #      print sprintf "\n\n\nMatch at %d, length %d\n",length $PREMATCH,length $MATCH;
      $txt .= substr $rec,$pos,length($PREMATCH) - $pos;
      #      print "[$pos][$txt]\n";
      $txt .= $1;
      $pos = (length $MATCH) + (length $PREMATCH);
      $matchCount++;
    }
    if ($matchCount  == 0) {
      $txt = $rec;
    } else {
      $txt .= substr $rec, $pos;
    }
    print $fh $txt;
  }
  close IN;
  close $fh;
}
sub processSite {

  my $fileName = $File::Find::name;

  if ($fileName =~ /html$/) {
    push @sitefiles,$fileName;
  }

}
#
# This has to deal with:
#  1. "skip_start" and "skip_end" tags which the text may contains
#  so that text between these two tags is not processed
#  2. Arabic text that may already be wrapped in <span class="arabic">
#
sub scanText {
  my $text = shift;
  my $arabicStart;
  my $arabicEnd;
  my $pos = -1;
  my @skipStarts;
  my @skipLength;
  my $skipIndex = 0;
  my $spansAdded = 0;
  my $arabiclength = 0;
  # find skip_start and skip_end positions
  # so we can jump over them

  while (($pos = index($text,"skip_start",$pos)) > -1) {
    push @skipStarts,$pos;
    $pos++;
  }
  $pos = -1;
  while (($pos = index($text,"skip_end",$pos)) > -1) {
    push @skipEnds,$pos;
    $pos++
  }
  if (($#skipStarts == -1) || ($#skipStarts != $#skipEnds)) {
    $skipIndex = -1;
  }
  my $out = "";
  my $max = length $text;
  for (my $i = 0; $i < $max;$i++) {
    my $c = substr $text , $i, 1;
    if ($skipIndex != -1) {
      if ($i >= $skipStarts[$skipIndex]) {
        my $skipLength = $skipEnds[$skipIndex] - $skipStarts[$skipIndex] - 1;
        $out .= substr $text,$skipStarts[$skipIndex],$skipLength;
        $i += $skipLength;
        $i--;
        if ($skipIndex == $#skipStarts) {
          $skipIndex = -1;
        } else {
          $skipIndex++;
        }
        next;
      }
    }
    if (( ord($c) >= 0x600) && (ord($c) <= 0x6ff)) {
      $arabicStart = $i;
      $arabicEnd = 0;
      my $EOA = 0;
      while (! $EOA ) {
        $i++;
        if ($i == $max) {
          $arabicEnd = $i;
          $EOA = 1;
          next;
        }
        $c = substr $text , $i, 1;
        next if $c =~ /\p{IsSpace}/;   # include these so we can get the
        next if $c =~ /\p{IsPunct}/;   # longest piece of Arabic that makes sense
        next if $c =~ /\n/;
        if (
            (ord($c) < 0x600) ||
            (ord($c) > 0x6ff)
           ) {
          $EOA = 1;
          $arabicEnd = $i - 1;
        }
      }
      # move back to last Arabic character so we don't include trailing
      # punctuation and spaces which we skipped over in the above code
      for (my $j=$arabicEnd;$j >= $arabicStart;$j--) {
        $c = substr $text , $j, 1;
        if (( ord($c) >= 0x600) && (ord($c) <= 0x6ff)) {
          $arabicEnd = $j;
          $j = -1;
        }
      }
      $arabiclength = ($arabicStart == $arabicEnd ? 1 : $arabicEnd - $arabicStart + 1);

      if ($debug) {
        print sprintf "Last arabic char [%s]\n",substr $text,$arabicEnd,1;
        print sprintf "Arabic text:[%s]\n",substr $text,$arabicStart,$arabicEnd - $arabicStart + 1;
      }


      # from arabic start read back to ensure
      # we don't have <span class="xxx"> immediately preceding it
      my $x = substr $text,0,$arabicStart;

      if ($x =~ /<span\s*class="arabic">/) {
        $out .= substr $text, $arabicStart,$arabiclength;#
      } else {
        $out .= "<span class=\"arabic\">";
        $out .= substr $text, $arabicStart,$arabiclength;
        $out .= "</span>";
        $spansAdded++;
      }
      $i = $arabicEnd;
    } else {
      $out .= $c;
    }
  }
  return ($spansAdded,$out);
}
GetOptions("in=s" => \$infile,
           "out=s" => \$outfile,
           "clean" => \$remove,
           "site=s" => \$siteRoot,
           "class=s" => \$arClass,
           "test" => \$testmode,
           "verbose" => \$verbose,
           "debug" => \$debug,
           "safe" => \$safemode);

if ($testmode) {
  my $ln = length("<span class=\"arabic\"></span>");
  my @tests;
  push @tests," هُوَ ";
  push @tests," من ";
  push @tests,"من";
  push @tests,"<td>من</td>";
  push @tests,"one two وَ أَنتَ (followed by punctuation)";
  push @tests,"one two وَ أَنتَ،هِي (Arabic text with punctuation)";
  push @tests, "one two <span class=\"arabic\"> وَ أَنتَ </span> Arabic already wrapped";
  push @tests,"one two <span dir=\"rtl\"> وَ أَنتَ </span> embedded within a spanl";
  push @tests,"one skip_start two وَ أَنتَ what the skip_end heck";
  push @tests,"a ح b single character";
  push @tests,"      <td class=\"lang striped\"  align=\"center\" valign=\"middle\">ل</td>";

  foreach my $text (@tests) {
    my ($count,$out) = scanText($text);
    my $added = length($out) - length($text);
    print sprintf "Spans added : %d, added %d characters\n",$count,$added;
    print "Text in     : [$text]\n";
    print "Text out    : [$out]\n";
    if (($added % $ln) != 0) {
      print "****ERROR****\n";
    }
    print "--------------------------------------------------------------\n";
  }




  exit 0;
}

if ($siteRoot) {
  my @d;
  if (! -d $siteRoot) {
    print STDERR "Site root directory $siteRoot not found\n";
    exit 0;
  }
  push @d, $siteRoot;
  find(\&processSite,@d);
  foreach my $file (@sitefiles) {
    my $outfile = sprintf "%s\.new",$file;
    add_markup($file,$outfile);
    if (-e $outfile ) {
      if (! $safemode ) {
        copy($outfile,$file);
        unlink($outfile);
      }
    }
  }
  exit 0;
}
if (! $infile && ! $siteRoot) {
  print STDERR "No input file specifield\n";
  print STDERR "Usage: --in <filename> --out <filename> --safe\n";
  exit;
}
if (! -e $infile ) {
  print STDERR "Input file $infile not found\n";
  exit;
}

if ((! -e $outfile ) && ($safemode)) {
  print STDERR "Output file exists and safe mode specified: $outfile\n";
  exit;
}
if ($siteRoot) {
}
if ($remove) {
  remove_markup($infile,$outfile);
} else {
  add_markup($infile,$outfile);
}
