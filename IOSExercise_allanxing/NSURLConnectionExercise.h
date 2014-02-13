//
//  NSURLConnectionExercise.h
//  IOSExercise_allanxing
//
//  Created by AgnesT on 13-12-27.
//  Copyright (c) 2013年 allan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "allanNetWorkProtocol.h"

@interface NSURLConnectionExercise : NSObject< NSURLConnectionDelegate,NSURLConnectionDataDelegate>{
 
    NSURLConnection *_connection;
    
    NSMutableData * reciveData;
}

@property NSURL* Url;
@property NSURLConnection* Connection;
@property (retain) id<AllanNetWorkProtocol> delegate;

-(id)initWithUrl:(NSURL *) url delegate:(id<AllanNetWorkProtocol>) delegate;
-(void)StartConnection;

@end
