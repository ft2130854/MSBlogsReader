//
//  CommonLib.m
//  MSBLogs_AllanXing
//
//  Created by Allan.xing on 14-4-21.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "CommonLib.h"

@implementation CommonLib

+(NSString *)getDateString{
    NSDateFormatter *formatter=[NSDateFormatter new];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    return [formatter stringFromDate:[NSDate date]];
}

+(NSDate *)DateWithString:(NSString *)string{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // Does the string include a week day?
        NSString *week = @"";
        if ([string rangeOfString:@","].location != NSNotFound) {
            week = @"EEE, ";
        }
        // Does the string include seconds?
        NSString *seconds = @"";
        if ([[string componentsSeparatedByString:@":"] count] == 3) {
            seconds = @":ss";
        }
        [formatter setDateFormat:[NSString stringWithFormat:@"%@dd MMM yyyy HH:mm%@ z",week,seconds]];
        return [formatter dateFromString:string];
}


@end
