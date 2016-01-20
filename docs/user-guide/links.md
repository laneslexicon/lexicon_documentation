
####Unresolved links

Message box pops up (graphicsentry.cpp:525 for text)

###When drag and drop to fix link, move the cursor to the beginning of the underline (its a bit sensitive)


####How to change the style of the arrow

####Exporting

####Importing

####The word order problem

To understand the difficulty we need to look at the details of the markup applied to the original text.
(The following examples are take from Volume 1, Page 84.) Consider the Arabic text in this excerpt:


<div align="center"><img src="/images/foreign_isolated_50.png"/></div>


<br/>
The Arabic part of this text becomes:

    <foreign lang="ar" TEIform="foreign">laA A=luwka nuSoHFA</foreign>


The three Arabic words are transliterated and wrapped in &lt;foreign&gt; tags in the correct word order.


Lane's cross-references, such as this one:

<div align="center"><img src="/images/orth_isolated_50.png"></img></div>

becomes

    read ↓
    <orth type="arrow" lang="ar">walaA yataA^al~a</orth>, but this disagrees


Again the Arabic words are transliterated but this time wrapped in &lt;orth&gt; tags.


When there is a cross-reference within a piece of text like this:

<div align="center"><img src="/images/foreign_orth_50.png"></img></div>

it becomes:

    in the saying <foreign lang="ar" TEIform="foreign">A^uwluw AlofaDoli minokumo</foreign> ↓
      <orth type="arrow" lang="ar">walaA yaA^otali</orth>, in the Kur [xxiv. 22]


We now have two adjacent tags, one &lt;foreign&gt; and one &lt;orth&gt;. Notice the word order: the words for each tag are in
the correct order. Since this is one continuous piece of Arabic, if we start with the rightmost &lt;orth&gt; and read its contents followed by the &lt;foreign&gt; we get the correct word order.

But consider this:

<div align="center"><img src="/images/foreign_lb_orth_50.png"></img></div>


    It is said in a trad., <foreign lang="ar" TEIform="foreign">mano SaAma</foreign>  ↓
      <orth type="arrow" lang="ar">Ald~ahora falaA SaAma walaA A^al~aY</orth>


It is the same sequence: a &lt;foreign&gt; followed by an &lt;orth&gt;,  each with the correct word order. This time if we reconstruct the text by starting with the &lt;orth&gt; we do not get the correct word order. In effect, some information has been lost - the visual line break in the text told us that the text starts with &lt;foreign&gt;.
