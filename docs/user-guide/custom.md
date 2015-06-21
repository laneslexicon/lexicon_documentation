
######Perseus digitization

To show what the process of digitization involves, in the image below we have on the left the text from Vol 2, page 817 of the Lexicon,
showing the root <span class="arabic">خنص</span> and on the right the corresponding lines from one of the files supplied by
the Perseus project.


<div align="center"><img src="images/sidebyside.png"></img></div>

The text has been encoded in XML, a popular means of storing plain text. All that's relevant here is:

+ XML has 'tags' that appear like &lt;this&gt; and are ended like &lt;/this&gt;
+ tags can have attributes, which are name/value pairs
+ tags can be be embedded within other tags

For example,
<div align="center">
<span class="pre">
            &lt;div2 n="xnS" type="root" org="uniform" sample="complete" part="N" TEIform="div2"&gt;
</span>
</div>

This begins with a tag named "div2" and one if its attributes is named "type" and its value is "root". The tag names are not arbitrary - they are part of
the <a href="http://www.tei-c.org/index.xml">Text Encoding Initiative</a> tagset. To <a href="http://www.tei-c.org/About/mission.xml">quote</a>:

*The mission of the Text Encoding Initiative is to develop and maintain a set of high-quality guidelines for the encoding of humanities texts, and to support their use by a wide community of projects, institutions, and individuals.*


The set of tags that make up the TEI standard is large; fortunately only on small subset is used in the encoding of Lane's Lexicon.

For the "div2" tag, the value of the "type" attribute tells us that this a root, the value of the "n" attribute, "xnS", tells us what the root is.
(Within the XML all of the Arabic text is written according to the Buckwalter transliteration.)

A few lines below the "div2" tag and embedded within it, there is the first of three "entryFree" tags, each one encoding a headword. Each "entryFree" tag
has all the text that makes up its entry in the lexicon.

While the headwords (entryFree) are embedded within the root (div2), the roots themselves are embedded within a "div1" tag that looks like this:

<div align="center">
<span class="pre">
         &lt;div1 part="N" n="x" org="uniform" sample="complete" type="alphabetical letter" TEIform="div1"&gt;
</span>
</div>


In effect there is a heirarchy: div1 (letter) / div2 (root) / entryFree (headword). <br/>When the application is built, the XML files are parsed and all the
relevant information is stored in a database. Within the application the structural information re-appears in the tree structure of the contents panel with letters
at the top level and headwords at the bottom.

For each headword, the XML fragment consisting of the &lt;entryFree&gt; tag and its children are stored in the database and it this that makes it possible to customize the page.

######How a page is built

To show a root and its headwords, the relevant records from the database are read and the XML for each headword is processed and converted to HTML.
The actual appearance of the text i.e. its font, color, size etc is controlled through a stylesheet just as in any web page.


In the image below the same text is show on the left as it appears in the application, on the right is the HTML that is the source of that text:

<img src="images/entry_sidebyside.png" alt="Headword with HTML"></img>


It is the "class" entries in the HTML that control the appearance of the text. For example, the Arabic text has a class "arabic". The relevant entry from the
stylesheet is:


<span class="pre">
.arabic { font-family : Amiri;font-size : 18px}
</span>


So, to change the Arabic font used on all the pages it is simple a matter of changing 'Amiri' to the name of another font. In the same way
the English text is controlled through the class "entry":

<span class="pre">
.entry { margin-left : 30px; font-family : Droid Sans;font-size : 12px; }
</span>

The application provides a convenience method of changing these two entries via the Tools menu so it is not always necessary to edit the stylesheet. However that method
only changes the font name and size, for more fine grained control it is necessary to edit the stylesheet. It should be noted that not all HTML is supported -
for more details see <a href="http://doc.qt.io/qt-5/richtext-html-subset.html">here</a>. (The linked page refers to 'text widgets' - each headword in the application
is such a widget.
