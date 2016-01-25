### Overview

Searching for Arabic text can be restricted to specific contexts by choosing the appropriate method, either from the *Search* menu or by using the appropriate shortcut:


+ Ctrl+S,R       Search for root

+ Ctrl+S,H       Search for headword

+ Ctrl+S,W       search for Arabic word in the body of the text

There is no method of searching the entire Lexicon for an English word, although you can search the currently displayed root and all its entries for either English or Arabic text.

When searching for a headword or an Arabic word in the body of the text a number of options are available and are described [below](#searchoptions). Details on how to enter Arabic text are [here](entering.md)

### Root

Searching for a root is the simplest (and fastest) search. Only exact matches are considered successful.

![Root search](/images/rootsearch.png)

If found the root and all its children are loaded into either the current or a new tab, depending on the options selected.

### Full Lexicon search
When searching the entire Lexicon for an Arabic word, the results are presented as shown below:

![Search Results](/images/searchresults.png)


The "Context" column shows the found text in its text context. To view the full entry with the search result hightlighted either double-click the row or, with the row selected, hit the spacebar or return key. From the result dialog, below, it is possible to print or open the result as a new tab. Any number of these dialogs can be open at once.

<a name="nodeview"></a>
![Node View](/images/searchnodeinfo.png)

### Head word search

Head word search has an important option, highlighted below:

![Head search dialog](/images/headsearchdialog.png)

*Search entry heading* refers to the difference between an entry's headword and the full phrase that sometimes marks the entry in Lane's original text. (The distinction is discussed [here](diffs.md).)

If this option is set, the search will be conducted using the head phrase as a target, otherwise the headword is used.

The results are returned in a table:

![Head search results](/images/headsearchresults.png)

To view a particular search result either double-click the row or, with the row selected, hit the spacebar or return key. From the viewing dialog, below, it is possible to open the result as a new tab. Any number of these dialogs can be open at once.

![Head search result view](/images/headsearchresultview.png)


(If the *close after load* checkbox is ticked, the view dialog will be closed after the entry has been loaded into a tab.)

### Saving the search results

Clicking the *Export* button in the bottom right of the search results dialog will show the export options. All of the results, or a selection of them, marked by using the checkbox in column 2, can be saved to a text file.

![Export options](/images/exportresults.png)

<a name="searchoptions"></a>

### Search Options

There are two types of search:'normal' and 'regular expression' with slightly differing options.


#### Normal search

For a normal search the entered pattern is treated as literal text.

![SearchDialog](/images/searchdialog.png)


######Ignore diacritics

When checked any diacritics will be ignored. What counts as a diacritic can be set [here.](../options/options_diacritics.md)

The default diacritics are:<span class="arabiclarge">
&#x064b;&nbsp;&nbsp;&nbsp;&nbsp;
&#x0671;&nbsp;&nbsp;&nbsp;&nbsp;
&#x064c;&nbsp;&nbsp;&nbsp;&nbsp;
&#x064d;&nbsp;&nbsp;&nbsp;&nbsp;
&#x064e;&nbsp;&nbsp;&nbsp;&nbsp;
&#x064f;&nbsp;&nbsp;&nbsp;&nbsp;
&#x0650;&nbsp;&nbsp;&nbsp;&nbsp;
&#x0651;&nbsp;&nbsp;&nbsp;&nbsp;
&#x0652;&nbsp;&nbsp;&nbsp;&nbsp;
&#x0670;
</span>

######Whole word match

The match is successful only when the target is a whole word; patterns embedded within a word do not match. For example, when this option is set searching for <span class="arabic">كتب</span> will not match <span class="arabic">كتبنا</span> .


#### Regular Expression search

The pattern will be treated as a regular expression.


![Regular Expression Search Dialog](/images/rx_searchdialog.png)

###### Force LTR

Mixing Arabic text and regular expression syntax can be very confusing as the regex constructs e.g. \b (bare word) and \s (space) will change the text direction. With this option set, Arabic text will be displayed left-to-right. (To achieve this the Unicode code point 0x202d (LEFT-TO-RIGHT OVERRIDE) is prepended to the text. It is possible to accidentally remove this character through backspacing. If this happens, unchecking then checking the option will re-insert it.)


######Include head entries in search results

When set, any head word that matches the pattern are included in the search results.


<a name="searchcurrent"></a>
### Search the currently viewed entry

The currently viewed entry can be searched for Arabic or English text. Local searching can be done either via the context menu, the main menu or via the appropriate shortcut (default, Ctrl+L,F).

Found entries are highlighted in a user selectable color:


![Search highlights](/images/searchhighlights.png)


Highlighted text can un-highlighted from the main menu *Entry -> Clear* or by clicking on the *Clear* button on the toolbar.

The last search highlights (if they exist) can be re-instated using the shortcut Ctrl+L,S.


If the *Highlight all* option is set all the found items are highlighted. If not set, the first item is highlighted and subsequent entries are highlighted in turn using the shortcut Ctrl+L,N (show next).
