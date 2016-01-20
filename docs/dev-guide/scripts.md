

#### orths.pl
<a name="orths"></a>

Analyses XML file and reports on &lt;orth&gt; usage and attempts to *fix* known patterns. Outputs to log file.

 perl orths.pl --db lexicon.sqlite --xml ../xml/_A0.xml  --node n1126  --verbose


perl orths.pl --dry-run --db lexicon.sqlite --xml ../xml/_A0.xml  --node n1126  --verbose


    perl orths.pl -h
       --db              Name of input database (required)
       --dbout           Name of output database if different (optional)
       --node            Do <orths> for only the given node or comma separated list of nodes
       --log-dir         Write log file to given directory, defaults to current
       --dry-run         Do not update the database
       --show            Show the before/after XML
       --export          Export the current link table records before updating
       --verbose         Show relevant node text in log
       --xml             XML source file for use with --node
       --backup          Create a backup copy of each node before updating
       --out-template    Output XML using the supplied value as a filename template, replacing
                         the literal NODE by the node number. For example, --out-template test-NODE.xml
       --help            Print this
