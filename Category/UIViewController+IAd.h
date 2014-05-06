//
//  UIViewController+IAd.h
//  MSBLogs_AllanXing
//
//  Created by Allan.xing on 14-5-4.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/ADBannerView.h>
#import "DetailViewController.h"

@interface UIViewController(){
 
}
    // After the interface
    @property (weak,nonatomic) IBOutlet UIView *contentView;
    @property (nonatomic, retain) ADBannerView* adBannerView;
    @property (nonatomic) BOOL adBannerViewIsVisible;
@end

@interface UIViewController (IAd)<ADBannerViewDelegate>

- (void)layoutAnimated:(BOOL)animated;

@end
