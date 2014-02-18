//
//  BlogTableViewController.h
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-1-27.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Channel.h"

@interface BlogTableViewController : UITableViewController{
@public Channel *_channel;
@private NSInteger _index;
}
-(IBAction)tableViewItemSelector:(id)sender;
@end
