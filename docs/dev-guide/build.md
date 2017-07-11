### Platforms

Installers are provided for Windows and OSX. Linux and \*BSD users should following these [instructions](#buildlinux).

The application can be built on Windows, FreeBSD, Linux and OSX provided the required software is installed.

##### Build requirements

#### Qt

The application is built with the Qt Framework available from [here](http://qt-project.org). The Open Source edition is suitable. On Linux systems, the version provided by the package manager can be used.

For versions of Qt prior to 5.7.1 this software uses the QWebView module to view the program documentation/help. For later versions where this module is not available, the software will try to connect to the online documentation using the user's browser. When a better cross-platform solution is available, this may change.



#### mkdocs

The documentation is built using [mkDocs](http://www.mkdocs.org). Please see their website for details on how to install to your platform. If you have the Python package manager *pip* installed then simply do:

    pip install mkdocs

##### LibXSLT


###### Debian based systems (e.g. Linux Mint, Ubuntu)

```sh
sudo apt-get install libxml2-dev libxslt1-dev
```

###### Windows


Please see [here](http://xmlsoft.org/XSLT/downloads.html) for details on obtaining libxslt for Windows.


###### OSX

No action necessary (?).

###### FreeBSD

    pkg install libxslt libxml2

<a name="buildlinux"></a>
### Quick build instructions for Linux and \*BSD

Once the requirements have been met, to build the application:


```
# fetch the sources
> git clone https://github.com/laneslexicon/lexicon
> cd lexicon
# generate the make file
> qmake laneslexicon.pro
# build it. On FreeBSD this is 'gmake'
> make
# fetch the database, images, documentation etc
>git clone https://github.com/laneslexicon/lexicon_config
# give it the right name
>mv lexicon_config Resources
>cd Resources
>unzip lexicon.sqlite.zip
>cd ..
## run the application
>./laneslexicon
```



### Detailed build instructions
The project as a whole is made up of four parts:

+ The XML data files originating from the Perseus project
+ Perl script that parse the XML files and populates a SQLite database
+ A GUI application to view,search etc the data.
+ The documentation

The description that follows assumes that these projects are organised as sub-folders:

    <Project Root>
        |
        |--- logs
        |--- xml
        |--- parser
        |--- gui
        |--- documentation

#### Building the database

The database is built by a number of Perl scripts, which can be run via a supplied  makefile:

Build from parser directory do:

    make -f util.mak build

and that will do everything required, building the database as 'lexicon.sqlite'. It may take some time.



#### Building the GUI

The source directory contains build files, sources files and a number of subdirectories:

    Directory layout:

    <Project Root>/gui
        |
        |--- imedit
        |
        |--- keyboard
        |
        |--- notes
        |
        |--- options
        |
        |--- qslog




Each subdirectory contains a relatively isolated set of code and often has a separate test program and associated build files.

A brief description of each directory:

+ imedit - The code that handles entering mapped keyboard characters e.g entering Buckwalter characters and seeing the corresponding Arabic characters appear. These are subclasses of QLineEdit and QTextEdit.


+ keyboard - The virtual keyboard code and Perl script that generates a keyboard definition. See [here](vkeyboard.md) for more information on how to create a new virtual keyboard layout.


+ notes - The sources for the notes system.


+ options - All the sources that make up the preferences dialog.


+ qslog - The logging source files.




Before buiding the application for the first time it is advisable to check the build file (laneslexicon.pro) as this contains hard coded directory information.


For the build to be successful, Qt needs to be able to locate the OpenGL header file gl.h.


To build the application do:

    qmake laneslexicon.pro
    make

#### Build the Help


From the documentation directory do

    mkdocs build --clean

The local build can be viewed by doing:

    mkdocs serve

and pointing the browser at http://127.0.0.1:8000


The documentation is built in the subdirectory 'site'.

In order for Arabic text to have a suitable font, a script (ar_markup.pl) is provided. This scans the generated HTML files and wrap Arabic text in &lt;span class="arabic"&gt;.



    perl ar_markup.pl --site site --verbose

#### Building a local version of the help files for the program documentation


The same help files are used for the program documentation and the documentation/site directory should be copied are to the Resources/site directory after running the ar_markup script.

The generated help files contain links to googleapis.com, such as:

    <link href='https://fonts.googleapis.com/css?family=Lato:400,700|Roboto+Slab:400,700|Inconsolata:400,700' rel='stylesheet' type='text/css'>

This can significantly slow the in-program documentation. One way to remove them on *nix is


    find Resources/site -iname "*.html" -exec perl -i -ne 'print unless /googleapis.com/' {} \;
