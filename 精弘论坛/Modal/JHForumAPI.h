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

enum{
    GET_BOARD_LIST = 0,
    GET_TOPICS_LIST = 1,
    GET_TOPICS_DETAIL = 2,
    GET_RECENT_TOPICS = 3,
    GET_PERSONAL_INFO = 4,
    GET_LOGIN
};

//返回parameter参数
+(NSDictionary *)getParameterDic:(int)getParameter;


@end
