//
//  JHFourmItem.m
//  精弘论坛
//
//  Created by Dikey on 9/24/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHFourmItem.h"
#import "JHBoardItem.h"

@implementation JHFourmItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _board_list = [NSMutableArray array];
    }
    return self;
}

-(void) setValue:(id)value forKey:(NSString *)key
{
    //假如这里是一个Array...含有子板块，我们需要特殊处理
    if([key isEqualToString:@"board_list"])
    {
        if (!_board_list) {
            _board_list = [NSMutableArray new];
        }
        NSArray *boardArray = (NSArray *)value;
        
        for (NSMutableDictionary *boardDic in boardArray) {
            [_board_list addObject:[[JHBoardItem alloc]initWithDictionary:boardDic]];
        }
    }
    else
        [super setValue:value forKey:key];
}

@end
