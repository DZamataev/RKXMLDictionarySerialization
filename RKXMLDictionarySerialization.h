//
//  RKXMLDictionarySerialization.h
//
//  Created by Denis Zamataev on 8/14/13.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
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


#import "XMLDictionary.h"
#import <RestKit/RestKit.h>

@interface RKXMLDictionarySerialization : NSObject <RKSerialization>

+(XMLDictionaryParser*)sharedParser;

@end
