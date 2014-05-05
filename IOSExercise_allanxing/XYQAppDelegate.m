//
//  XYQAppDelegate.m
//  IOSExercise_allanxing
//
//  Created by AgnesT on 13-12-13.
//  Copyright (c) 2013年 allan. All rights reserved.
//

#import "XYQAppDelegate.h"
#import "mtTableView.h"
#import "NSURLConnectionExercise.h"
#import "AllanXmlParse.h"
#import "GDataXMLNode.h"
#import "Channel.h"
#import "WebViewPhoneCache.h"
#import <ShareSDK/ShareSDK.h>
#import "Constant.h"
#import <iAd/UIViewControlleriAdAdditions.h>


@interface XYQAppDelegate ()<UITabBarControllerDelegate,UINavigationBarDelegate>


@end

@implementation XYQAppDelegate

@synthesize MainTabViewController;


UIView *myView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSURLCache *URLCache = [[WebViewPhoneCache alloc] initWithMemoryCapacity:4 * 1024 * 1024
                                                         diskCapacity:20 * 1024 * 1024
                                                             diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
    
    [ShareSDK registerApp:shareSDK_Key];
    //sina
    [ShareSDK connectSinaWeiboWithAppKey:@"3201194191"
                               appSecret:@"0334252914651e8f76bad63337b3b78f"
                             redirectUri:@"http://appgo.cn"];
    //twitter
    [ShareSDK connectTwitterWithConsumerKey:@"mnTGqtXk0TYMXYTN7qUxg"
                             consumerSecret:@"ROkFqr8c3m1HXqS3rm3TJ0WkAJuwBOSaWhPbZ9Ojuc"
                                redirectUri:@"http://www.sharesdk.cn"];
    //facebook
    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
                              appSecret:@"38053202e1a5fe26c80c753071f0b573"];
    //linkedin
    [ShareSDK connectLinkedInWithApiKey:@"ejo5ibkye3vo"
                              secretKey:@"cC7B2jpxITqPLZ5M"
                            redirectUri:@"http://sharesdk.cn"];
   //    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
//       [self.window makeKeyAndVisible];
    [UIViewController prepareInterstitialAds];
    
    return YES;
}

-(IBAction)buttionClick:(id)ovject{
    
       
}



-(IBAction)OutsideAction:(id)sender{
//     NSURLConnectionExercise *ex=[NSURLConnectionExercise new];
//   NSURLConnection *con=  [ex StartConnection];
}


-(void)text1{
    self.window.backgroundColor = [UIColor whiteColor];
    myView=[[UIView alloc ] initWithFrame:[self.window bounds]];
    mtTableView *tbview=[[mtTableView alloc] initWithFrame:CGRectMake(20,20,200,200) style:UITableViewStyleGrouped];
    [tbview setBackgroundColor:[UIColor clearColor]];
    [tbview setBackgroundView:Nil];
    
    [myView addSubview:tbview];
    myView.backgroundColor=[UIColor yellowColor];
    [self.window addSubview:myView];

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
