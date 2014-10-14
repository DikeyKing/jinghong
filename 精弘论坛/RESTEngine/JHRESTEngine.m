//
//  JHRESTEngine.m
//  精弘论坛
//
//  Created by Dikey on 9/22/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//
// 在REST中获取数据之后缓存一份

#import "JHRESTEngine.h"
#import "JHForumAPI.h"
#import "JHFourmItem.h"
#import "JHTopicItem.h"
#import "JHTopicDetailItem.h"
#import "JHTopicAuthorItem.h"
#import "JHUserDefaults.h"

#import <精弘论坛-Swift.h>

#warning 加入缓存啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊！

static NSString * const kJHBaseURLString = @"http://bbs.zjut.edu.cn/mobcent/app/web/index.php";
static NSString * const kJHLoginURLString = @"http://bbs.zjut.edu.cn/mobcent/login/login.php";

@implementation JHRESTEngine


+(instancetype)sharedJHRESTManager
{
    static JHRESTEngine *sharedEngine = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken,^{
        sharedEngine = [[JHRESTEngine alloc]init];
        [sharedEngine.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    });
    return sharedEngine;
} //这里为什么不行？

-(instancetype)loginWithCompletion:(void (^)(NSError *))block{
    [self POST:kJHLoginURLString parameters:[JHForumAPI getParameterDic:GET_LOGIN] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = responseObject;
        if ([[dic objectForKey:@"rs"]  isEqual: @1]) {
            [JHUserDefaults saveLoginState:@"YES"];
            [JHUserDefaults saveToken:[dic objectForKey:@"token"]];
            [JHUserDefaults saveSecretToken:[dic objectForKey:@"secret"]];
            [JHUserDefaults saveUid:[dic objectForKey:@"uid"]];
            //登录成功
            block(nil);
        }else{//登录失败
            [JHUserDefaults saveLoginState:@"NO"];
            block(nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(error);//出错了
    }];
    return self;
}

-(instancetype)getBoardListOnSucceeded:(ArrayBlock)succeededBlock
                     onError:(ErrorBlock)errorBlock
{
    //发起连接，得到所有列表的JSON数据并模型化，加入缓存

    [self POST:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_BOARD_LIST] success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        NSDictionary *objectDic = responseObject;
        
        if ([objectDic objectForKey:@"rs"] != 0) {

            NSArray *forumArray = [objectDic objectForKey:@"list"];
            NSMutableArray *forumItemArray = [NSMutableArray new];
            
            for (NSMutableDictionary *forumDic in forumArray) {
                [forumItemArray addObject:[[JHFourmItem alloc]initWithDictionary:forumDic]];
            }
            
            //回调CenterView 更新视图~
            succeededBlock(forumItemArray);
#warning SaveCache
        }else{
            
            NSLog(@"获取首页失败了,参数错误");
        }
          
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"获取首页失败了%@",error);
        errorBlock(error);

    }];
    return self;
}

-(instancetype)getTopicsListOnSucceeded:(ArrayBlock)succeededBlock
                                onError:(ErrorBlock)errorBlock
{
    [self GET:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_TOPICS_LIST] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *objectDic = responseObject;
            if ([objectDic objectForKey:@"rs"]!= 0) {
            NSArray *topicsArray = [objectDic objectForKey:@"list"];
            NSMutableArray *topicsItemArray = [NSMutableArray new];
            
            for (NSMutableDictionary *topicsDic in topicsArray) {
                // 这步将topicsArray 中的JSON  转换成 topicsItem 添加至Array
                // 然后返回 topicsItemArray
                [topicsItemArray addObject:[[JHTopicItem alloc]initWithDictionary:topicsDic]];
            }
            
            succeededBlock(topicsItemArray);
#warning SaveCache
                
            
            JHCache *cache = [JHCache init];
            [cache saveDataToMemory:topicsItemArray];
        

        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);

    }];
    
    
    return self;
}

-(instancetype)getRecentTopicsOnSucceeded:(ArrayBlock)succeededBlock
                                  onError:(ErrorBlock)errorBlock
{
    [self GET:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_RECENT_TOPICS] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *objectDic = responseObject;
        if ([objectDic objectForKey:@"rs"]!= 0) {
            NSArray *topicsArray = [objectDic objectForKey:@"list"];
            NSMutableArray *topicsItemArray = [NSMutableArray new];
            
            for (NSMutableDictionary *topicsDic in topicsArray) {
                // 这步将topicsArray 中的JSON  转换成 topicsItem 添加至Array
                // 然后返回 topicsItemArray
                [topicsItemArray addObject:[[JHTopicItem alloc]initWithDictionary:topicsDic]];
            }
            
            succeededBlock(topicsItemArray);
            
            JHCache *cache = [JHCache init];
            NSData *archivedData = [cache saveDataToMemory:topicsItemArray];
            //初始化一个cache类，将topicsItem全部固化成NSDate
            
#warning 正在做：缓存

        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
    
    return self;
}


-(instancetype)getTopicDetailsOnSucceeded:(ArrayBlock)succeededBlock
                                  onError:(ErrorBlock)errorBlock
{
    [self GET:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_TOPICS_DETAIL] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *objectDic = responseObject;
        if ([objectDic objectForKey:@"rs"]!=nil &&[objectDic objectForKey:@"rs"]!= 0) {
            
            NSDictionary *topicsAuthorDic = [objectDic objectForKey:@"topic"];
            JHTopicAuthorItem *tempAuthorItem = [[JHTopicAuthorItem alloc]initWithDictionary:topicsAuthorDic];
            NSArray *topicsDetailArray = [objectDic objectForKey:@"list"];
            NSMutableArray *topicsDetailItemArray = [[NSMutableArray alloc]initWithCapacity:topicsDetailArray.count+1];
            [topicsDetailItemArray addObject:tempAuthorItem];
            for (NSMutableDictionary *topicsDic in topicsDetailArray) {
                 [topicsDetailItemArray addObject:[[JHTopicDetailItem alloc]initWithDictionary:topicsDic]];
            }
            
#warning SaveCache
//[NSKeyedArchiver archiveRootObject:topicsDetailItemArray toFile:topicsDetailArchiver];
            
            [NSKeyedArchiver archivedDataWithRootObject:topicsDetailItemArray];
            
            succeededBlock(topicsDetailItemArray);
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
    
    return self;
}

-(instancetype)postNewTopicOnSucceeded:(ArrayBlock)succdedBlock
                               onerror:(ErrorBlock)errorBlock
{
    [self POST:kJHBaseURLString parameters:[JHForumAPI getParameterDic:POST_NEW_TOPIC] success:^(AFHTTPRequestOperation *operation, id responseObject) {
#warning 发表帖子成功
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
#warning 发表帖子失败
    }];
    
    return self;
    
}

-(instancetype)postNewReplyOnSucceeded:(ArrayBlock)succdedBlock
                               onerror:(ErrorBlock)errorBlock
{
    [self POST:kJHBaseURLString parameters:[JHForumAPI getParameterDic:POST_NEW_REPLY] success:^(AFHTTPRequestOperation *operation, id responseObject) {
#warning 回复帖子成功
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
#warning 回复帖子失败
    }];
    
    return self;
}

@end


