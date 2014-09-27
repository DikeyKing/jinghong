//
//  JHTopicItem.h
//  精弘论坛
//
//  Created by Dikey on 9/25/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHDataModel.h"

@interface JHTopicItem : JHDataModel


@property (copy, nonatomic) NSString *boardID;
@property (copy, nonatomic) NSString *boardName;
@property (copy, nonatomic) NSString *topicID;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *userID;
@property (copy, nonatomic) NSString *userNickName;
@property (copy, nonatomic) NSString *lastReplyDate;
@property (copy, nonatomic) NSString *vote;
@property (copy, nonatomic) NSString *hot;
@property (copy, nonatomic) NSString *hit;
@property (copy, nonatomic) NSString *replies;
@property (copy, nonatomic) NSString *essence;
@property (copy, nonatomic) NSString *top;
@property (copy, nonatomic) NSString *subject;
@property (copy, nonatomic) NSString *pic_path;


/*
 {
 "anno_list" =     (
 );
 body =     {
 externInfo = "<null>";
 };
 "classificationTop_list" =     (
 );
 "classificationType_list" =     (
 {
 "classificationType_id" = 1;
 "classificationType_name" = "\U539f\U521b";
 },
 {
 "classificationType_id" = 2;
 "classificationType_name" = "\U5176\U4ed6";
 },
 {
 "classificationType_id" = 3;
 "classificationType_name" = "\U6c42\U52a9";
 },
 {
 "classificationType_id" = 4;
 "classificationType_name" = "\U8d44\U6599";
 },
 {
 "classificationType_id" = 5;
 "classificationType_name" = "\U5b66\U9662\U62a5\U5230";
 },
 {
 "classificationType_id" = 6;
 "classificationType_name" = "\U5df2\U89e3\U51b3";
 }
 );
 errcode = "";
 "has_next" = 1;
 head =     {
 alert = 0;
 errCode = 00000000;
 errInfo = "\U8c03\U7528\U6210\U529f,\U6ca1\U6709\U4efb\U4f55\U9519\U8bef";
 version = "2.1.0.1";
 };
 isOnlyTopicType = 1;
 list =     (
 {
 "board_id" = 299;
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 essence = 0;
 hits = 604;
 hot = 0;
 "last_reply_date" = 1411610009000;
 "pic_path" = "";
 replies = 53;
 subject = "\U53c8\U662f\U4e00\U5e74\U5f00\U5b66\U5b63\Uff0c\U611f\U89c9\U4e00\U5927\U6ce2\U840c\U840c\U54d2\U65b0\U4eba\U5c31\U8981\U5165\U4f4f\U8bba\U575b\U5566\U3002  \U6240\U4ee5\U5462\U6211\U4e5f\U641e\U51fa\U4e86\U4e00\U4e2a\U840c\U840c";
 title = "[\U539f\U521b]\U8bba\U575b\U65b0\U4eba\U6765\U8fd9\U91cc\U62a5\U9053\U9886\U52cb\U7ae0\U5566~";
 top = 0;
 "topic_id" = 1626728;
 type = normal;
 "user_id" = 269267;
 "user_nick_name" = "\U5446\U5c0f\U950b";
 vote = 0;
 },
 {
 "board_id" = 299;
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 essence = 0;
 hits = 207;
 hot = 0;
 "last_reply_date" = 1411608502000;
 "pic_path" = "";
 replies = 12;
 subject = "\U73b0\U5728\U603b\U662f\U53ef\U4ee5\U770b\U5230\U6709\U4eba\U6c89\U8ff7\U4e8e\U73a9\U624b\U673a\U4e2d\Uff0c\U6211\U597d\U5947\U5b83\U7a76\U7adf\U6709\U7740\U4ec0\U4e48\U6837\U7684\U9b45\U529b  ";
 title = "[\U539f\U521b]\U624b\U673a\U7a76\U7adf\U53ef\U4ee5\U5e72\U4ec0\U4e48";
 top = 0;
 "topic_id" = 1625387;
 type = normal;
 "user_id" = 254266;
 "user_nick_name" = "\U7cbe\U5f18\U65b0\U751f\U5e10\U53f71";
 vote = 0;
 },
 {
 "board_id" = 299;
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 essence = 0;
 hits = 96;
 hot = 0;
 "last_reply_date" = 1411608443000;
 "pic_path" = "";
 replies = 5;
 subject = "\U5b66\U59d0\U5728\U5916\U5b9e\U4e60\U3002\U5468\U4e00\U516c\U9009\U8bfe\U8d76\U4e0d\U53ca\U4e0a\U3002\U5e0c\U671b\U6709\U5b66\U59b9\U80fd\U4ee3\U4e0a\Uff01\U4e0a\U5b8c\U4e00\U5b66\U671f\U5e76\U987a\U5229\U901a\U8fc7\U671f\U672b\U8003\U67e5";
 title = "[\U5176\U4ed6]\U627e\U5b66\U59b9\U4ee3\U4e0a\U516c\U9009\U8bfe";
 top = 0;
 "topic_id" = 1627270;
 type = normal;
 "user_id" = 229047;
 "user_nick_name" = ss409936852;
 vote = 0;
 },
 {
 "board_id" = 299;
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 essence = 0;
 hits = 66;
 hot = 0;
 "last_reply_date" = 1411608356000;
 "pic_path" = "";
 replies = 9;
 subject = "\U60f3\U6709\U4e00\U4e2a\U8131\U4fd7\U7684\U7528\U6237\U540d\Uff0c\U563f\U563f[\U54c8\U54c8]  ";
 title = "[\U6c42\U52a9]\U7528\U6237\U540d\U80fd\U6539\U5417\Uff0c\U8fd9\U4e48\U5f04\U554a";
 top = 0;
 "topic_id" = 1627569;
 type = normal;
 "user_id" = 261157;
 "user_nick_name" = zjqymxn;
 vote = 0;
 },
 {
 "board_id" = 299;
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 essence = 0;
 hits = 51;
 hot = 0;
 "last_reply_date" = 1411608261000;
 "pic_path" = "";
 replies = 2;
 subject = "[i=s]  [/i]    [align=left][backcolor=rg";
 title = "[\U539f\U521b]\U65f6\U5149\U7801\U5934\Uff0c\U5de5\U5927\U8fb9\U7684\U65e5\U79df\U516c\U5bd3\Uff0c\U7b49\U4f60\U5047\U671f\U6765\U73a9";
 top = 0;
 "topic_id" = 1627551;
 type = normal;
 "user_id" = 206669;
 "user_nick_name" = Holala;
 vote = 0;
 },
 {
 "board_id" = 299;
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 essence = 0;
 hits = 138;
 hot = 0;
 "last_reply_date" = 1411563217000;
 "pic_path" = "";
 replies = 4;
 subject = "\U65b0\U540c\U5b66  \U4f60\U662f\U9009\U62e9\U7b14\U8bb0\U672c\U8fd8\U662f\U53f0\U5f0f\U7535\U8111\Uff1f    http://bbs.zjut.e";
 title = "[\U539f\U521b]\U65b0\U540c\U5b66  \U4f60\U662f\U9009\U62e9\U7b14\U8bb0\U672c\U8fd8\U662f\U53f0\U5f0f\U7535\U8111\Uff1f";
 top = 0;
 "topic_id" = 1625666;
 type = vote;
 "user_id" = 77562;
 "user_nick_name" = mialrr;
 vote = 1;
 },
 {
 "board_id" = 299;
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 essence = 0;
 hits = 121;
 hot = 0;
 "last_reply_date" = 1411552699000;
 "pic_path" = "";
 replies = 7;
 subject = "\U5b66\U6821\U7684\U996d\U5361\U662f\U4f4e\U4e8e\U591a\U5c11\U81ea\U52a8\U53cd\U51b2\U554a\Uff1f  ";
 title = "[\U6c42\U52a9]\U5b66\U6821\U7684\U996d\U5361\U662f\U4f4e\U4e8e\U591a\U5c11\U81ea\U52a8\U53cd\U51b2\U554a\Uff1f";
 top = 0;
 "topic_id" = 1627123;
 type = normal;
 "user_id" = 255469;
 "user_nick_name" = "\U66f2\U5947";
 vote = 0;
 },
 {
 "board_id" = 299;
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 essence = 0;
 hits = 113;
 hot = 0;
 "last_reply_date" = 1411484995000;
 "pic_path" = "";
 replies = 1;
 subject = "      \U65b0\U5b66\U671f\U81ea\U884c\U8f66\U56e2\U8d2d\U6d3b\U52a8\U63a5\U8fd1\U5c3e\U58f0\Uff0c\U5269\U4e0b\U5c11\U91cf\U5168\U65b0\U81ea\U884c\U8f66\U76f4\U63a5\U56e2\U8d2d\U4ef7\U6284\U5e95\Uff0c\U7537\U8f66";
 title = "[\U8d44\U6599]\U5168\U65b0\U81ea\U884c\U8f66\U56e2\U8d2d\U4ef7\U6284\U5e95\U5df2\U79fb\U81f3\U300e \U7f51\U5e97 \U300f\U677f\U5757";
 top = 0;
 "topic_id" = 1626135;
 type = normal;
 "user_id" = 155460;
 "user_nick_name" = 17T8;
 vote = 0;
 },
 {
 "board_id" = 299;
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 essence = 0;
 hits = 45;
 hot = 0;
 "last_reply_date" = 1411484940000;
 "pic_path" = "";
 replies = 0;
 subject = "\U8fdb\U5165\U79cb\U5929\U5566\Uff0c\U5927\U5bb6\U662f\U4e0d\U662f\U5e94\U8be5\U7ec4\U4e2a\U56e2\U53bb\U79cb\U6e38\U5462\Uff0c\U5982\U679c\U4f60\U4eec\U73ed\U6b63\U6101\U6ca1\U5730\U65b9\U53bb\U7684\U8bdd\Uff0c\U6b22\U8fce\U54a8\U8be2\U6211";
 title = "[\U539f\U521b]\U79cb\U6e38\U53bb\U54ea\U513f";
 top = 0;
 "topic_id" = 1627524;
 type = normal;
 "user_id" = 254568;
 "user_nick_name" = "\U5c0f\U59b3";
 vote = 0;
 },
 {
 "board_id" = 299;
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 essence = 0;
 hits = 65;
 hot = 0;
 "last_reply_date" = 1411390781000;
 "pic_path" = "";
 replies = 1;
 subject = "      \U5c0f\U4f19\U4f34\U4eec\Uff0c\U6d59\U6c5f\U5de5\U4e1a\U5927\U5b66\U5c0f\U548c\U5c71\U56e2\U5951\U6b22\U8fce\U4f60\U554a\Uff01\Uff01  ";
 title = "[\U539f\U521b]\U5c0f\U4f19\U4f34\U4eec\Uff0c\U6d59\U6c5f\U5de5\U4e1a\U5927\U5b66\U56e2\U5951\U6d3b\U52a8\Uff0c\U5927\U5bb6\U4e00\U8d77\U6765\U53c2\U52a0\U5427";
 top = 0;
 "topic_id" = 1627369;
 type = normal;
 "user_id" = 257757;
 "user_nick_name" = 2111203020;
 vote = 0;
 }
 );
 newTopicPanel =     (
 {
 action = "";
 title = "\U53d1\U8868\U5e16\U5b50";
 type = normal;
 }
 );
 page = 1;
 rs = 1;
 "total_num" = 253;
 }
 
 */

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


/*
 "page": 1,
 "has_next": 1,
 "total_num": 78097
 */


@end
