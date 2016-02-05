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
  if ($word =~ /^[\p{InArabic}\p{IsSpace}\p{IsPunct}]+$/) {
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
  my $out = scanText($text);
  print $fh  $out;
  close IN;
  close $fh;
  print STDERR "\n" if $verbose;
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
  print STDERR "Doing: scanText(\"$text\")\n" if $verbose;
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
      while (! $arabicEnd ) {
        $i++;
        if ($i == $max) {
          $arabicEnd = $i;
          next;
        }
        $c = substr $text , $i, 1;
        next if $c =~ /\p{IsSpace}/;
        next if $c =~ /\p{IsPunct}/;
        next if $c =~ /\n/;
        if (
            (ord($c) < 0x600) ||
            (ord($c) > 0x6ff)
           ) {
          $arabicEnd = $i - 1;
        }
      }
#      print STDERR "$arabicStart $arabicEnd\n";
      # move back to last Arabic character so we don't include trailing
      # punctuation
      for (my $j=$arabicEnd;$j > $arabicStart;$j--) {
        $c = substr $text , $j, 1;
        if (( ord($c) >= 0x600) && (ord($c) <= 0x6ff)) {
          $arabicEnd = $j;
          $j = -1;
        }
      }
#      if ($arabicStart == $arabicEnd) {
#        $arabicEnd++;
      #      }
      $arabiclength = ($arabicStart == $arabicEnd ? 1 : $arabicEnd - $arabicStart);
#      print STDERR sprintf "[%s]\n", substr $text,$arabicStart,$arabiclength; #$arabicEnd - $arabicStart;
#      print STDERR sprintf "[%s]\n",substr $text,$arabicStart,1;
      # from arabic start read back to ensure
      # we don't have <span class="xxx"> immediately preceding it
      my $x = substr $text,0,$arabicStart;# - 1;
#      print STDERR "$arabicStart $arabicEnd $arabiclength\n";
#      print STDERR "[$x]\n";
#      if ($x =~ /<span\s*[^>]*>\s*$/) {
      if ($x =~ /<span\s*class="arabic">/) {
#      if (0) {
        $out .= substr $text, $arabicStart,$arabicEnd - $arabicStart;
      } else {
        $out .= "<span class=\"arabic\">";
        $out .= substr $text, $arabicStart,$arabiclength;#arabicEnd - $arabicStart;
        $out .= "</span>";
        $spansAdded++;
        #    print sprintf "%d %d\n",$arabicStart,$arabicEnd;
        #    print sprintf "%04x %d\n",ord($c),ord($c) . "\n";
        #    print substr $text , $arabicStart, $arabicEnd - $arabicEnd;
      }
      $i = $arabicEnd;
    } else {
      $out .= $c;
    }
  }
  print STDERR "\nadded $spansAdded span tags\n" if $verbose;
  return $out;
}
GetOptions("in=s" => \$infile,
           "out=s" => \$outfile,
           "clean" => \$remove,
           "site=s" => \$siteRoot,
           "class=s" => \$arClass,
           "test" => \$testmode,
           "verbose" => \$verbose,
           "safe" => \$safemode);

if ($testmode) {
  my $text = "one two وَ أَنتَ (this is for you)";
  print scanText($text);
  print "\n";
  $text = "one two <span class=\"arabic\"> وَ أَنتَ </span> oh well";
  print scanText($text);
  print "\n";

  $text = "one two <span dir=\"rtl\"> وَ أَنتَ </span> oh wellf";
  print scanText($text);
  print "\n";
  $text = "one skip_start two وَ أَنتَ what the skip_end heck";
  print "\n";
  print scanText($text);

  print "\n";

 $text = "a ح b";
  print scanText($text);
  print "\n";

  $text = "      <td class=\"lang striped\"  align=\"center\" valign=\"middle\">ل</td>";

  print scanText($text);
  print "\n";





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
