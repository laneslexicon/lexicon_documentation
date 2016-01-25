## Contents

The contents and the currently viewed entry can be made to be behave independently or set so that any movement in one is reflected in the other. This behaviour, linked vs not linked, can be set by clicking on the icon in the status bar:

![Content link](/images/contentlinking.png)

This behaviour can also be turned on and off using the shortcut Ctrl+L.

Irrespective of whether the contents and the entry are linked, single-clicking an the arrow to the left of a letter or a root, will expand to show the roots or the root derivatives respectively. Pressing spacebar has the same effect.

Double-clicking an entry will always load that entry.

![Expand root](/images/expandroot.png)

An "expand" arrow will only be visible to the left of a root if it is being, or has been, displayed in the current session. If no expand arrow is visible a root may be expanded by pressing the spacebar when the root is selected (shown by a blue blackground). To select a root without loading it, single click on the root.

To move between roots with the keyboard, use the  up/down arrows or the 'w' and 's' keys. To expand/contract a root use the spacebar or the 'x' key.  (By default, see [contents options](../options/options_contents.md)).

To switch focus between contents and entry using the keyboard there are two shortcuts : to focus on the contents Ctrl+M,C , Ctrl+M,E to focus on the entry. (For a list of shortcuts see [here](../options/options_shortcuts.md).)

If the contents are not linked, they can be brought into alignment using the two options:

+ align contents to entry  - causes the highlighted root to be set to match the currently viewed item
+ align entry to contents  - load the currently highlighted root into the current tab

These actions can be performed either via  *Menu -> View*, the toolbar items or the appropriate shortcuts.

## Viewing an entry

Double-click on a root to load the root and all of its derivatives into the current tab. Holding the shift or control key while clicking will load the root into a new tab.

To load a root using the keyboard, press return when one if its children is selected.

When a tab has loaded, the current item is shown with a dashed border, as below. This will be the root or one of its children, depending on which was double-clicked.


![Current item](/images/currentitem.png)


Use the scrollbar or the up/down keys to move around without changing the current item.

The default keys 'i' (move up) and 'k' (move down) change the view and the current item. Use the 'h' key to return to the original or 'home' item. The 'm' key changes the current item to the home item and can be used as a temporary bookark. (The keys are set in the [entry options](../options/options_entry.md).)

When moving using the i/k keys, what happens at the first and last entries for the root depends on the setting for 'off page movement': when this is set (the default), movement continues onto the next/previous entry in the lexicon. To prevent this behaviour, turn this setting off in the [entry options](../options/options_entry.md) dialog.

#### Context menu

Right-clicking on an entry (or using the keyboard context menu key) will show the context menu:


![Context menu](/images/entrycontextmenu.png)

There two sections: the upper actions apply to the current entry item, the lower to all items in the current tab.

Further information about notes can be found [here](notes.md) and bookmarks [here](bookmarks.md).

Text can be selected with the mouse or the context menu and copied to the clipboard. (The context menu item "Copy" will copy all the selected text, not just that of the currenty entry.)



#### Zooming

The current page may be zoomed using either the +/- keys or from the toolbar. Each tab has its own zoom level but a default zoom can be set for all tabs using  *Menu -> View -> Set default zoom".

The dialog can retrieve the zoom from the current tab allowing the user to adjust the zoom for the current page and then use the dialog to set that value as the default.

![Default zoom](/images/defaultzoom.png)


#### Text width

The text width (in pixels) of the entries can be adjusted in a similiar fashion to the zoom but using *Menu -> View -> set default text width*
