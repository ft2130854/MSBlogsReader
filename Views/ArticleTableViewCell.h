//
//  ArticleTableViewCell.h
//  MSBLogs_AllanXing
//
//  Created by Allan.xing on 14-4-28.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleTableViewCell : UITableViewCell{
    
}
@property (weak,nonatomic)IBOutlet UILabel *LB_Title;
@property (weak,nonatomic)IBOutlet UILabel *LB_PubTime;
@property (weak,nonatomic)IBOutlet UIImage *IM_Avatar;
@end
