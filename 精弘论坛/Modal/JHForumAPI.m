//
//  JHForumAPI.m
//  精弘论坛
//
//  Created by Dikey on 9/17/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//


// ??可以考虑设置一个全局变量 _boardID?

#import "JHForumAPI.h"
#import "JHUser.h"

@implementation JHForumAPI

+(NSString *)getBaseURLString:(int)getParameter
{
    NSString *baseURLString = [NSString new];
    switch (getParameter) {
        case GET_BOARD_LIST:
            baseURLString = @"http://bbs.zjut.edu.cn/mobcent/app/web/index.php";
            break;
            
        case GET_TOPICS_LIST:
            baseURLString = @"http://bbs.zjut.edu.cn/mobcent/app/web/index.php";
            break;
            
        case GET_TOPICS_DETAIL:
            baseURLString = @"";
            break;
            
        default:
            break;
    }
    return baseURLString;
}

+(NSDictionary *)getParameterDic:(int)getParameter
{
    NSDictionary *parameterDic = [NSDictionary new];
    
    switch (getParameter) {
        case GET_BOARD_LIST:
            parameterDic = @{
                             @"r":@"forum/forumlist",
                             @"baikeType":@"1",
                             
                             @"appName":@"精弘论坛",
                             @"forumKey": @"CIuLQ1lkdPtOlhNuV4",
                             
                             @"sdkVersion": @"2.0.0",
                             @"accessToken":[JHUser sharedInstance].token,
                             
                             
                             @"forumType":@"7",
                             @"sdkType": @"1",
                             @"accessSecret":[JHUser sharedInstance].secretToken,
                             
                             @"forumId":@"1",
                             @"packageName": @"com.mobcent.newforum.app82036",
                             @"platType": @"5"
                             };
            break;
            
        case GET_TOPICS_LIST:
            parameterDic = @{
                                         @"r":@"forum/topiclist",
                                         @"boardId":_boardID,
                                         @"appName":JH_APPNAME,
                                         @"forumKey":JH_FORUMKEY,
                                         @"sdkVersion": JH_SDKVERSION,
                                         @"accessToken":[JHUser sharedInstance].token,
                                         @"forumType":JH_FORUMTYPE,
                                         @"sdkType": JH_SDKTYPE,
                                         @"accessSecret":[JHUser sharedInstance].secretToken,
                                         @"forumId":JH_FORUMID,
                                         @"packageName": JH_PACKAGENAME,
                                         @"platType": JH_PLATTYPE,
                                         @"page":[NSString stringWithFormat:@"%d",_page],
                                         @"pageSize":[NSString stringWithFormat:@"%d",10]
                                         
                                         
                                         /*
                                          "page": 1,
                                          "has_next": 1,
                                          "total_num": 78097
                                          */
                                         };
            break;
            
        case GET_TOPICS_DETAIL:
            parameterDic = @"";
            break;
            
        default:
            break;
    }
    
    
    return parameterDic;
}


+(NSArray *)backArrayDate:(int)getList
{
//    @property (copy, nonatomic) NSString *baseURL;
//    @property (copy, nonatomic) NSMutableDictionary *parametersDic;
    
    
    
    
    
    return nil;
}
@end
