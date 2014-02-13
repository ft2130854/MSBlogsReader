//
//  Channel.h
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-1-20.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject{

}
@property(nonatomic,readonly) NSString *Name;
+(NSString *)Name;

@property (nonatomic) NSString *TitleElementName;
+(NSString *)TitleElementName;

@property (nonatomic) NSString *Title;

@property (nonatomic) NSString *DescriptionElementName;
+(NSString *)DescriptionElementName;
@property (nonatomic) NSString *Description;

@property (nonatomic) NSString *CopyRightElementName;
+(NSString *)CopyRightElementName;

@property (nonatomic) NSString *CopyRight;

@property (nonatomic) NSString *LinkElementName;
+(NSString *)LinkElementName;

@property (nonatomic) NSString *Link;

@property (nonatomic) NSString *GeneratorElementName;
+(NSString *)GeneratorElementName;

@property (nonatomic) NSString *Generator;

@property (nonatomic) NSString *ItemsElementName;
+(NSString *)ItemsElementName;

@property (nonatomic,setter = setItems:) NSMutableArray *Items;


@end
