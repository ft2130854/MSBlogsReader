//
//  AllanXmlParse.m
//  IOSExercise_allanxing
//
//  Created by AgnesT on 14-1-14.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "AllanXmlParse.h"

@implementation AllanXmlParse



- (id)initWithString:(NSString *)string
{
    self = [self init];
    if (self) {
        parser=[[NSXMLParser alloc] initWithData:[string dataUsingEncoding:NSUTF8StringEncoding]];
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:YES];
        BOOL success=[parser parse];
        
        
    }
    return self;
}

#

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    
}


-(void)parserDidStartDocument:(NSXMLParser *)parser{
    
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    
}

@end
