
![Printer options](/images/options_printer.png)

Printing can be done either to an actual printer or to a PDF.

#### Printer properties

To specify physical printer properties click on the button and choose the options from the printer dialog, finally clicking the "print" button to set the properties.


#### PDF output

When checked, output is written to a PDF file

#### PDF directory

Click the "Select directory" button to select the  location into all which all PDF files will be written. If blank, the current working directory will be used.

#### Auto name PDF

Instead of prompting the user for a PDF name, this option can be used to let the system choose the name (using the method specified in the next entry).

#### Naming method

+ Arabic word: this will be either the root or the current headword depending on whether a root or an entry is being printed.

+ Node name: in format n&lt;a number&gt; (i.e the number shown in the statusbar

+ Date time


In all cases, after creating the PDF, the name of the file will appear briefly in the message area of the statusbar and will also appear in the logfile and so can be seen with the Log Viewer dialog (*Main menu -> Tools -> View logs*).


#### Supplementary information


In addition to printing the Lexicon entry, additional information can be printed:

+ Any notes associated with the entry

+ System information e.g. database version

+ Node summary

(The example below will show what is included.)

Each option can have of three possible settings: always, never, prompt.

If any one of the options has "prompt" as a value, the user is asked to select which information is required whenever a print is requested.

The printer output is such that a new page is thrown before any supplementary information is printed, separating this content from the printing of the Lexicon entries themselves.

![Supplement information](/images/supplementaryinfo.png)


#### Use these settings

If this option is not checked, the system's Print dialog will be used to specify printer output.
