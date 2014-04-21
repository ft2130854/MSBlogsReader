//
//  CommonLib.m
//  MSBLogs_AllanXing
//
//  Created by Allan.xing on 14-4-21.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "CommonLib.h"

@implementation CommonLib

-(NSString *)getDateString{
    NSDateFormatter *formatter=[NSDateFormatter new];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    return [formatter stringFromDate:[NSDate date]];
}

@end
