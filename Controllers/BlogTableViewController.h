//
//  BlogTableViewController.h
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-1-27.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Channel.h"
#import "MBProgressHUD.h"
#import "AllanNetWorkProtocol.h"

@interface BlogTableViewController: UITableViewController <AllanNetWorkProtocol>{
@public Channel *_channel;
@public Channel *_httpTempChannel;
@private NSInteger _index;
    

MBProgressHUD *ProgressBar;
}

@property (assign,nonatomic,getter = GetRefreshDateTime,setter = SetRefreshDateTime:)NSDate* RefreshDateTime;
-(NSDate *)GetRefreshDateTime;
-(void)SetRefreshDateTime:(NSDate* )value;

-(IBAction)tableViewItemSelector:(id)sender;
-(IBAction)ClearCacheAction:(id)sender;
@end
