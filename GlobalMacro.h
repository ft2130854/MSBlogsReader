//
//  GlobalMacro.h
//  MSBLogs_AllanXing
//
//  Created by Allan.xing on 14-4-25.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

