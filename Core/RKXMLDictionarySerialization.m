//
//  RKXMLDictionarySerialization.m
//
//  Created by Denis Zamataev on 8/14/13.
//
//

#import "RKXMLDictionarySerialization.h"

@implementation RKXMLDictionarySerialization
+(XMLDictionaryParser*) sharedParser
{
    static dispatch_once_t pred;
    static XMLDictionaryParser *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[XMLDictionaryParser alloc] init];
        shared.attributesMode = XMLDictionaryAttributesModePrefixed;
        shared.nodeNameMode = XMLDictionaryNodeNameModeNever;
        shared.wrapRootNode = YES;
        shared.collapseTextNodes = NO;
		shared.stripEmptyNodes = NO;
    });
    return shared;
}

+ (id)objectFromData:(NSData *)data error:(NSError **)error
{
    id result = [[RKXMLDictionarySerialization sharedParser] dictionaryWithData:data];
//    NSLog(@"%@",result);
    return result;
}

+ (NSData *)dataFromObject:(id)object error:(NSError **)error
{
    NSString *xmlString = [XMLWriter XMLStringFromDictionary:object withHeader:YES];
//    NSLog(@"%@", xmlString);
    NSData *data = [xmlString dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}


@end