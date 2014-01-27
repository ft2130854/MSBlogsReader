//
//  mtTableView.m
//  IOSExercise_allanxing
//
//  Created by AgnesT on 13-12-18.
//  Copyright (c) 2013年 allan. All rights reserved.
//

#import "mtTableView.h"

@implementation mtTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self=[super initWithFrame:frame style:style];
    if (self) {
    self.dataSource=self;
    self.delegate=self;
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableview cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell= [tableview dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    [cell.textLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
 
    cell.textLabel.text=CellIdentifier;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    insl=10;
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
