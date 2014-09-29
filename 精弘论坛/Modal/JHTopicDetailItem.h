//
//  JHTopicDetailItem.h
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHDataModel.h"

@interface JHTopicDetailItem : JHDataModel

@property (copy,nonatomic) NSString *icon;
@property (copy,nonatomic) NSString *is_quote;
@property (copy,nonatomic) NSString *level;
@property (copy,nonatomic) NSString *location;

@property (copy,nonatomic) NSString *managePanel;

@property (copy,nonatomic) NSString *position;
@property (copy,nonatomic) NSString *posts_date;

@property (copy,nonatomic) NSString *quote_content;
@property (copy,nonatomic) NSString *quote_pid;
@property (copy,nonatomic) NSString *quote_user_name;

@property (copy,nonatomic) NSString *infor;
@property (copy,nonatomic) NSString *type;

@property (copy,nonatomic) NSString *reply_id;
@property (copy,nonatomic) NSString *reply_name;
@property (copy,nonatomic) NSString *reply_posts_id;

@property (copy,nonatomic) NSString *reply_status;
@property (copy,nonatomic) NSString *reply_type;
@property (copy,nonatomic) NSString *role_num;
@property (copy,nonatomic) NSString *status;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *userTitle;

/*
 {
	"body": {
 "externInfo": null
	},
	"errcode": "",
	"forumName": "『 池塘边 』",
	"forumTopicUrl": "http://bbs.zjut.edu.cn/forum.php?mod=viewthread&tid=1626836",
	"has_next": 0,
	"head": {
 "alert": 0,
 "errCode": "00000000",
 "errInfo": "调用成功,没有任何错误",
 "version": "2.1.0.1"
	},
	"icon_url": "",
	"img_url": "",
	"list": [
 {
 "icon": "http://center.zjut.com/avatar.php?uid=273602&size=middle",
 "is_quote": 0,
 "level": 0,
 "location": "",
 "managePanel": [
 ],
 "position": 2,
 "posts_date": "1410948800000",
 "quote_content": "",
 "quote_pid": 0,
 "quote_user_name": "",
 "reply_content": [
 {
 "infor": "ios",
 "type": 0
 }
 ],
 "reply_id": 273602,
 "reply_name": "傅逗逗",
 "reply_posts_id": 14052802,
 "reply_status": 1,
 "reply_type": "normal",
 "role_num": 1,
 "status": 1,
 "title": "",
 "userTitle": "注册会员"
 },
 {
 "icon": "http://center.zjut.com/avatar.php?uid=273684&size=middle",
 "is_quote": 1,
 "level": 0,
 "location": "",
 "managePanel": [
 ],
 "position": 3,
 "posts_date": "1410949039000",
 "quote_content": "傅逗逗 发表于 2014-9-17 18:13
 ios",
 "quote_pid": 0,
 "quote_user_name": "",
 "reply_content": [
 {
 "infor": "你知道的太多了",
 "type": 0
 }
 ],
 "reply_id": 273684,
 "reply_name": "iOSApp",
 "reply_posts_id": 14052810,
 "reply_status": 1,
 "reply_type": "normal",
 "role_num": 1,
 "status": 1,
 "title": "",
 "userTitle": "注册会员"
 },
 {
 "icon": "http://center.zjut.com/avatar.php?uid=273602&size=middle",
 "is_quote": 0,
 "level": 0,
 "location": "",
 "managePanel": [
 ],
 "position": 4,
 "posts_date": "1410949304000",
 "quote_content": "",
 "quote_pid": 0,
 "quote_user_name": "",
 "reply_content": [
 {
 "infor": "别杀我",
 "type": 0
 }
 ],
 "reply_id": 273602,
 "reply_name": "傅逗逗",
 "reply_posts_id": 14052819,
 "reply_status": 1,
 "reply_type": "normal",
 "role_num": 1,
 "status": 1,
 "title": "",
 "userTitle": "注册会员"
 }
	],
	"page": 1,
	"rs": 1,
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
 "hits": 10,
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
	"total_num": 3
 }
 */

@end
