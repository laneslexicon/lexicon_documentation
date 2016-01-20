
The font change dialog can be used to change the font used for either Arabic or English text. In doing so it reads the current theme's configuration files and attempts to the determine the currently used fonts and present that information as part of the dialog:


![Font Change Dialog](/images/fontchange.png)


The left panel should be used to change the font used for Arabic text; the right panel to change the font for all non-Arabic text.

The user can select the font family using the drop down list, which is initially populated by those fonts that support the writing system under consideration.

To change the font size for *ALL* entries a numeric should be entered where specified. Use this option at your own risk.

The changes can be restricted to a specific area by using the checkboxes provided. Some details of the areas covered can be found [here](../custom/custom.md).

For instance, to change the Arabic font used by the Lexicon entries, the 'Application stylesheet' and 'Configuration settings' checkboxes should be un-checked in the left panel and 'Change font' button clicked.


For this font change utility to work:

+ all CSS selectors that specify Arabic font must have 'arabic' in their name
+ all settings key/value pairs that specifiy Arabic, must have 'arabic' in their key
+ the CSS specifiying the font name should be in the form 'font-family : xxxxxx'

If these conditions are not met, the results will not be those desired.
