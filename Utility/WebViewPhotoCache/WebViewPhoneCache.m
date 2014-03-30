//
//  WebViewPhoneCache.m
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-2-18.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "WebViewPhoneCache.h"
#import "Constant.h"

static WebViewPhoneCache *instance;

@implementation WebViewPhoneCache


+(WebViewPhoneCache *)sharedCache{
    if (!instance) {
        instance= [WebViewPhoneCache new];
    }
    return instance;
}



- (id)init
{
    self = [super init];
    if (self) {
        _localStroe=[NSUserDefaults standardUserDefaults];
        NSDictionary *temp=     [_localStroe dictionaryForKey:cDictionary];
        _cacheDictionary=[[NSMutableDictionary alloc] initWithDictionary:temp];
        if (!_cacheDictionary) {
            _cacheDictionary=[NSMutableDictionary new];
        }
    }
    return self;
}

- (void)setCacheDictionary:(NSMutableDictionary *)newValue {
    _cacheDictionary = newValue;
    [_localStroe setObject:_cacheDictionary forKey:cDictionary];
}

+(void)ClearCache{
    NSUserDefaults *localStroe=[NSUserDefaults standardUserDefaults];
    NSMutableDictionary *dic= [[NSMutableDictionary alloc] initWithDictionary:[localStroe dictionaryForKey:cDictionary]];
    for (NSInteger i=0; i<dic.count; i++) {
        NSString * url=  dic.allValues[i];
        [localStroe removeObjectForKey:url];
    }
    [localStroe removeObjectForKey:cDictionary];
    
}


-(Boolean)hasDataForURL:(NSString *)pathString{
    NSObject  *image=   [_localStroe objectForKey:pathString];
    if (image) {
        return YES;
    }
    return NO;
}

-(NSData *)dataForURL:(NSString *)pathString{
    NSData *data=(NSData *) [_localStroe objectForKey:pathString];
    return data;
}

-(void)storeData:(NSData *)storeData forURL: (NSString *)pathString{
    [_localStroe setObject:storeData forKey:pathString];
    NSDateFormatter *formatter=[NSDateFormatter new];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [_cacheDictionary setValue:pathString forKey:[formatter stringFromDate:[NSDate date]]];
    self.CacheDictionary=  _cacheDictionary;
}

-(NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request{
    
    NSString *pathString = [[request URL] absoluteString];
    
    if([pathString hasSuffix:@".jpg"]||[pathString hasSuffix:@".png"]){
        NSString *suffix=[pathString pathExtension];
        NSString *mimeType=  [NSString stringWithFormat:@"image/%@",suffix];
        if([[WebViewPhoneCache sharedCache] hasDataForURL:pathString]) {
            NSData *data = [[WebViewPhoneCache sharedCache] dataForURL:pathString];
            NSURLResponse *response = [[NSURLResponse alloc] initWithURL:[request URL]
                                                                MIMEType:mimeType
                                                   expectedContentLength:[data length]
                                                        textEncodingName:nil];
            return [[NSCachedURLResponse alloc] initWithResponse:response data:data];
        }
        
    }
    else{
        return[super cachedResponseForRequest:request];
    }
    return[super cachedResponseForRequest:request];
}

-(void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request{
    NSString *pathString = [[request URL] absoluteString];
    if([pathString hasSuffix:@".jpg"]||[pathString hasSuffix:@".png"]) {
        [[WebViewPhoneCache sharedCache] storeData:cachedResponse.data forURL:pathString];
    }
    else{
        [super storeCachedResponse:cachedResponse forRequest:request];
        return;
    }
    
}
- (NSMutableDictionary *)cacheDictionary {
    return _cacheDictionary;
}



@end
