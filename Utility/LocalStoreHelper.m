//
//  LocalStoreHelper.m
//  MSBLogs_AllanXing
//
//  Created by allanxing on 3/21/14.
//  Copyright (c) 2014 allan. All rights reserved.
//

#import "LocalStoreHelper.h"

@implementation LocalStoreHelper

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
@end
