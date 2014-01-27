//
//  AllanXmlParse.h
//  IOSExercise_allanxing
//
//  Created by AgnesT on 14-1-14.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllanXmlParse : NSObject<NSXMLParserDelegate>{
    NSXMLParser * parser;
}

- (id)initWithString:(NSString *)string;
@end
