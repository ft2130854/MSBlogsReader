//
//  Entity2.h
//  MSBLogs_AllanXing
//
//  Created by Allan.xing on 14-3-28.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entity2 : NSManagedObject

@property (nonatomic, retain) NSString * attribute;
@property (nonatomic, retain) NSString * attribute1;
@property (nonatomic, retain) NSManagedObject *relationship;

@end
