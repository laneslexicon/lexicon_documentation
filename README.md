This repository is to be used in conjuction with laneslexicon/lexicon repository. You should have the both at the same directory level i.e

```
project root
|
|--- documentation
|--- lexicon
|--- parser
|--- xml
```

(The laneslexicon/parser and laneslexicon/xml repositories are part of the same project, but directly relevant here.)

From the documentation directory do

```
mkdocs build --clean
```

The local build can be viewed by doing:

```
mkdocs serve
```

and pointing the browser at http://127.0.0.1:8000


The documentation is built in the subdirectory 'site'.

In order for Arabic text to have a suitable font, a script (ar_markup.pl) is provided. This scans the generated HTML files and wraps Arabic text in &lt;span class="arabic"&gt;.


```
perl ar_markup.pl --site site --verbose
```

#### Building a local version of the help files for the program documentation


The same help files are used for the program documentation and the documentation/site directory should be copied to the Resources/site sub-directory after running the ar_markup.pl script. (See [here](http://laneslexicon.github.io/lexicon/site/custom/themes/index.html) for information about the location of the Resources directory.

The generated help files contain links to googleapis.com, such as:

```
<link href='https://fonts.googleapis.com/css?family=Lato:400,700|Roboto+Slab:400,700|Inconsolata:400,700' rel='stylesheet' type='text/css'>
```
This can significantly slow the in-program documentation. One way to remove them on *nix is

```
find Resources/site -iname "*.html" -exec perl -i -ne 'print unless /googleapis.com/' {} \;
```

##### Publish the pages on gihub


After the documentation has been built with

```
mkdocs build --clean
```

Go to lexicon repository directory and do


```
git checkout gh-pages
```

Then copy everything (while still in the lexicon directory). For example


```
rsync -avz ../documentation/site/ site
perl ../documentation/ar_markup.pl --site site --verbose
```

Stage and commit everything that has changed (or is new).
