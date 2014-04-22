//
//  Channel.m
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-1-20.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "Channel.h"
#import "GDataXMLNode.h"
#import "Item.h"

@implementation Channel

@dynamic Name;
+(NSString *)Name{
    return @"channel";
}

@dynamic TitleElementName;
+(NSString *)TitleElementName{
return @"title";
}

@dynamic DescriptionElementName;
+(NSString *)DescriptionElementName{
    return @"description";
}

@dynamic CopyRightElementName;
+(NSString *)CopyRightElementName{
    return @"copyright";
}

@dynamic LinkElementName;
+(NSString *)LinkElementName{
    return @"link";
}

@dynamic GeneratorElementName;
+(NSString *)GeneratorElementName{
    return @"generator";
}

@dynamic ItemsElementName;
+(NSString *)ItemsElementName{
    return @"item";
}

-(void) setItems:(NSMutableArray *)Items{
    if (Items.count) {
        NSMutableArray * tempItems=[NSMutableArray new];
        if ([[Items firstObject]isKindOfClass:[GDataXMLElement class]]) {
            for (GDataXMLElement *element in Items) {
                Item *item=[Item new];
                item.Title=[[element elementsForName:[Item TitleElementName]][0]stringValue];
                item.Description=[[element elementsForName:[Item DescriptionElementName]][0]stringValue];
                item.PubDate=[[element elementsForName:[Item PubDateElementName]][0] stringValue];
                [tempItems addObject:item];
            }
            _Items=tempItems;
        }
    }
}
@end
