//
//  ArticleTableViewCell.m
//  MSBLogs_AllanXing
//
//  Created by Allan.xing on 14-4-28.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "ArticleTableViewCell.h"

@implementation ArticleTableViewCell

+ (UINib*)nib
{
    // singleton implementation to get a UINib object
    static dispatch_once_t pred = 0;
    __strong static UINib* _sharedNibObject = nil;
    dispatch_once(&pred, ^{
        _sharedNibObject = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    });
    return _sharedNibObject;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
     self=[[[[self class] nib] instantiateWithOwner:nil options:nil] objectAtIndex:0];
//    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//   
//    }
    return self;
}

@end
