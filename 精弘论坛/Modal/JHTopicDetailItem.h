//
//  JHTopicDetailItem.h
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHDataModel.h"

@interface JHTopicDetailItem : JHDataModel<NSCoding>

@property (copy,nonatomic) NSMutableString *icon;
@property (copy,nonatomic) NSMutableString *is_quote;
@property (copy,nonatomic) NSMutableString *level;
@property (copy,nonatomic) NSMutableString *location;
@property (assign,nonatomic) int position;

@property (copy,nonatomic) NSMutableString *posts_date;
@property (copy,nonatomic) NSMutableString *quote_content;
@property (copy,nonatomic) NSMutableString *quote_pid;
@property (copy,nonatomic) NSMutableString *quote_user_name;
//@property (copy,nonatomic) NSString *reply_content;
@property (copy,nonatomic) NSMutableString *infor;
@property (assign,nonatomic) int type;
@property (assign,nonatomic) long reply_id;

@property (copy,nonatomic) NSMutableString *reply_name;
@property (assign,nonatomic) long reply_posts_id;
@property (assign,nonatomic) int reply_status;

@property (copy,nonatomic) NSMutableString *reply_type;
@property (assign,nonatomic) int role_num;
@property (assign,nonatomic) int status;
@property (copy,nonatomic) NSMutableString *title;
@property (copy,nonatomic) NSMutableString *userTitle;

@property (assign,nonatomic,readwrite) CGFloat cellHeight; //根据infor 计算出cell高度

@property (copy,nonatomic) NSMutableString *managePanel;

/*
 
 

 
 
 _icon	NSString *	(null)	0x17616cd0
 _is_quote	NSString *	(int)0	0x17625140
 _level	NSString *	(int)0	0x17625140
 _location	NSString *	(null)	0x3bc672f0
 _managePanel	NSString *	(null)	0x1752d450
 _position	NSString *	(int)2	0x176253a0
 _posts_date	NSString *	(null)	0x18831c40
 _quote_content	NSString *	(null)	0x3bc672f0
 _quote_pid	NSString *	(int)0	0x17625140
 _quote_user_name	NSString *	(null)	0x3bc672f0
 _reply_content	NSString *	nil	0x00000000
 _infor	NSMutableString *	@"zjhyy8182115@qq.com………话说，最近装了黑苹果"	0x1753e220
 NSString	NSString
 NSObject	NSObject
 isa	Class	__NSCFString	0x3bb49908
 _type	int	0	0
 _reply_id	long	254661	254661
 _reply_name	NSString *	(null)	0x188427b0
 _reply_posts_id	long	14061166	14061166
 _reply_status	int	1	1
 _reply_type	NSString *	(null)	0x1761ca50
 _role_num	int	1	1
 _status	int	1	1
 _title	NSString *	(null)	0x3bc672f0
 _userTitle	NSString *	(null)	0x1883c800
 
 */

 
/*
 "reply_id": 273602,
 "reply_name": "傅逗逗",
 "reply_posts_id": 14052802,
 "reply_status": 1,
 "reply_type": "normal",
 "role_num": 1,
 "status": 1,
 */


// "infor": "你知道的太多了",




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
