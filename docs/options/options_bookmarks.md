

![Bookmarks](/images/options_bookmarks.png)

Single character bookmark ids can be used with the add/jump shortcuts.

##### Add

This sequence followed by one of the characters shown in 'Ids' entry, creates a shortcut to the current item.

##### Input

This will prompt the user to enter the bookmark id for the current item. The id can be of any length

##### List

Shows the bookmark list dialog (as shown [here](../user-guide/bookmarks.md#bookmarklist)). Bookmarks are activated using the keyboard (spacebar or return) or the "Show in tab" button.

##### Jump

This sequence followed by a single character will open the bookmark with given id. When used, the current location is saved as a temporary bookmark (with the id '-here') for use with the Revert key.

##### Revert

This will activate the temporary bookmark setup when using the Jump key. Only the previous jump can be reverted.
##### Clear

Delete all bookmarks. Individual bookmarks cannot be deleted but creating a bookmark with an id already in use will overwrite the old entry. (It is possible to delete a bookmark by manual editing of the configuration file.)

##### Ids

This entry contains a list of the valid single letter bookmarks. It is case insensitive.

##### Menu format

Controls the appearance of the list of bookmarks shown in the bookmark menu. The letters preceded by '%' are placeholders and are the values are inserted:

+ %R   - root
+ %H   - headword
+ %N   - node id
+ %V   - volume
+ %P   - page

##### Open and activate tab

When the bookmark is activated these two settings determine in which tab the bookmark is shown and whether that
tab is made current.
