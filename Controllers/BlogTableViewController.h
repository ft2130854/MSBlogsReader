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
@private NSInteger _index;
MBProgressHUD *hud;
}
-(IBAction)tableViewItemSelector:(id)sender;
-(IBAction)ClearCacheAction:(id)sender;
@end
