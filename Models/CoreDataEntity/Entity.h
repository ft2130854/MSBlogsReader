//
//  Entity.h
//  MSBLogs_AllanXing
//
//  Created by Allan.xing on 14-3-28.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Entity2;

@interface Entity : NSManagedObject

@property (nonatomic, retain) NSString * articleList;
@property (nonatomic, retain) Entity2 *self1;

@end
