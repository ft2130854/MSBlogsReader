//
//  NSURLConnectionExercise.m
//  IOSExercise_allanxing
//
//  Created by AgnesT on 13-12-27.
//  Copyright (c) 2013年 allan. All rights reserved.
//

#import "NSURLConnectionExercise.h"
#import "allanNetWorkProtocol.h"


@implementation NSURLConnectionExercise





- (id)init
{
    self = [super init];
    if (self) {
        _connection=[[NSURLConnection alloc] init];
        reciveData=[NSMutableData dataWithCapacity:0];
    
    }
    return self;
}


-(id)initWithUrl:(NSURL *) url delegate:(id<AllanNetWorkProtocol> ) delegate{
    self=[self init];
    if (self) {
        _Url=url;
        self.delegate=delegate;
    }
    return self;
}
@synthesize connection;
 static   NSURLRequest *request;
-(NSURLRequest *)CreateRequest{
    if (_Url) {
        //throw exception
    }
    if (!request) {
        
        request =[NSURLRequest requestWithURL:_Url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    }
  
    return request;
    
}
#pragma mark - protocol
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [reciveData setLength:0];
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    int code = [httpResponse statusCode];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    connection=nil;
    reciveData=nil;
    //and inform user
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [reciveData appendData:data];
 
   
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSString *string=[[NSString alloc] initWithData:reciveData encoding:NSUTF8StringEncoding];
    id<AllanNetWorkProtocol>  delegate;
    delegate = [self delegate];
    if ([delegate respondsToSelector:@selector(HttpStringCallBack:)]) {
        [self.delegate HttpStringCallBack:string];
    }

    connection=nil;
    reciveData=nil;
}

-(void)StartConnection{
    NSURLConnection * connection=  [[NSURLConnection alloc] initWithRequest:[self CreateRequest] delegate:self];
    if (!connection) {//the connection failed;
        reciveData=nil;
    }
    [connection start];
}

@end
