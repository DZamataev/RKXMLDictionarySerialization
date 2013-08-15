RKXMLDictionarySerialization
============================

another way of 'RestKit' XML serialization using adopted version of 'XMLDictionary' found here:
https://github.com/DZamataev/XMLDictionary

The XMLDictionary allows the user to tweak XML parsing settings on the go. 
With RKXMLDictionarySerialization use [RKXMLDictionarySerialization sharedParser] to do it.

NOTE the way you describe RestKit mapping is a bit special according to the XML node inner text. 
The inner text property of XML node is named '__text'.
So the mapping for
<root>
<node>
barbarbar
</node>
</root>

is 'node.__text'
