##Bookmarks
####Using
Ctrl-B followed by single letter will add a book mark at the current place.

To go to that bookmark, Ctrl-J followed by the same letter.

If you have jumped to a bookmark and wish to return to the previous place, enter Ctrl-B,Ctrl-R

To list your current bookmarks, enter Ctrl-B,Ctrl-L

####Configuration
The allowed bookmarks are specified in the configuration file


[Bookmark]

Add=Ctrl+B

Clear="Ctrl+B,Ctrl+C"

Id=abcdefghijklmnopqrstuvwxyzA

Jump=Ctrl+J

List="Ctrl+B,Ctrl+L"

Revert="Ctrl+B,Ctrl+R"


Each character in the Id string can be used as a bookmark. Upper and lower cases are treated as separate.

####Using uppercase letters as bookmarks

Entering uppercase bookmarks by simply typing Ctrl+B,A can be difficult because of timing issues. It is simpler in this case to add the bookmark either by right-clicking on the item or adding it via the main menu. Both methods will popup a small dialog allowing to the enter the uppercase character.
