As outlined [here](../custom/custom.md), the Lexicon as seen by the user is the result of applying two stylesheets to
the stored XML for the currentl entries:

+ the CSS stylesheet, which affects principally the fonts and colors

+ the XSLT stylesheet, which controls the structure of the viewed entry

The Edit View dialog allows the user to change either of these and to see the results of the changes on the currently viewed entries.


![EditView Dialog](/images/editview.png)

The dialog has two tabs, one containing the CSS stylesheet and other the XSLT stylesheet (for the current theme).

After changes are made to the text, the *Save* button is available and once clicked the contents are written to disk, overwriting the existing file. The *Reload* button will only restore from the last save. For safety, the user may wish to take a copy of the file before editing it, using the name shown at the top of the tab (the filename can be selected with the mouse and copied to the clipboard.)


Each can be edited and tested independently of the other and can be also tested together by checking the *Use edited XSLT* checkbox on the CSS tab and the *Use edited CSS* checkbox on the XSLT tab.

For example, if you wished to try a different font for the non-Arabic text, find the line beginning with "body", replace "Fira Sans" with the name of the new font and click the apply button - the results will be immediately visible.

See [here](../other/entrycss.md) for an explanation of the CSS classes used by a Lexicon entry.
