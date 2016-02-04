
In a small number of cases the Arabic word order associated with a link/cross-references will be incorrect.


####The problem

Consider the following image taken from Perseus ([External link](http://www.perseus.tufts.edu/hopper/text?doc=Perseus%3Atext%3A2002.02.0019%3Aroot%3Djdr%3Aentry%3DjadiyrN)) in which the highlighted text is associated with the text as it appears in Lane (in this case Volume 2, page 390).

![Perseus](/images/n5217.png)

One description of this problem would be: whenever Arabic text precedes a cross-reference, the two blocks of text either side of <span style="font-size:150%">↓</span> are reversed. The correct word order can be recovered by flipping them around.

(To view this example search for node 5217.)


Unfortunately it is not that simple.
<!---
    It is said in a trad., <foreign lang="ar" TEIform="foreign">mano SaA
        ma</foreign> <lb/> ↓
      <orth type="arrow" lang="ar">Ald~ahora falaA SaAma walaA A^al~aY</orth>
--->

To understand the difficulty we need to look at the details of the markup applied to the original text during digitization.

First, a simple piece of Arabic text in this excerpt from the same entry to show the two structures involved:


![Markup example 1](/images/wordandlink.png)


The Arabic text is transliterated (see [here](../other/buckwalter.md) for details) and wrapped in XML tags:

    syn. <foreign lang="ar">maxolaqapN</foreign>. (K.) [↓
      <orth type="arrow" lang="ar">majodarapN</orth> properly signifies



<!---
<foreign>laA  A=luwka nuSoHFA</foreign>
--->

Standalone Arabic text is wrapped in  &lt;foreign&gt; tags; Arabic text in a cross-reference is wrapped in &lt;orth&gt; tags.

<!---
The three Arabic words are transliterated (see [here](../other/buckwalter.md) for details) and wrapped in &lt;foreign&gt; tags in the correct word order.
--->

Now consider the first example highlighted above,


      And <foreign lang="ar">A^ano yafoEala</foreign> ↓
      <orth type="arrow">A_in~ahu lamajodarapN</orth>, (K,) and in like manner

Note the structure: a  &lt;foreign&gt; tag and an &lt;orth&gt; either side of <span style="font-size:150%">↓</span> with no intervening non-Arabic text.

<!---

When there is a cross-reference within a piece of text like this from column 1 line 28:

![Orth example 2](/images/orthexample2.png)

it becomes:

    in the saying <foreign>A^uwluw AlofaDoli minokumo</foreign> ↓
      <orth type="arrow">walaA yaA^otali</orth>, in


As before the initial Arabic text is wrapped in &lt;foreign&gt; tags. However, the text that makes up the cross reference is wrapped  in &lt;orth&gt; tags.
Within each set of tags the word order is correct and because this becomes one piece of contiguous Arabic text, the overall word order is correct. To see this, start reading the text from inside the &lt;orth&gt; and then from inside &lt;foreign&gt;.
--->

However, consider the following example from Volume 1, Page 84 (column 2 line 10):
:

![Orth example 3](/images/orthexample3.png)

This becomes:

    It is said in a trad., <foreign>mano SaAma</foreign>  ↓
      <orth type="arrow">Ald~ahora falaA SaAma walaA A^al~aY</orth>


and **is** rendered correctly by Perseus.

(To view this example search for node 1126.)


Note that it has the same structure as the earlier example which was **not** rendered correctly: a  &lt;foreign&gt; and an &lt;orth&gt; tag either side of <span style="font-size:150%">↓</span>. This example happens to be correct because the line-break in the text "changes" the word order.

<!---
It is the same sequence: a &lt;foreign&gt; followed by an &lt;orth&gt;,  each with the correct word order. This time if we reconstruct the text by starting with the &lt;orth&gt; we do not get the correct word order. In effect, some information has been lost - the visual line break in the text told us that the text starts with &lt;foreign&gt;. i.e the correct word order is:

![Orth example 3](/images/orthexample4.png)




 مَنْ صَامَ الدَّهْرَ فَلَا صَامَ وَلَا أَلَّى


-->


#### The fix

Within the XML that makes up the entire lexicon there are 3577 instances of the sequence  &lt;foreign&gt; <span style="font-size:150%">↓</span> &lt;orth&gt;. Since it seems likely that a relatively small number of these instances would happen to fall on line-breaks, the current software "fixes" the XML as it is imported into the database and leaves a means to correct those that remain "broken". It is hoped that using this method will fix many more entries than it breaks.

The method is to insert a &lt;lb/&gt; between the  &lt;foreign&gt; and the &lt;orth&gt;. Using the above example:

    It is said in a trad., <foreign lang="ar" TEIform="foreign">mano SaA
        ma</foreign> <lb/> ↓
      <orth type="arrow" lang="ar">Ald~ahora falaA SaAma walaA A^al~aY</orth>


The fix has to be applied to the XML and then processed and loaded into the database using the provided [script](../dev-guide/scripts.md#orths). For example, the above entry (n1226) occurs in the file _A0.xml. After the XML has been edited:

    perl orths.pl --db lexicon.sqlite --node n1126 --perseus ../xml/_A0.xml


The script will apply the changes to the database.

As the author of the software gradually identifies which of the 3577 cases fall on line breaks, updates will be made available and distributed as XML files. (See [here](../other/dbupdate.md) for information how to apply partial updates.)

Please [report](../contact.md)  any cases you find.
