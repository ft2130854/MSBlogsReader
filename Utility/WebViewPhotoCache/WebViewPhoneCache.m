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
- (id)init
{
    self = [super init];
    if (self) {
        localStroe=[NSUserDefaults standardUserDefaults];
    }
    return self;
}


-(Boolean)hasDataForURL:(NSString *)pathString{
  NSObject  *image=   [localStroe objectForKey:pathString];
    if (image) {
        return YES;
    }
    return NO;
}

-(NSData *)dataForURL:(NSString *)pathString{
    NSData *data=(NSData *) [localStroe objectForKey:pathString];
    return data;
}

-(void)storeData:(NSData *)storeData forURL: (NSString *)pathString{
    [localStroe setObject:storeData forKey:pathString];
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
@end
