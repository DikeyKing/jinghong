//
//  JHCommonConfigs.h
//  精弘论坛
//
//  Created by Dikey on 9/21/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//
//登录后服务器返回的参数

#import <Foundation/Foundation.h>

@interface JHCommonConfigs : NSObject

+(instancetype)sharedConfig;

@property(copy, nonatomic) NSString *token;
@property(copy, nonatomic) NSString *secretToken;
@property(copy, nonatomic) NSString *avatar;
//服务器传回来的头像所有人都是同一个...这参数有毛用...?
@property(assign,nonatomic ) int uid;

@property(nonatomic, assign) BOOL loginState; //用于判定登录状态
@property(nonatomic, assign) int boardID;     //当前用户访问的板块名字
@property(nonatomic, assign) int topicID;     //当前用户正在访问的主题
@property(nonatomic, assign) int page;        //正在访问第几页....

/*
 "uid": 273684,
 "avatar": "http:\/\/center.zjut.com\/images\/noavatar_middle.gif",
 "fid": 1,
 "rs": 1, //return successfully
 "counts": null
 */

@end
