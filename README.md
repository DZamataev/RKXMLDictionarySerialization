RKXMLDictionarySerialization
============================

another way of 'RestKit' XML serialization using adopted version of 'XMLDictionary' found here:
https://github.com/DZamataev/XMLDictionary

The XMLDictionary allows the user to tweak XML parsing settings on the go. 
With RKXMLDictionarySerialization use ``` [RKXMLDictionarySerialization sharedParser] ``` to do it.

NOTE the way you describe RestKit mapping is a bit special according to the XML node inner text. 
The inner text property of XML node is named '__text'.

So the mapping for
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
pod 'RestKit', '~> 0.20.3'
pod 'XMLDictionary', :git => 'https://github.com/DZamataev/XMLDictionary.git', :branch => 'master'
pod 'RKXMLDictionarySerialization', :git => 'https://github.com/DZamataev/RKXMLDictionarySerialization.git', :branch => 'master'
```

From source
----------------------------
1. Add the source files to your project

2. Install the dependency which is a fork of XMLDictionary

The necessary fork is here https://github.com/DZamataev/XMLDictionary

*Pull request sent to [the original XMLDictionary](https://github.com/nicklockwood/XMLDictionary)*

=============================

Once installed, register the serialization in your app delegate (or wherever you handle RestKit setup):
```
#import "RKXMLDictionarySerialization.h"

[RKMIMETypeSerialization registerClass:[RKXMLDictionarySerialization class] forMIMEType:RKMIMETypeTextXML];
[RKMIMETypeSerialization registerClass:[RKXMLDictionarySerialization class] forMIMEType:RKMIMETypeXML];
```

Note that you may register the class for more than one MIME Type or use an NSRegularExpression that matches the MIME Type that you wish to register. For more details, review the [API Documentation](http://restkit.org/api/latest/Classes/RKMIMETypeSerialization.html).

What it does
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
is nearly impossible to map correctly with RKXMLReaderSerialization and RKXMLDictionarySerialization (without tweaking settings) also.
And after parsing on default settings looks like this:
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

but with RKXMLDictionarySerialization you are able to tweak XMLDictionary parser settings like this:
```
[RKXMLDictionarySerialization sharedParser].attributesMode = XMLDictionaryAttributesModePrefixed;
```
and you will get the resulting dictionary like this:
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

so the object mapping described via RestKit should pay attention to the attribute names if prefixing is enabled.

---------------

[![follow button](http://dzamataev.github.io/images/twitter_follow.png)](https://twitter.com/DZamataev)

