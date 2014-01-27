//
//  Channel.m
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-1-20.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "Channel.h"

@implementation Channel

@dynamic Name;
+(NSString *)Name{
    return @"channel";
}

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

@dynamic GeneratorElementName;
+(NSString *)GeneratorElementName{
    return @"generator";
}

@dynamic ItemsElementName;
+(NSString *)ItemsElementName{
    return @"item";
}


@end
