//
//  JHForumAPI.m
//  精弘论坛
//
//  Created by Dikey on 9/17/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//
#import "JHForumAPI.h"
#import "JHUserDefaults.h"

#define JH_FORUMTYPE @"7"
#define JH_FORUMKEY @"CIuLQ1lkdPtOlhNuV4"
#define JH_SDKTYPE @"1"
#define JH_PACKAGENAME @"com.mobcent.newforum.app82036"
#define JH_PLATTYPE @"5"
#define JH_APPNAME @"精弘论坛"
#define JH_SDKVERSION @"2.0.0"
#define JH_BAIKETYPE @"1"
#define JH_FORUMID @"1"

static int pageSize=20 ;

@implementation JHForumAPI


+(NSDictionary *)getParameterDic:(int)getParameter
{
    NSDictionary *publicParameter = @{
                                @"appName":JH_APPNAME,
                                @"forumKey":JH_FORUMKEY,
                                @"sdkVersion": JH_SDKVERSION,
                                @"forumType":JH_FORUMTYPE,
                                @"sdkType": JH_SDKTYPE,
                                @"forumId":JH_FORUMID,
                                @"packageName": JH_PACKAGENAME,
                                @"platType": JH_PLATTYPE,
                                @"accessToken":[JHUserDefaults getToken],
                                @"accessSecret":[JHUserDefaults getSecretToken]
                                };
    
    NSDictionary *privateParameter = [NSDictionary new];
    
    switch (getParameter) {
            
        case GET_BOARD_LIST:
            privateParameter = @{
                             @"r":@"forum/forumlist",
                             @"baikeType":@"1" //这个参数什么意思？

                             };
            break;
            
        case GET_TOPICS_LIST:
            privateParameter = @{
                            @"r":@"forum/topiclist",
                            @"boardId":[JHUserDefaults getBoardID],
                            @"page":[JHUserDefaults  getPage], //获取第几页

            
                            @"pageSize":[NSString stringWithFormat:@"%d",pageSize] //每页多少个
                            
                            };
            break;
            
        case GET_TOPICS_DETAIL:
            privateParameter = @{
                             @"r":@"forum/postlist",
                             
                             @"topicId":[JHUserDefaults getTopicID],
                             @"boardId":[JHUserDefaults getBoardID]

                             };
            
        
            break;
           
            
        case GET_RECENT_TOPICS:
            privateParameter = @{
                                 @"r":@"forum/topiclist",
                                 @"pageSize": [NSString stringWithFormat:@"%d",pageSize],
                                 @"page":[JHUserDefaults getPage],
                                 @"sortby":@"publish"
                                 
                                 };
            break;

            
            /*  recent 10 topics
             pageSize	10
             sortby	publish
             page	1
             r=forum/topiclist



             http://bbs.zjut.edu.cn/mobcent/app/web/index.php?
             
             appName	精弘论坛
             sdkVersion	2.0.0
             forumKey	CIuLQ1lkdPtOlhNuV4
             accessToken	8a7e56597e8b55881c67b1cb28b1b
             forumType	7
             sdkType	1
             accessSecret	2a113ad6cfadce314a60a79d33cb7
             forumId	1
             packageName	com.mobcent.newforum.app82036
             platType	5
             
             API
             "page": 1,
             "has_next": 1,
             "total_num": 336242
             */
            
        case GET_PERSONAL_INFO:
            privateParameter = @{
                @"r":@"user/userinfo",
                @"userId": [JHUserDefaults getUid],
                };
            break;
      
        case GET_LOGIN:
            privateParameter = @{
                                 @"r":@"user/userinfo",
                                 @"email":[JHUserDefaults getUserName],
                                 @"password":[JHUserDefaults getPassword]
                                 };
            break;
        
        case POST_NEW_TOPIC:
            privateParameter = @{
                                 @"act":@"new"
                                 //json 怎么加进去？
/*
 json	%7B%22body%22%3A%7B%22json%22%3A%7B%22isQuote%22%3A%220%22%2C%22title%22%3A%22%25E6%25B5%258B%25E8%25AF%2595%25E6%25A0%2587%25E9%25A2%2598%22%2C%22fid%22%3A%22303%22%2C%22content%22%3A%22%255B%257B%2522infor%2522%253A%2522%25E6%25B5%258B%25E8%25AF%2595%25E5%2586%2585%25E5%25AE%25B9%255B%25E9%2585%25B7%255D%2522%252C%2522type%2522%253A%25220%2522%257D%255D%22%2C%22aid%22%3A%22%22%2C%22typeId%22%3A434%7D%7D%7D

  这一套乱七八糟的什么啊...
 */
                                 
                                 
                                 
                                 
                                 };
            break;
          
        case POST_NEW_REPLY:
            privateParameter = @{
                                 @"act":@"reply"
                                 };
            break;
            
            
            
        default:
            break;
    }
    
    NSMutableDictionary *urlParameter = [[NSMutableDictionary alloc]initWithDictionary:publicParameter];
    [urlParameter addEntriesFromDictionary:privateParameter];
    return urlParameter;
}


