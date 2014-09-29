//
//  JHForumListCell.m
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHForumListCell.h"
#import "JHBoardItem.h"

@implementation JHForumListCell

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)displayValues:(JHBoardItem *)boardItem
{
    if (boardItem != nil) {
        _boardName.text = boardItem.board_name;
        _tdPostCount.text = [NSString stringWithFormat:@"%@",boardItem.td_posts_num];
    }
}
@end
