#### Entering Arabic text


For those without an Arabic keyboard, there are two ways of entering Arabic text: virtual keyboards and keymaps.

##### Virtual keyboards

The virtual keyboards are activated using the 'Show keyboard' button on the various search dialogs. Two layouts are provided - Windows Arabic 101 and 'Digital Orientalists'. [Tools](../dev-guide/vkeyboard.md) are provided to let you build your own layout.

The default virtual keyboard is set via the System Options [dialog](../options/options_system.md).

To use the virtual keyboard simply click on the required character. The 'Shift' key will stay active until another key is clicked; use this method to input the 'upper' row of characters.

![Windows Arabic 101 keyboard](/images/vkeyboard.png)

##### Keymaps


Using keymaps allows your native keyboard to output Arabic characters using a 'map' - a key, or a sequence of keys, is converted into the mapped Arabic character. The default Arabic keymap is called 'Buckwalter' and corresponds (almost) to Tim Buckwalter's transliteration scheme ([External reference](http://www.qamus.org/transliteration.htm)). With this map active, typing 'kataba' would output  كَتَبَ

Details of the default Buckwalter keymap are [here](../other/buckwalter.md)

Keymaps are disabled by default and may be enabled via the shortcut Ctrl+K,E and disabled by Ctrl+K,D, or via the status line:


![Keymap Statusbar](/images/keymapstatusbar.png)


Once enabled they apply to all text entry items that require Arabic text i.e. the search dialogs where the target is Arabic text - root, headword and Arabic word search.