@end

/*帖子详情
 
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
 "hits": 5,
 "hot": 0,
 "icon": "http://center.zjut.com/avatar.php?uid=273684&size=middle",
 "is_favor": 0,
 "level": 0,
 "location": "",
 "managePanel": [
 ],
 "poll_info": null,
 "replies": 1,
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
	"total_num": 1
 }

 
*/



/* 个人信息 3
 http://bbs.zjut.edu.cn/mobcent/app/web/index.php
 
 r	user/userinfo
 forumId	1
 appName	精弘论坛
 sdkVersion	2.0.0
 userId	273684
 forumKey	CIuLQ1lkdPtOlhNuV4
 accessToken	8a7e56597e8b55881c67b1cb28b1b
 forumType	7
 sdkType	1
 accessSecret	2a113ad6cfadce314a60a79d33cb7
 packageName	com.mobcent.newforum.app82036
 platType	5
 
 
{
    "rs": 1,
    "errcode": "",
    "head": {
        "errCode": "00000000",
        "errInfo": "调用成功,没有任何错误",
        "version": "2.1.0.1",
        "alert": 0
    },
    "body": {
        "externInfo": null
    },
    "flag": 1,
    "is_black": 0,
    "is_follow": 0,
    "icon": "http://center.zjut.com/avatar.php?uid=273684&size=middle",
    "level_url": "",
    "name": "iOSApp",
    "email": "dikeyking@gmail.com",
    "status": 2,
    "gender": 0,
    "score": 11,
    "credits": 11,
    "gold_num": 0,
    "topic_num": 1,
    "photo_num": 0,
    "reply_posts_num": 1,
    "essence_num": 0,
    "friend_num": 0,
    "follow_num": 0,
    "level": 0,
    "userTitle": "注册会员",
    "info": [ ]
}
*/







/*  recent 10 topics
 http://bbs.zjut.edu.cn/mobcent/app/web/index.php
 
 r=forum/topiclist
 appName	精弘论坛
 sdkVersion	2.0.0
 forumKey	CIuLQ1lkdPtOlhNuV4
 pageSize	10
 accessToken	8a7e56597e8b55881c67b1cb28b1b
 forumType	7
 sortby	publish
 page	1
 sdkType	1
 accessSecret	2a113ad6cfadce314a60a79d33cb7
 forumId	1
 packageName	com.mobcent.newforum.app82036
 platType	5
 
 API
 "page": 1,
 "has_next": 1,
 "total_num": 336242
 */




/* topics list
 
 
 
 "list": [
 {
 "board_id": 303,
 "board_name": "『 池塘边 』",
 "topic_id": 1627152,
 "type": "normal",
 "title": "在线求助",
 "user_id": 154266,
 "user_nick_name": "小酒儿",
 "last_reply_date": "1411201532000",
 "vote": 0,
 "hot": 0,
 "hits": 0,
 "replies": 0,
 "essence": 0,
 "top": 0,
 "subject": "屏峰里面有个招待所，对外开放吗？多钱？怎么样？怎么预定？ ",
 "pic_path": ""
 },
 
 
 
 */




/* get recentPhotos  (图片墙)
 
 http://bbs.zjut.edu.cn/mobcent/app/web/index.php
 
 r	forum/photogallery
 imsi	FD33C5E7-D99D-4166-9A7F-80DC5EED184B
 appName	精弘论坛
 sdkVersion	2.0.0
 forumKey	CIuLQ1lkdPtOlhNuV4
 pageSize	20
 accessToken	8a7e56597e8b55881c67b1cb28b1b
 imei	FD33C5E7-D99D-4166-9A7F-80DC5EED184B
 forumType	7
 page	1
 sdkType	1
 accessSecret	2a113ad6cfadce314a60a79d33cb7
 forumId	1
 packageName	com.mobcent.newforum.app82036
 platType	5
 
 */

