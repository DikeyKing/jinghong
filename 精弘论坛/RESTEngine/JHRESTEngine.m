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

static NSString* const kJHBaseURLString = @"http://bbs.zjut.edu.cn/mobcent/app/web/index.php";
static NSString* const kJHLoginURLString = @"http://bbs.zjut.edu.cn/mobcent/login/login.php";

static NSString* const kCachedRecentTopics = @"RecentTopics";
static NSString* const kCachedBoardList = @"BoardListCache";
static NSString* const kCachedTopicDetails = @"TopicDetails";
static NSString* const kCachedForumList = @"ForumList";
static NSString* const kCachedTopicsList = @"TopicsList";

//缓存文件名

@interface JHRESTEngine()


@end


@implementation JHRESTEngine

-(NSArray* )getCachedArray:(int)cacheType
{
    NSArray *cachedData = [NSArray new];
    
    switch (cacheType) {
        case CacheType_RecentTopics:{
            NSString *recentTopicPage = [JHUserDefaults getRecentTopicPage];
            NSString *cachedRecentTopicFileName = [kCachedRecentTopics stringByAppendingString:recentTopicPage];
            cachedData = [[JHCache sharedInstance]getCachedItem:cachedRecentTopicFileName];
            [self getNextPageRecentTopicsListToCache];

        }break;

        case CacheType_BoardList:{
            cachedData = [[JHCache sharedInstance]getCachedItem:kCachedBoardList];
        }
            break;
            
        case CacheType_TopicsDetails:{
            NSString *currentTopicsID = [JHUserDefaults getTopicID];
            NSString *cacheTopicDetail = [kCachedTopicDetails stringByAppendingString:currentTopicsID];
            
            cachedData = [[JHCache sharedInstance]getCachedItem:cacheTopicDetail];
        }
            break;
            
        case CacheType_ForumList:{
            cachedData = [[JHCache sharedInstance]getCachedItem:kCachedForumList];
        }
            break;
            
        case CacheType_TopicsList:{
            NSString *parameterName = [[JHUserDefaults getBoardID]stringByAppendingString:[JHUserDefaults getPage]];
            NSString *cacheFileNameString = [kCachedTopicsList stringByAppendingString:parameterName];
            cachedData = [[JHCache sharedInstance]getCachedItem:cacheFileNameString];
    
            [self getNextPageTopicsListToCache];
        }
            break;
            
        default:
            break;
    }
    
    return cachedData;
}

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
            
            [[JHCache sharedInstance] cacheDataToFile:forumItemArray fileName:kCachedBoardList];
            //这行保存有点问题
            
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
                // 这步将topicsArray 中的JSON  转换成 topicsItem 添加至Array,然后返回 topicsItemArray
                [topicsItemArray addObject:[[JHTopicItem alloc]initWithDictionary:topicsDic]];
            }
            succeededBlock(topicsItemArray);
    
            NSString *parameterName = [[JHUserDefaults getBoardID]stringByAppendingString:[JHUserDefaults getPage]];
            NSString *cacheFileNameString = [kCachedTopicsList stringByAppendingString:parameterName];
            [[JHCache sharedInstance] cacheDataToFile:topicsItemArray fileName:cacheFileNameString];
                
            [self getNextPageTopicsListToCache];
        
            }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
    
    return self;
}

-(instancetype)getNextPageTopicsListToCache
{
     //获取第二页数据并缓存起来
    __block int pageNumber= [[JHUserDefaults getPage]intValue];
    pageNumber+= 2;
    [JHUserDefaults savePage:[NSString stringWithFormat:@"%d",pageNumber]];
    
    [self GET:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_TOPICS_LIST] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *objectDic = responseObject;
        if ([objectDic objectForKey:@"rs"]!= 0) {
            NSArray *topicsArray = [objectDic objectForKey:@"list"];
            NSMutableArray *topicsItemArray = [NSMutableArray new];
            
            for (NSMutableDictionary *topicsDic in topicsArray) {
                [topicsItemArray addObject:[[JHTopicItem alloc]initWithDictionary:topicsDic]];
            }
            
            NSString *parameterName = [[JHUserDefaults getBoardID]stringByAppendingString:[NSString stringWithFormat:@"%d",pageNumber]];
            NSString *cacheFileNameString = [kCachedTopicsList stringByAppendingString:parameterName];
            [[JHCache sharedInstance] cacheDataToFile:topicsItemArray fileName:cacheFileNameString];
            pageNumber -= 2;
            [JHUserDefaults savePage:[NSString stringWithFormat:@"%d",pageNumber]];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

    }];
    

    return self;
}

     
-(instancetype)getRecentTopicsOnSucceeded:(ArrayBlock)succeededBlock
                                  onError:(ErrorBlock)errorBlock
{
    //先从缓存中读取
    //读取成功，更新视图，（然后发起网络请求，感觉是错误的，不需要每次刷新）
    //读取不成功,发起网络请求
//    __block int pageNumber= [[JHUserDefaults getPage]intValue];
//    pageNumber+= 2;
//    [JHUserDefaults savePage:[NSString stringWithFormat:@"%d",pageNumber]];
   
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
                
                NSString *recentTopicPage = [JHUserDefaults getRecentTopicPage];
                NSString *cachedRecentTopicFileName = [kCachedRecentTopics stringByAppendingString:recentTopicPage];
                
                [[JHCache sharedInstance] cacheDataToFile:topicsItemArray fileName:cachedRecentTopicFileName];
                [self getNextPageRecentTopicsListToCache];
                }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            errorBlock(error);
        }];

    return self;
}

