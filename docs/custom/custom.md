## Background


How the application looks and behaves is mainly dependent on the information contained in three configuration files. These files are in plain text format and can be viewed and edited with any plain text editor.

The configuration dialogs in the application read and update these files as appropriate.


##### Application stylesheet (default: appliciation.css)

The font used in menus, buttons and throughout the application. The foreground and background color of all widgets.

##### Entry stylesheet (default: entry.css)

The appearance of the Lexicon entries themselves: fonts, colors etc

##### Settings (default: settings.ini)


Keyboard shortcuts, default settings for e.g. 'open in new tab', settings for the default printer, bookmarks, current open tabs etc

Entries consist of key/value pairs grouped into sections.

### Stylesheets


The stylesheet files will look familiar to anyone who is acquainted with CSS. To quote from the software framework that is used to create the application:

*the concepts, terminology, and syntax of Qt Style Sheets are heavily inspired by HTML Cascading Style Sheets (CSS) but adapted to the world of widgets.*

For a full explanation of the options and the syntax the user should consult the [Qt](http://www.qt.io) website. (Entering 'Qt 5.5 style sheet reference' into a search engine should help locate the details. As of the time of writing, [this](http://doc.qt.io/qt-5/stylesheet-reference.html) is a direct link to the relevant section of the website.)


The majority of the entries in the two stylesheets specify the font family and size. A dialog is provided to change these settings without using a text editor *Menu -> Tools -> Change font* (See [here](../custom/font.md) for details.) Adjusting the font specification using this method will change all font settings; for more fine-grained control manual editing is required. It is important to note that for the built-in font changer to work correctly is makes the following assumptions:

+ all CSS selectors that specify Arabic font must have 'arabic' in their name
+ all settings key/value pairs that specifiy Arabic, must have 'arabic' in their key



### How the Lexicon is presented

When viewing a Lexicon entry what is presented is a sequence of HTML pages arranged vertically with one page for each headword. However, what is stored in the database that drives the application is not HTML but rather XML. (At heart, the same XML that was created by Perseus digitization project.)

*Extensible Markup Language (XML) is a markup language that defines a set of rules for encoding documents in a format which is both human-readable and machine-readable. It is defined by the W3C's XML 1.0 Specification[2] and by several other related specifications,[3] all of which are free open standards.* [Wikipedia](http://en.wikipedia.org/wiki/XML)

An entry's XML is passed to a built-in processor that uses a set of rules specified in one of configuration files ("entry.xslt") to convert it to HTML. The set of rules make up a simple XSLT stylesheet:

*XSLT (Extensible Stylesheet Language Transformations) is a language for transforming XML documents into other XML documents, or other formats such as HTML for web pages, plain text ..* [Wikipedia](http://en.wikipedia.org/wiki/XSLT)

After the XML has been converted to HTML for viewing, the CSS stylesheet is applied.

As a consequence, it is possible for the user to control both the appearance and the structure of the Lexicon entries by editing this file ("entry.xslt"). This can be done using any text editor, although a [dialog](../custom/editview.md) is provided to assist with the process.
