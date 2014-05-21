//
//  RKXMLDictionarySerialization.h
//
//  Created by Denis Zamataev on 8/14/13.
//
/**
 Provides a basic XML implementation using an adapted version
 of the XMLDictionary class by "nicklockwood" available at:
 https://github.com/nicklockwood/XMLDictionary
 
 `RKXMLDictionarySerialization` will parse an XML document into an NSDictionary
 representation suitable for use with RestKit's key-value coding based
 object mapping implementation.
 
 XML attributes are represented as keys in a dictionary.
 
 Everything related to XML to dictionary parsing is configured through
 */


#import <XMLDictionary.h>
#import <RestKit/RestKit.h>
#import "XMLWriter.h"

@interface RKXMLDictionarySerialization : NSObject <RKSerialization>

+(XMLDictionaryParser*)sharedParser;

@end
