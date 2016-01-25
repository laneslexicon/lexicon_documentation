#### Platforms

The application can be built on Windows,FreeBSD, Linux and OSX provided the required software is installed.

The project as a whole is made up of four parts:

+ The XML data files originating from the Perseus project
+ Perl script that parse the XML files and populates a SQLite database
+ A GUI application to view,search etc the data.
+ The documentation

The description that follows assumes that these projects are organised as sub-folders:

    <Project Root>
        |
        |--- xml
        |--- parser
        |--- gui
        |--- documentation

#### Requirements

+ Qt
+ Perseus XML
+ Perl (and various modules)
+ LibXSLT
+ mkDocs

#### Qt

The application is built with the Qt Framework available from [here](http://qt-project.org). The Open Source edition is suitable.

Please note that the current version of this software requires a Qt version that includes the QWebView module, which is deprecated but still available in Qt 5.5. Once its replacement, QWebEngine, is available on all platforms this software will be updated.

TODO mention gl.h requirement

#### mkdocs

The documentation is built using [mkDocs](http://www.mkdocs.org). Please see their website for details on how to install to your platform. If you have the Python package manager *pip* installed then simply do:

    pip install mkdocs

#### LibXSLT


##### Debian based systems (e.g. Linux Mint,Ubuntu)

```sh
sudo apt-get install libxml2-dev libxslt1-dev
```

##### Windows

##### OSX

##### FreeBSD

    pkg install libxslt libxml2

#### Building the database

The database is built by a number of Perl scripts, which can be run a supplied  makefile:

To build from parser directory do:

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
        |
        |--- tools


Each subdirectory contains a relatively isolated set of code (except for "docs" and "help") and often has a separate test program and associated build files.

A brief description of each directory:

+ imedit - The code that handles entering mapped keyboard characters e.g entering Buckwalter characters and seeing the corresponding Arabic characters appear. These are subclasses of QLineEdit and QTextEdit.


+ keyboard - The virtual keyboard code and Perl script that generates a keyboard definition. See [here](vkeyboard.md) for more information on how to create a new virtual keyboard layout.


+ notes - The sources for the notes system.


+ options - All the sources that make up the preferences dialog.


+ qslog - The logging source files.


+ tools


TODO mention include paths for libxslt and libxml for Win32

To build the application do:

    qmake laneslexicon.pro
    make

#### Build the Help


From the documentation directory do

    mkdocs build --clean

The local build can be viewed by doing:

    mkdocs serve

and pointing the browser at http://127.0.0.1:8000


##### Building a local version of the help files

After building the documentation is should be copied to the xxxxxx

TODO describe publish.sh

##### Sitemap.ini
