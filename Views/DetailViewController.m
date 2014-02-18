//
//  DetailViewController.m
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-2-11.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize ArticleItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (webView) {
        if (ArticleItem) {
            self.title=ArticleItem.Title;
            [webView loadHTMLString:ArticleItem.Description baseURL:NULL];
        }
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
