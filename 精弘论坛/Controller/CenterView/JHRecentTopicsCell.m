//
//  JHRecentTopicsCell.m
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHRecentTopicsCell.h"
#import "JHTopicItem.h"

@implementation JHRecentTopicsCell

-(instancetype)init
{
    self = [super init];
    
    return self;
}

-(void)displayValues:(JHTopicItem *)topicItem
{
    if (topicItem != nil) {
        _boardName.text = topicItem.board_name;
        _title.text = topicItem.title;
        _userNickName.text = topicItem.user_nick_name;
    }
}

//- (void)getValues
//{
//    if (_recentTopicItem != nil) {
//        _boardName.text = _recentTopicItem.board_name;
//     //   _subject.text = _recentTopicItem.subject ;
//        _userNickName.text = _recentTopicItem.user_nick_name;
//        _title.text = _recentTopicItem.title;
//    }
//}
@end
