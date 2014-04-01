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

@interface BlogTableViewController : UITableViewController{
@public Channel *_channel;
@public Channel *_httpTempChannel;
@private NSInteger _index;
MBProgressHUD *ProgressBar;
}
@property (assign, nonatomic) BOOL ascending;
-(IBAction)tableViewItemSelector:(id)sender;
-(IBAction)ClearCacheAction:(id)sender;
@end
