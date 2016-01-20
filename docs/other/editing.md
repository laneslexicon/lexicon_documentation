
It is possible to directly edit Lexicon entries from within the application although it should be noted that any software update is likely destroy such edits.

Although the text that makes up an entry is stored in an XML structure, simple edit are possible without requiring any knowledge of XML.


#### Editing an entry

To edit the text of any entry, right-click on the entry and select 'Show XML' from the context menu. This will present the XML viewer dialog:

![XML Edit](/images/xmledit.png)

By default, editing is disabled but can be enabled by unchecking the checkbox. Once unchecked the text can be edited directly or, if preferred, copied and edited in an external editor and the amended text pasted over the original.

The "Export" button provides a method a saving the XML to an external file and so can be used to save any changes or to provide a backup of the original text. (To import saved XML, use *Menu -> Tools -> Import XML*.)

The "Save" button will write the changes to the database. To view the result immediately, use the "Reload" key (default : 'r').

Note

+ Changing the XML structure itself is not advisable without a knowledge of XSLT See [here](../other/entryxml.md) for more information.

+ Read [this](../other/orths.md) before editing the text to correct word order issues with cross-references.
