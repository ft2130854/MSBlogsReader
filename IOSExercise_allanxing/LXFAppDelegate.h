//
//  LXFAppDelegate.h
//  IOSExercise_allanxing
//
//  Created by AgnesT on 13-12-13.
//  Copyright (c) 2013年 allan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXFAppDelegate : UIResponder <UIApplicationDelegate>{

    
}

@property (strong, nonatomic) IBOutlet UIWindow *window;

@property(strong,nonatomic) UIViewController *myViewController;

-(IBAction)buttionClick:(id)ovject;

@end
