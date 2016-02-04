

#### orths.pl
<a name="orths"></a>


    perl orths.pl
    	--db   <db file>            Name of input database
	    --dbout <db file>           Name of output database if different (optional)
      	--node                      Process only the given node or comma separated list of nodes
	    --nodes <filename>          Process the nodes listed one per line in the supplied file
	    --log-dir                   Write log file to given directory, defaults to current
	    --dry-run                   Do not update the database
	    --xml-out  <output file>    Output fixed XML as either one file or individual files if the supplied
	                                names contains NODE, with NODE being replaced by the actual node id
	    --show                      Show the before/after XML
	    --export                    Export the current link table records before updating
	    --verbose                   Show relevant node text in log
    	--xml                       XML source file or directory
    	--backup                    Create a backup copy of each node before updating
    	--help                      Print this


Use cases

+ To report on all the &lt;orths&gt; in a file
```
perl orths.pl --report --xml ../xml/b0.xml
```

+ To show the original XML, the fixed XML and orth analysis for a node

```
perl orths.pl --report --xml ../xml/b0.xml --node n2033 --show
```

+ To generate a fix file for a node
```
perl orths.pl --db lexicon.sqlite --xml ../xml/b0.xml --node n2033 --dry-run --xml-out fixed.xml
```

The generated file, in this case  "fixed.xml", can be distributed and imported by the application to apply the fix.


+ To apply corrected xml directly to the database
```
perl orths.pl --db lexicon.sqlite --xml ../xml/b0.xml --node n2033
```
