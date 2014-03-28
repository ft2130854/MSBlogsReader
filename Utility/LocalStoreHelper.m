//
//  LocalStoreHelper.m
//  MSBLogs_AllanXing
//
//  Created by allanxing on 3/21/14.
//  Copyright (c) 2014 allan. All rights reserved.
//

#import "LocalStoreHelper.h"


@implementation LocalStoreHelper{
    
}
@synthesize managedObjectContext;
- (id) init {
    self = [super init];
    if (self) {
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSString *plistPath;
        NSString *rootPath =
        [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                             NSUserDomainMask, YES) objectAtIndex:0];
        plistPath = [rootPath stringByAppendingPathComponent:@"Data.plist"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
            plistPath = [[NSBundle mainBundle] pathForResource:@"Data"
                                                        ofType:@"plist"];
        }
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                              propertyListFromData:plistXML
                                              mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                              format:&format
                                              errorDescription:&errorDesc];
        if (!temp) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
//        self.personName = [temp objectForKey:@"Name"];
//        self.phoneNumbers = [NSMutableArray arrayWithArray:[temp
//                                                            objectForKey:@"Phones"]];
    }
    return self;
}

-(void)somemethod:(NSString *) s{
    NSManagedObjectContext *context = [self managedObjectContext];
//    
//    NSManagedObject *failedBankInfo = [NSEntityDescription
//                                       insertNewObjectForEntityForName:@"FailedBankInfo"
//                                       inManagedObjectContext:context];
//    [failedBankInfo setValue:@"Test Bank" forKey:@"name"];
//    [failedBankInfo setValue:@"Testville" forKey:@"city"];
//    [failedBankInfo setValue:@"Testland" forKey:@"state"];
//    NSManagedObject *failedBankDetails = [NSEntityDescription
//                                          insertNewObjectForEntityForName:@"FailedBankDetails"
//                                          inManagedObjectContext:context];
//    [failedBankDetails setValue:[NSDate date] forKey:@"closeDate"];
//    [failedBankDetails setValue:[NSDate date] forKey:@"updateDate"];
//    [failedBankDetails setValue:[NSNumber numberWithInt:12345] forKey:@"zip"];
//    [failedBankDetails setValue:failedBankInfo forKey:@"info"];
//    [failedBankInfo setValue:failedBankDetails forKey:@"details"];
//    NSError *error;
//    if (![context save:&error]) {
//        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
//    }

}
@end
