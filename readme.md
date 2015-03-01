Workflow


The documentation files in the 'docs' subdirectory


From mansur/documentation you can run mkdocs:

>mkdocs build
>mkdocs serve

and view the documentation on port 8000.


To build the Qt help, these two files must be kept in sync:

help/lexicon.qhp
buildhelp.pl


When done, run buildhelp.pl. This generates the help files (lanedocs.qhc and lanedocs.qch).

They can be tested standalone:
>assistant -collectionFile help/lanedocs.qhc

copy help/lanedocs.qhc and help/lanedocs.qch to the required directory e.g. gui/Resources

The file lexicon.qhp has a keywords section:

 <keywords>
    <keyword name="preface" id="idPreface" ref="preface.html"/>
    <keyword name="introname" id="Lexicon::intro"  ref="intro.html#xxx"/>
    <keyword  id="lanex" ref="preface.html#x"/>
    <keyword name="entry settings" id="idEntrySettings" ref="user-guide/configuring.html#entrysettings"/>
	<keyword name="grammatical terms" id="idGrammaticalTerms" ref="preface.html#grammaticalterms"/>
    <keyword name="Search" id="idSearchConfiguration" ref="user-guide/configuring.html#findsettings"/>
 </keywords>


The name attribute appears in the index for the help viewer.

Programmatically we connect the value of id attribute to the place in the documentation.
So for help buttons on the optionswidget, they emit the id attribute e.g. "idSearchConfiguration".
This ends up being passed to :

    HelpViewer::showSection(const QString &);


    which retrieves the URL from the QHelpEngine and then calls:

    HelpWidget::helpLinkActivated(const QUrl & url);