-(instancetype)getNextPageRecentTopicsListToCache
{
    //获取第二页数据并缓存起来
    __block int pageNumber= [[JHUserDefaults getRecentTopicPage]intValue];
    pageNumber+= 2;
    [JHUserDefaults saveRecentTopicPage:[NSString stringWithFormat:@"%d",pageNumber]];
    
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
            
            NSString *recentTopicPage = [JHUserDefaults getRecentTopicPage];
            NSString *cachedRecentTopicFileName = [kCachedRecentTopics stringByAppendingString:recentTopicPage];
            [[JHCache sharedInstance] cacheDataToFile:topicsItemArray fileName:cachedRecentTopicFileName];
            
            pageNumber-= 2;
            [JHUserDefaults saveRecentTopicPage:[NSString stringWithFormat:@"%d",pageNumber]];


        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    
    return self;
}

-(instancetype)getNextRecentTopicsOnSucceeded
{
    //获取第二页数据并缓存起来
    __block int pageNumber= [[JHUserDefaults getPage]intValue];
    pageNumber+= 2;
    [JHUserDefaults savePage:[NSString stringWithFormat:@"%d",pageNumber]];
    
    [self GET:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_RECENT_TOPICS] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *objectDic = responseObject;
        if ([objectDic objectForKey:@"rs"]!= 0) {
            NSArray *topicsArray = [objectDic objectForKey:@"list"];
            NSMutableArray *topicsItemArray = [NSMutableArray new];
            
            for (NSMutableDictionary *topicsDic in topicsArray) {
                  [topicsItemArray addObject:[[JHTopicItem alloc]initWithDictionary:topicsDic]];
            }
            
//            [[JHCache sharedInstance] cacheDataToFile:topicsItemArray fileName:kCachedRecentTopics];
            
            NSString *parameterName = [[JHUserDefaults getBoardID]stringByAppendingString:[NSString stringWithFormat:@"%d",pageNumber]];
            NSString *cacheFileNameString = [kCachedTopicsList stringByAppendingString:parameterName];
            [[JHCache sharedInstance] cacheDataToFile:topicsItemArray fileName:cacheFileNameString];
            
            pageNumber -= 2;
            [JHUserDefaults savePage:[NSString stringWithFormat:@"%d",pageNumber]];
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    return self;
}

-(instancetype)getTopicDetailsOnSucceeded:(ArrayBlock)succeededBlock
                                  onError:(ErrorBlock)errorBlock
{
//topicDetail 根据URL缓存...
//一个topic 一个url，一个缓存...
    [self GET:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_TOPICS_DETAIL] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *objectDic = responseObject;
        if ([objectDic objectForKey:@"rs"]!=nil &&[objectDic objectForKey:@"rs"]!= 0) {
            
            //坑...author 和 回帖人是分开的
            NSDictionary *topicsAuthorDic = [objectDic objectForKey:@"topic"];
            JHTopicAuthorItem *tempAuthorItem = [[JHTopicAuthorItem alloc]initWithDictionary:topicsAuthorDic];
            
            NSArray *topicsDetailArray = [objectDic objectForKey:@"list"];
            NSMutableArray *topicsDetailItemArray = [[NSMutableArray alloc]initWithCapacity:topicsDetailArray.count+1];
            
            [topicsDetailItemArray addObject:tempAuthorItem];

            for (NSMutableDictionary *topicsDic in topicsDetailArray) {
                 [topicsDetailItemArray addObject:[[JHTopicDetailItem alloc]initWithDictionary:topicsDic]];
            }

            succeededBlock(topicsDetailItemArray);
          
            NSString *currentTopicsID = [JHUserDefaults getTopicID];
            NSString *cacheTopicDetail = [kCachedTopicDetails stringByAppendingString:currentTopicsID];
            
            [[JHCache sharedInstance] cacheDataToFile:topicsDetailItemArray fileName:cacheTopicDetail];
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


