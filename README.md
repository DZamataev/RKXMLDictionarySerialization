RKXMLDictionarySerialization
============================

another way of 'RestKit' XML serialization using [nicklockwood`s XMLDictionary](https://github.com/nicklockwood/XMLDictionary)

The XMLDictionary allows the user to tweak XML parsing settings on the go. 
With RKXMLDictionarySerialization use ``` [RKXMLDictionarySerialization sharedParser] ``` to do it.

NOTE the way you describe RestKit mapping is a bit special according to the XML node inner text. 
The inner text property of XML node is named '__text'.
Thats made in order to make XML parsing uniquely, so that no "attribute name vs inner node name" collision can happen.

The mapping for
```
<root>
  <node>
    barbarbar
  </node>
</root>
```

becomes
```
node.__text
```


Installation
============================

Cocoapods
----------------------------
Podfile
```
pod 'RKXMLDictionarySerialization'
```


Usage
=============================

Once installed, register the serialization in your model class (or wherever you handle RestKit setup):
```
#import "RKXMLDictionarySerialization.h"

[RKMIMETypeSerialization registerClass:[RKXMLDictionarySerialization class] forMIMEType:RKMIMETypeTextXML];
[RKMIMETypeSerialization registerClass:[RKXMLDictionarySerialization class] forMIMEType:RKMIMETypeXML];
```

Note that you may register the class for more than one MIME Type or use an NSRegularExpression that matches the MIME Type that you wish to register. For more details, review the [API Documentation](http://restkit.org/api/latest/Classes/RKMIMETypeSerialization.html).

Main idea
============================

The most useful feature and the reason this solution exists is that RKXMLReaderSerialization (https://github.com/RestKit/RKXMLReaderSerialization)
got problems with collision between xml node attribute names and inner node names.

Such XML
```
<root>
  <node body='regular'>
    <body>
      foobar
    </body>
  </node>
</root>
```
is nearly impossible to map correctly with RKXMLReaderSerialization and easily handled with RKXMLDictionarySerialization

And after parsing with XMLReader or without tweaking XMLDictionary settings it just becomes something strange:
```
root =     {
        node =         {
            body =             (
                regular,
                                {
                    "__text" = foobar;
                }
            );
        };
    };
```

But with XMLDictionarySerialization you`ve got XMLDictionary configured to prefix attribute names by default and it parses it correctly
```
root =     {
        node =         {
            "_body" = regular;
            body =             {
                "__text" = foobar;
            };
        };
    };
```

so the object mapping described via RestKit should pay attention to the attribute names because prefixing is enabled by default.

---------------

[![follow button](http://dzamataev.github.io/images/twitter_follow.png)](https://twitter.com/DZamataev)

[![endorse](https://api.coderwall.com/dzamataev/endorsecount.png)](https://coderwall.com/dzamataev)

