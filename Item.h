//
//  Item.h
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-1-20.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic)NSString *Title;
@property (nonatomic)NSString *Description;
@property (nonatomic)NSString *PubDate;
@property (nonatomic)NSString *Guid;
@property (nonatomic)NSString *Link;
@property (nonatomic)NSString *Author;
@property (nonatomic)NSString *Comments;
@property (nonatomic)NSMutableArray *Category;
@property (nonatomic)NSString *ChannelId_sxp;
@property (nonatomic)NSString *FeedId_sxp;
@property (nonatomic)NSString *PublishId_sxp;
@property (nonatomic)NSString *AssetId_sxp;
@property (nonatomic)NSString *Author_sxp;
@property (nonatomic)NSString *Comments_sxp;
@property (nonatomic)NSString *ContentType_sxp;



@property (nonatomic,readonly)NSString *TitleElementName;
@property (nonatomic,readonly)NSString *DescriptionElementName;
@property (nonatomic,readonly)NSString *PubDateElementName;
@property (nonatomic,readonly)NSString *GuidElementName;
@property (nonatomic,readonly)NSString *LinkElementName;
@property (nonatomic,readonly)NSString *AuthorElementName;
@property (nonatomic,readonly)NSString *CommentsElementName;
@property (nonatomic,readonly)NSMutableArray *CategoryElementName;
@property (nonatomic,readonly)NSString *ChannelId_sxpElementName;
@property (nonatomic,readonly)NSString *FeedId_sxpElementName;
@property (nonatomic,readonly)NSString *PublishId_sxpElementName;
@property (nonatomic,readonly)NSString *AssetId_sxpElementName;
@property (nonatomic,readonly)NSString *Author_sxpElementName;
@property (nonatomic,readonly)NSString *Comments_sxpElementName;
@property (nonatomic,readonly)NSString *ContentType_sxpElementName;


+(NSString *)TitleElementName;
+(NSString *)DescriptionElementName;
+(NSString *)PubDateElementName;
+(NSString *)GuidElementName;
+(NSString *)LinkElementName;
+(NSString *)AuthorElementName;
+(NSString *)CommentsElementName;
+(NSString *)CategoryElementName;
+(NSString *)ChannelId_sxpElementName;
+(NSString *)FeedId_sxpElementName;
+(NSString *)PublishId_sxpElementName;
+(NSString *)AssetId_sxpElementName;
+(NSString *)Author_sxpElementName;
+(NSString *)Comments_sxpElementName;
+(NSString *)ContentType_sxpElementName;
@end
