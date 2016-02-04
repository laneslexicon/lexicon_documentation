#### Some things that are different


#### Handling of root entries

Lane has a number of entries which take the forms: *xxx yyy zzz* or *xxx and yyy* or *xxx or yyy*, such as the following from Volume 3, page 850:

![Two roots](/images/tworoots.png)


For each of these forms a full entry has been written for the first word in the list but every other entry has a link back to the first. Using the above example:

![Second root](/images/secondroot.png)


#### Supplement merge

Entries from the Supplement in Volume 8 of the original text have, where possible, been merged with the appropriate root from the main text. To distinguish them from other entries, they have a light gray background color, as in this example:

![Supplement](/images/supplement.png)


The background color is controlled via a configurable CSS setting:

    .supplement { background-color : lightgray }


How to change it is described [here](../custom/editview.png).

#### Head entries - multi-word heads
<a name="headword"></a>

Many entries, such as the one below, contain not a single head word but a head phrase. The software attempts to identify a single headword for each entry and, by default, shows this in the contents panel. The *Head search* dialog also targets this single headword by default. This behaviour can changed by setting the relevant option [here](../options/options_contents.md#headphrase) or [here](../options/options_entry.md#headphrase).

![Head phrase](/images/headphrase.png)


#### Textual notes

During digitization it seems that at certain points those involved were unable to decide what the text should be. In the original XML files from the Perseus Project these points usually indicated by a (??) in the file. Most of these have been resolved but there are 26 remaining where the problem appears to lie in original the text. These are marked by the appearance of a Note, as below

![Editors note](/images/editorsnote.png)

#### Lane's citations

Citations in the original text contains characters such Ḳ. During digitization these diacritics were removed and it has not proved possible to restore them. The original citations as listed in the [Indication of Authorities](../lane/preface.md#authorities).
