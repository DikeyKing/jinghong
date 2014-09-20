//
//  JHTopic.h
//  精弘论坛
//
//  Created by Dikey on 9/20/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHTopic : NSObject

@property (assign,nonatomic) int boardID;
@property (copy, nonatomic) NSString *boardName;
@property (assign,nonatomic) int topicID;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *title;
@property (assign, nonatomic) int userID;
@property (copy, nonatomic) NSString *userNickName;
@property (copy, nonatomic) NSString *lastReplyDate;
@property (assign, nonatomic) int *vote;
@property (assign, nonatomic) int hot;
@property (assign, nonatomic) int hit;
@property (assign, nonatomic) int replies;
@property (assign, nonatomic) int essence;
@property (assign, nonatomic) int top;
@property (copy, nonatomic) NSString *subject;
@property (copy, nonatomic) NSString *pic_path;

/*
 "board_id": 303,
 "board_name": "『 池塘边 』",
 "topic_id": 1627002,
 "type": "normal",
 "title": "[闲聊灌水]听说山里要禁电瓶车了、？",
 "user_id": 225561,
 "user_nick_name": "尐卩孩",
 "last_reply_date": "1411116372000",
 "vote": 0,
 "hot": 0,
 "hits": 42,
 "replies": 5,
 "essence": 0,
 "top": 0,
 "subject": "是真的么？还是不了了之了。有意入辆代步万一禁了那不草蛋了。  各位大神知道详情么",
 "pic_path": ""
 */


@end
