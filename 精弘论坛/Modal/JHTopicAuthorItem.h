//
//  JHTopicAuthorItem.h
//  精弘论坛
//
//  Created by Dikey on 10/8/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHDataModel.h"

@interface JHTopicAuthorItem : JHDataModel

@property (copy,nonatomic) NSMutableString *activityInfo;
@property (copy,nonatomic) NSMutableString *contenttypeInfor;
@property (assign,nonatomic) int contentType;
@property (copy,nonatomic) NSMutableString *create_date;
@property (assign,nonatomic) int essence;
@property (assign,nonatomic) int flag;
@property (assign,nonatomic) int gender;
@property (assign,nonatomic) int hits;
@property (assign,nonatomic) int hot;
@property (copy,nonatomic) NSMutableString *icon;
@property (assign,nonatomic) int is_favor;
@property (assign,nonatomic) int level;
@property (assign,nonatomic) int location;
@property (copy,nonatomic) NSMutableString *managePanel;
@property (copy,nonatomic) NSMutableString *poll_info;
@property (assign,nonatomic) int replies;
@property (assign,nonatomic) int reply_posts_id;
@property (assign,nonatomic) int reply_status;
@property (assign,nonatomic) int sortId;
@property (assign,nonatomic) int status;
@property (copy,nonatomic) NSMutableString *title;
@property (assign,nonatomic) int top;
@property (assign,nonatomic) int topic_id;
@property (copy,nonatomic) NSMutableString *type;
@property (copy,nonatomic) NSMutableString *user_nick_name;
@property (copy,nonatomic) NSMutableString *userTitle;
@property (assign,nonatomic) int vote;
@property (assign,nonatomic) int user_id;






/*
"topic": {
    "activityInfo": null,
    "content": [
                {
                    "infor": "测试内容[酷]",
                    "type": 0
                }
                ],
    "create_date": "1410948638000",
    "essence": 0,
    "flag": 0,
    "gender": 1,
    "hits": 11,
    "hot": 0,
    "icon": "http://center.zjut.com/avatar.php?uid=273684&size=middle",
    "is_favor": 0,
    "level": 0,
    "location": "",
    "managePanel": [
    ],
    "poll_info": null,
    "replies": 3,
    "reply_posts_id": 0,
    "reply_status": 1,
    "sortId": 0,
    "status": 1,
    "title": "[闲聊灌水]测试标题",
    "top": 0,
    "topic_id": 1626836,
    "type": "normal",
    "user_id": 273684,
    "user_nick_name": "iOSApp",
    "userTitle": "注册会员",
    "vote": 0
},
*/



@end
