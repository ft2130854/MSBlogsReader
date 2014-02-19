//
//  WebViewPhoneCache.m
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-2-18.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "WebViewPhoneCache.h"

@implementation WebViewPhoneCache

+(WebViewPhoneCache *)sharedCache{
    return [WebViewPhoneCache new];
}

-(Boolean)hasDataForURL:(NSString *)pathString{
    return YES;
}

-(NSData *)dataForURL:(NSString *)pathString{
    return [NSData new];
}

-(void)storeData:(NSData *)storeData (NSString *)pathString{
    
}

-(NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request{
    
    NSString *pathString = [[request URL] absoluteString];
    
    if(![pathString hasSuffix:@".jpg"]) {
        return[super cachedResponseForRequest:request];
    }
    
    if([[WebViewPhoneCache sharedCache] hasDataForURL:pathString]) {
        NSData *data = [[WebViewPhoneCache sharedCache] dataForURL:pathString];
        NSURLResponse *response = [[NSURLResponse alloc] initWithURL:[request URL]
                                                             MIMEType:@"image/jpg"
                                                expectedContentLength:[data length]
                                                     textEncodingName:nil];
        return [[NSCachedURLResponse alloc] initWithResponse:response data:data];
    }
    return[super cachedResponseForRequest:request];
}

-(void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request{
    NSString *pathString = [[request URL] absoluteString];
    if(![pathString hasSuffix:@".jpg"]) {
        [super storeCachedResponse:cachedResponse forRequest:request];
        return;
    }
    
    [[WebViewPhoneCache sharedCache] storeData:cachedResponse.data forURL:pathString];

}
@end
