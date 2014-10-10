//
//  JHTopicDetailItem.m
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHTopicDetailItem.h"



@implementation JHTopicDetailItem

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void) setValue:(id)value forKey:(NSString *)key
{
    //假如这里是一个Array...含有子板块，我们需要特殊处理
    if([key isEqualToString:@"reply_content"])
    {
        NSArray *tempArray = (NSArray *)value;
        if (tempArray!=nil && tempArray.count!=0) {
            NSDictionary *dic = tempArray[0];
            _infor = [dic objectForKey:@"infor"];
            _type = [[dic objectForKey:@"type"]intValue];
            _cellHeight = [self calculateCellHeight:_infor];
        }
    }
    else
        [super setValue:value forKey:key];
}




@end
