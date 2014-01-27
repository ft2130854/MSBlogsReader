//
//  LXFAppDelegate.m
//  IOSExercise_allanxing
//
//  Created by AgnesT on 13-12-13.
//  Copyright (c) 2013年 allan. All rights reserved.
//

#import "LXFAppDelegate.h"
#import "mtTableView.h"
#import "NSURLConnectionExercise.h"
#import "AllanXmlParse.h"
#import "GDataXMLNode.h"
#import "Channel.h"

@implementation LXFAppDelegate

@synthesize myViewController;


UIView *myView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
       [self.window makeKeyAndVisible];
    return YES;
}

-(IBAction)buttionClick:(id)ovject{
    
    NSURLConnectionExercise *ex=[[NSURLConnectionExercise alloc] initWithUrl:[[NSURL alloc] initWithString:@"http://sxp.microsoft.com/feeds/3.0/devblogs"]delegate:self];
       [ex StartConnection];
    
    
}

-(void) HttpStringCallBack:(NSString *)string{
    NSError *error;
    GDataXMLDocument *doc=[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:&error];
 NSArray *array=[[doc rootElement] elementsForName:[Channel TitleElementName]];
//    AllanXmlParse *parse=[[AllanXmlParse alloc] initWithString:string];
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