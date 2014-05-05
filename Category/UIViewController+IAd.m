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
        //[self requestInterstitialAdPresentation];
        
//        CGSize size=  self.contentView.frame.size;
       
        //        [self.adBannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:ADBannerContentSizeIdentifier320x50,ADBannerContentSizeIdentifier480x32, nil]];
//        [self.contentView addSubview:self.adBannerView];
      
    }
}
#pragma clang diagnostic pop
#pragma mark ADBannerViewDelegate

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    if (!self.adBannerViewIsVisible) {
        self.adBannerViewIsVisible = YES;
        CGSize size=  self.contentView.frame.size;
        banner.frame=CGRectMake(0, 0, size.width, size.height);
//        for(id tmpView in [self.contentView subviews])
//        {
//            UIView *View = (UIView *)tmpView;
//            [View removeFromSuperview];
//                break;
//        }
        [self.contentView addSubview:self.adBannerView];
        [self.contentView layoutIfNeeded];
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [self.adBannerView removeFromSuperview];
     [self.contentView layoutIfNeeded];
}
@end
