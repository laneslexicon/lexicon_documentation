### Setting up

The archive file contains two directories:

####laneparser

This contains the database load software. The important things are

    lane.pl              the script to parse the XML and load the database
    util.mak             commands to do this
    xml directory        contains all the XML files from Perseus
    lexicon_schema.sql   a sequence of SQL statements to create an empty database

####LanesLexicon

This is the application itself.

The project file laneslexicon.pro will show you what source files are needed.

Subdirectories:

######Resources

Contains all the runtime files excluding shared libraries i.e. images, the database, INI files and help files.

######docs

The project documentation in markdown format. This provides the basis for building both the online help and the project documentation

######help

The build directory for project documentation in help format. The .html files in this directory are build from the .md files in the docs directory. See below.

######imedit

Source files to do the automatic conversion from Buckwalter to Arabic
######keyboard

Sources files for the virtual keyboard
######logbrowser

Unused
######moc

Intermediate files. Its contents can be deleted.
######obj

Intermediate files. Its contents can be deleted.
######qslog

Source files for the logging code
######site

Static website containing the project documentation. The entire contents of this directory are produced as part of the build process.

######tools

Assorted scripts, notably buildhelp.pl (See below.)
######old_images

Unused images


(Both directories contain a git repository.)

### Building the database from scratch

Get the XML sources from Perseus

    http://www.perseus.tufts.edu/hopper/opensource/downloads/texts/hopper-texts-Arabic.tar.gz

and extract all the files under Arabic/Lane/opensource into a directory.

And then either do the following:

    make -f util.mak full

or execute these commands:

	perl lane.pl --db lexicon.sqlite --initdb --overwrite --dir ./xml --no-context --verbose --logbase lexicon --sql ./lexicon_schema.sql

    Where
     --dir <directory> is the directory you extract the files to.
     --sql <filename>  is the file containing the SQL specification of the database. A copy of this file should be in the LanesLexicon directory.


    The conversion process will output numerous log files into your system's TEMP directory, all prefixed by whatever is specified in  --logbase <prefix>

    This creates the basic database. After that run these commands:

	perl lane.pl --db lexicon.sqlite --set-links
	perl lane.pl --db lexicon.sqlite --xrefs
    perl lane.pl --db lexicon.sqlite --diacritics


### Building the program

#### Build requirements


Download the latest open source version of the Qt framework from qt-project.org

For Windows, download the 32-bit MinGW version. The Visual Studio version is untested.


Mac users should install the appropriate version of XCode before installing Qt.

The only external libraries used are libXML and libXSLT:

######Linux

    Install the packages libxml2-dev and libxslt-dev

######Mac

    They appear to be pre-installed (or are installed as part of XCode)

######Windows:

Get the binaries from ftp://ftp.zlatkovic.com/libxml/

        iconv-1.9.2.win32.zip
        libxml2-2.7.8.win32.zip
        libxslt-1.1.26.win32.zip
        zlib-1.2.5.win32.zip

You don't need:

    libxmlsec-1.2.18.win32.zip
    libxmlsec-nounicode-1.2.18.win32.zip
    openssl-0.9.8a.win32.zip
    xsldbg-3.1.7.win32.zip

Unzip them and make sure that the location of the include files are correct in laneslexicon.pro

#### Building the application

Once Qt and the libraries are installed, in a terminal, change into the directory LanesLexicon
and do:

    qmake laneslexicon.pro
    make clean
    make

and it should build ok. If you need to rebuild, just type in 'make'.

#### Building the documentation

The online documentation is built with mkdocs from  http://www.mkdocs.org/. The documentation is written in markdown format.

To build it,

    mkdocs build

This will create a static website in the subdirectory 'site'. The build config is in the file mkdocs.yml and the markdown files are in the 'doc' directory.

The application help is built from the same markdown files that mkdocs uses, but is built using the script tools/buildhelp.pl. This script does the following:

    runs 'markdown' on the required .md files to generate .html files
    runs 'qcollectiongenerator' against lexicon.qhcp to generate the actual help files

You need to make sure that lexicon.qhcp and the perl script are kept in sync otherwise there will be missing html files.
#### Running the application

To run the application on the same machine as it was built you do not need to copy shared libraries.

On OSX building will create an application package with this structure:

    laneslexicon.app
        Contents
            MacOS
            Resources
            PkgInfo

You will need to copy everything from the Resources sub-directory into the Resources directory of the application package:

    cp -r Resources laneslexicon.app/Contents


The executable will be in the MacOS directory and it can be run from there.


For Linux and Windows you don't need to move anything.


### Distribution

This is incomplete. While the application has been built and run on Windows 7, OSX Mountain Lion and Debian Linux, the distribution requirements have only been investigated for Linux.


##### Shared libraries

Under Linux and OSX (?) first remove library runtime path coded into the executable

    chrpath -d laneslexicon

There are three categories of shared libraries: Qt system libarires, Qt plugins and other external libraries.

###### Qt system libaries

Under Linux

    libQt5CLucene.so.5
    libQt5Core.so.5
    libQt5DBus.so.5
    libQt5Gui.so.5
    libQt5Help.so.5
    libQt5PrintSupport.so.5
    libQt5Sql.so.5
    libQt5Widgets.so.5

Windows:

    Qt5CLucene.dll
    Qt5Core.dll
    Qt5Gui.dll
    Qt5Help.dll
    Qt5Network.dll
    Qt5PrintSupport.dll
    Qt5Sql.dll

###### Qt Plugins

These have to be in specific directory. Under Linux this works:

    platforminputcontexts/libcomposeplatforminputcontextplugin.so
    platforminputcontexts/libibusplatforminputcontextplugin.so
    platforms/libqeglfs.so
    platforms/libqlinuxfb.so
    platforms/libqminimalegl.so
    platforms/libqminimal.so
    platforms/libqoffscreen.so
    platforms/libqxcb.so


###### External libraries

For the following three, you just need the version it was built with

    libicudata.so.51
    libicui18n.so.51
    libicuuc.so.51


These two were installed earlier:

    libxml2.so.2
    libxslt.so.1


For Windows, these are the DLLs I have:

    iconv.dll
    libexslt.dll
    libxml2.dll
    libxslt.dll
    zlib1.dll


#### Running

On Linux, with all the shared libraries either in the current directory or under the right directory for the Qt plugins and with the Resources sub-directory available, the program can be run:

    LD_LIBRARY_PATH=. ./laneslexicon


So create an executable script with that in it.
