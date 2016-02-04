From time to time it may be necessary to update the database that contains the Lexicon entries.


#### Complete update

In order not to lose any links that have been manually fixed by the user, first export the links as described [here](../user-guide/missinglinks.md#export). Replace the database file (normally "lexicon.sqlite") and then import the link file.


#### Partial updates

Updates to individual headwords will be distributed as XML files. These should imported via *Menu -> Tools -> Import Xml*. In this case it is not necessary to save/restore links.


In both cases,  neither notes nor tabsets are affected as these are saved in different database files.
