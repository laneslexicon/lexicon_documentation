#### Platforms

The application can be built on Windows,Linux and OSX provided they have
the required software.

The project as a whole is made up the parts:

+ The XML data files originating from the Perseus project
+ A perl script that parses the XML files and populates a SQLite database
+ A GUI application to view,search etc the data.

The description that follows assumes that these sub-projects are organised as sub-folders:

    <Project Root>
        |
        |--- xml
        |--- parser
        |--- gui


#### Requirements

+ Qt
+ Perseus XML
+ Perl
+ LibXSLT
+ mkDocs



#### Building the database

The database is built by the the Perl script 'lane.pl' and while this can be run from the command line, a makefile has been provided to simplify the task.

The script has numerous options that were used during development, but are unlikely to be use again.


To build do:

    make -f util.mak build

and that will do everything required, building the database as 'lexicon.sqlite'.



#### Building the GUI

The source directory is <Project Root>/gui and contains build files, sources files and a number of subdirectories:

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
        |
        |--- tools
        |
        |--- docs
        |
        |--- help


Each subdirectory contains a relatively isolated set of code (except for "docs" and "help") and often has a separate test program and associated build files.

A brief description of each directory:

+ imedit <br/> Contains the code that handles entering mapped keyboard characters e.g entering Buckwalter characters and seeing the corresponding Arabic characters appear. These are subclasses of QLineEdit and QTextEdit.

+ keyboard <br/> The virtual keyboard code and Perl script that generates a keyboard definition. See below for more information on how to create a new virtual keyboard layout.

+ notes <br/>

+ options <br/>

+ qslog <br/> The logging classes

+ tools <br/>

+ docs <br/>  The documentation, mostly in markdown but with some Html.

+ help <br/>  Various configuration files that build the program document in QtHelp format

#### Build the Help


##### Online help files


The online help is built using <a href="www.mkdocs.org">mkdocs</a>
