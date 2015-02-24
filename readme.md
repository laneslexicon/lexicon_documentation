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

