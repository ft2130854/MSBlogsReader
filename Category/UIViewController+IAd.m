//
//  UIViewController+IAd.m
//  MSBLogs_AllanXing
//
//  Created by Allan.xing on 14-5-4.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "UIViewController+IAd.h"
#import <iAd/iAd.h>
#import <iAd/UIViewControlleriAdAdditions.h>

@implementation UIViewController (IAd)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
-(void)viewDidLoad{
    if(self.class==[DetailViewController class]&&self.contentView){
        self.adBannerView=[[ADBannerView alloc]initWithAdType:ADAdTypeBanner];
        self.adBannerView.delegate=self;
        self.canDisplayBannerAds = YES;
        self.interstitialPresentationPolicy=ADInterstitialPresentationPolicyAutomatic;
        [self.view addSubview:self.adBannerView];
        //[self requestInterstitialAdPresentation];
        
        //        CGSize size=  self.contentView.frame.size;
        
        //        [self.adBannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:ADBannerContentSizeIdentifier320x50,ADBannerContentSizeIdentifier480x32, nil]];
        //        [self.contentView addSubview:self.adBannerView];
        
    }
}
-(void)viewDidAppear:(BOOL)animated{
    if(self.class==[DetailViewController class]&&self.contentView){
        [self layoutAnimated:NO];
    }
}
#pragma clang diagnostic pop
#pragma mark ADBannerViewDelegate

- (void)layoutAnimated:(BOOL)animated
{
    // As of iOS 6.0, the banner will automatically resize itself based on its width.
    // To support iOS 5.0 however, we continue to set the currentContentSizeIdentifier appropriately.
    CGRect contentFrame = self.contentView.bounds;
    
    //    if (contentFrame.size.width < contentFrame.size.height) {
    //        self.adBannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    //    } else {
    //        self.adBannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    //    }
    
    CGRect bannerFrame = self.adBannerView.frame;
    if (self.adBannerView.bannerLoaded) {
        contentFrame.size.height -= (self.adBannerView.frame.size.height+self.tabBarController.tabBar.frame.size.height);
        bannerFrame.origin.y = contentFrame.size.height;
    } else {
        bannerFrame.origin.y = contentFrame.size.height;
    }
    contentFrame.size.height+=self.tabBarController.tabBar.frame.size.height;
    [UIView animateWithDuration:animated ? 0.25 : 0.0 animations:^{

        ((UIWebView *)self.contentView).scrollView.frame = contentFrame;
        [self.contentView layoutIfNeeded];
        self.adBannerView.frame = bannerFrame;
        NSLog(@"%f",((UIWebView *)self.contentView).scrollView.frame.size.height);
    }];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    [self layoutAnimated:YES];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [self layoutAnimated:YES];
}
@end
