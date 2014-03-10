//
//  WebViewPhoneCache.h
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-2-18.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import <Foundation/Foundation.h>
#define cDictionary @"CacheDictionary"
@interface WebViewPhoneCache : NSURLCache{
    NSUserDefaults *_localStroe;
    NSMutableDictionary *_cacheDictionary;
    WebViewPhoneCache *instance;
}
@property(nonatomic,setter = setCacheDictionary:) NSMutableDictionary *CacheDictionary;

+(WebViewPhoneCache *)sharedCache;
+(void)ClearCache;
-(Boolean)hasDataForURL:(NSString *)pathString;
-(void)storeData:(NSData *)storeData forURL: (NSString *)pathString;

- (void)setCacheDictionary:(NSMutableDictionary *)newValue;

@end
