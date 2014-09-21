//
//  JHJsonToModel.m
//  精弘论坛
//
//  Created by Dikey on 9/20/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHJsonToModel.h"
#import "DataModel.h"

@implementation JHJsonToModel
+(NSArray *)getBoardItem:(NSArray *)objectArray
{  //这里只传进来一个 list,比如现在有五个
    
    NSArray *array =  [objectArray copy];
    NSMutableArray *boardList = [[NSMutableArray alloc]init];
    
    JHBoardItem *boardItem = [[JHBoardItem alloc]init];;
    
    for (int i =0; i< [array count]; i++) {
        boardList[i] = array[i];
        
    }
    
    
    return nil;
    
    
    
    
    
    
    /*
     
     {
     "body": {
     "externInfo": null
     },
     "errcode": "",
     "head": {
     "alert": 0,
     "errCode": "00000000",
     "errInfo": "调用成功,没有任何错误",
     "version": "2.1.0.1"
     },
     "list": [
     {
     "board_category_id": 478,
     "board_category_name": "白驹过隙",
     "board_category_type": 2,
     "board_list": [
     {
     "board_child": 1,
     "board_content": 1,
     "board_id": 299,
     "board_img": "",
     "board_name": "『 新生报到 』",
     "forumRedirect": "",
     "last_posts_date": "1410942660000",
     "posts_total_num": 4217,
     "td_posts_num": 12,
     "topic_total_num": 243
     }
     ]
     },
     {
     "board_category_id": 116,
     "board_category_name": "再次起航",
     "board_category_type": 2,
     "board_list": [
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 455,
     "board_img": "",
     "board_name": "『同乡情谊』",
     "forumRedirect": "",
     "last_posts_date": "1410939540000",
     "posts_total_num": 526695,
     "td_posts_num": 14,
     "topic_total_num": 912
     },
     {
     "board_child": 1,
     "board_content": 0,
     "board_id": 466,
     "board_img": "",
     "board_name": "『租房二手』",
     "forumRedirect": "",
     "last_posts_date": "1410947280000",
     "posts_total_num": 0,
     "td_posts_num": 0,
     "topic_total_num": 0
     },
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 464,
     "board_img": "",
     "board_name": "『学习资源』",
     "forumRedirect": "",
     "last_posts_date": "1410947880000",
     "posts_total_num": 5389,
     "td_posts_num": 8,
     "topic_total_num": 369
     },
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 385,
     "board_img": "",
     "board_name": "『鹊桥招亲』",
     "forumRedirect": "",
     "last_posts_date": "1410942720000",
     "posts_total_num": 46501,
     "td_posts_num": 4,
     "topic_total_num": 560
     },
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 459,
     "board_img": "",
     "board_name": "『学生兼职』",
     "forumRedirect": "",
     "last_posts_date": "1410946860000",
     "posts_total_num": 117524,
     "td_posts_num": 68,
     "topic_total_num": 17561
     },
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 458,
     "board_img": "",
     "board_name": "『学术人生』",
     "forumRedirect": "",
     "last_posts_date": "1410923820000",
     "posts_total_num": 96675,
     "td_posts_num": 1,
     "topic_total_num": 13015
     },
     {
     "board_child": 1,
     "board_content": 1,
     "board_id": 456,
     "board_img": "",
     "board_name": "『文艺之路』",
     "forumRedirect": "",
     "last_posts_date": "1410935700000",
     "posts_total_num": 304676,
     "td_posts_num": 2,
     "topic_total_num": 11835
     },
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 465,
     "board_img": "",
     "board_name": "『电脑网络』",
     "forumRedirect": "",
     "last_posts_date": "1410945660000",
     "posts_total_num": 264692,
     "td_posts_num": 25,
     "topic_total_num": 23935
     },
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 162,
     "board_img": "",
     "board_name": "『旅游户外』",
     "forumRedirect": "",
     "last_posts_date": "1410943080000",
     "posts_total_num": 107149,
     "td_posts_num": 8,
     "topic_total_num": 4772
     },
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 461,
     "board_img": "",
     "board_name": "『情感秘密』",
     "forumRedirect": "",
     "last_posts_date": "1410947700000",
     "posts_total_num": 652369,
     "td_posts_num": 30,
     "topic_total_num": 21871
     },
     {
     "board_child": 1,
     "board_content": 1,
     "board_id": 30,
     "board_img": "",
     "board_name": "『音乐影视』",
     "forumRedirect": "",
     "last_posts_date": "1410852120000",
     "posts_total_num": 153026,
     "td_posts_num": 0,
     "topic_total_num": 8090
     },
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 303,
     "board_img": "",
     "board_name": "『 池塘边 』",
     "forumRedirect": "",
     "last_posts_date": "1410947820000",
     "posts_total_num": 2219022,
     "td_posts_num": 174,
     "topic_total_num": 78082
     }
     ]
     },
     {
     "board_category_id": 69,
     "board_category_name": "学校版块",
     "board_category_type": 2,
     "board_list": [
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 471,
     "board_img": "",
     "board_name": "『实习就业创业』",
     "forumRedirect": "",
     "last_posts_date": "1410946620000",
     "posts_total_num": 60060,
     "td_posts_num": 22,
     "topic_total_num": 9509
     },
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 470,
     "board_img": "",
     "board_name": "『 For U维权 』",
     "forumRedirect": "",
     "last_posts_date": "1410944880000",
     "posts_total_num": 32381,
     "td_posts_num": 15,
     "topic_total_num": 7824
     },
     {
     "board_child": 1,
     "board_content": 1,
     "board_id": 91,
     "board_img": "",
     "board_name": "『 研究生院 』",
     "forumRedirect": "",
     "last_posts_date": "1410934800000",
     "posts_total_num": 32891,
     "td_posts_num": 3,
     "topic_total_num": 4525
     },
     {
     "board_child": 1,
     "board_content": 0,
     "board_id": 409,
     "board_img": "",
     "board_name": "『 本科学院 』",
     "forumRedirect": "",
     "last_posts_date": "1410944880000",
     "posts_total_num": 0,
     "td_posts_num": 0,
     "topic_total_num": 0
     }
     ]
     },
     {
     "board_category_id": 254,
     "board_category_name": "论坛站务",
     "board_category_type": 2,
     "board_list": [
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 285,
     "board_img": "",
     "board_name": "『 论坛事务 』",
     "forumRedirect": "",
     "last_posts_date": "1410779580000",
     "posts_total_num": 28806,
     "td_posts_num": 0,
     "topic_total_num": 1024
     },
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 2,
     "board_img": "",
     "board_name": "『 版主申请 』",
     "forumRedirect": "",
     "last_posts_date": "1410446460000",
     "posts_total_num": 18041,
     "td_posts_num": 0,
     "topic_total_num": 407
     },
     {
     "board_child": 0,
     "board_content": 1,
     "board_id": 291,
     "board_img": "",
     "board_name": "『 合作事宜 』",
     "forumRedirect": "",
     "last_posts_date": "1395598620000",
     "posts_total_num": 918,
     "td_posts_num": 0,
     "topic_total_num": 162
     }
     ]
     },
     {
     "board_category_id": 7,
     "board_category_name": "精弘网络",
     "board_category_type": 2,
     "board_list": [
     {
     "board_child": 1,
     "board_content": 1,
     "board_id": 86,
     "board_img": "",
     "board_name": "『 斑竹之家 』",
     "forumRedirect": "",
     "last_posts_date": "0000",
     "posts_total_num": 140156,
     "td_posts_num": 11,
     "topic_total_num": 4720
     }
     ]
     }
     ],
     "online_user_num": 0,
     "rs": 1,
     "td_visitors": 0
     }
     
     */
    
}
@end
