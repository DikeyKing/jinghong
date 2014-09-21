//
//  JHForumAPI.h
//  精弘论坛
//
//  Created by Dikey on 9/17/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//
// 返回Base URLString 和http request parameters 参数地址

#import <Foundation/Foundation.h>
#import "JHCommonConfigs.h"

@interface JHForumAPI : NSObject

#define JH_FORUMTYPE @"7"
#define JH_FORUMKEY @"CIuLQ1lkdPtOlhNuV4"
#define JH_SDKTYPE @"1"
#define JH_PACKAGENAME @"com.mobcent.newforum.app82036"
#define JH_PLATTYPE @"5"
#define JH_APPNAME @"精弘论坛"
#define JH_SDKVERSION @"2.0.0"
#define JH_BAIKETYPE @"1"
#define JH_FORUMID @"1"

#define JH_BASE_URL @"http://bbs.zjut.edu.cn/mobcent/app/web/index.php"

enum{
    GET_BOARD_LIST = 0,
    GET_TOPICS_LIST = 1,
    GET_TOPICS_DETAIL = 2,
    GET_RECENT_TOPICS = 3,
    GET_PERSONAL_INFO = 4

};

//返回baseURLString
+(NSString *)getBaseURLString:(int)getParameter;
//返回parameter参数
+(NSDictionary *)getParameterDic:(int)getParameter;

+(NSArray *)backArrayDate:(int)getList;


@end
