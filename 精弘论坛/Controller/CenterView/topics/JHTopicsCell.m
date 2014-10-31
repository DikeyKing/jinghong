//
//  JHTopicsCell.m
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHTopicsCell.h"
#import "JHTopicItem.h"

@implementation JHTopicsCell

-(instancetype)init
{
    self = [super init];
    return self;
}

-(void)displayValues:(JHTopicItem *)topicItem
{    
        _authorName.text = topicItem.user_nick_name;
        _topicTitle.text = topicItem.title;
}


@end
