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
    
    if([key isEqualToString:@"board_list"])
    {
        if (!_board_list) {
            _board_list = [NSMutableArray new];
        }
        
        NSArray *boardArray = (NSArray *)value;
        
        for (int i =0; i< boardArray.count; i++) {
            JHBoardItem *boardItem = [[JHBoardItem alloc]initWithDictionary:(NSDictionary*)boardArray[i]];
            
            [_board_list addObject:boardItem];
        }
        
    }
    else
        [super setValue:value forKey:key];
}


@end
