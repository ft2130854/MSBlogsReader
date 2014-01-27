//
//  Channel.m
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-1-20.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "Channel.h"

@implementation Channel

const NSString *GeneratorElementName=@"generator";
const NSString *ItemsElementName=@"item";

@dynamic TitleElementName;
+(NSString *)TitleElementName{
return @"title";
}

@dynamic DescriptionElementName;
+(NSString *)DescriptionElementName{
    return @"description";
}

@dynamic CopyRightElementName;
+(NSString *)CopyRightElementName{
    return @"copyright";
}

@dynamic LinkElementName;
+(NSString *)LinkElementName{
    return @"link";
}



@end
