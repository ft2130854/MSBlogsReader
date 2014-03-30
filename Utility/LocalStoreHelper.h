//
//  LocalStoreHelper.h
//  MSBLogs_AllanXing
//
//  Created by allanxing on 3/21/14.
//  Copyright (c) 2014 allan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalStoreHelper : UIViewController
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

-(void)saveContext;
-(NSArray *)fetchSomeDataForModel:(NSString *)modelName;
-(void)somemethod:(NSString *) s;
@end
