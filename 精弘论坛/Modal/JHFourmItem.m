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

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_board_category_id forKey:@"board_category_id"];
    [aCoder encodeObject:_board_category_name forKey:@"board_category_name"];
    [aCoder encodeObject:_board_category_type forKey:@"board_category_type"];
    [aCoder encodeObject:_board_list forKey:@"board_list"];
    
    NSLog(@"encode object successfully");
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _board_category_id =[aDecoder decodeObjectForKey:@"board_category_id"] ;
        _board_category_name =[aDecoder decodeObjectForKey:@"board_category_name"] ;
        _board_category_type = [aDecoder decodeObjectForKey:@"board_category_type"];
        _board_list = [aDecoder decodeObjectForKey:@"board_list"];
    }
    return self;
    
    NSLog(@"decode object successfully");

}



@end
