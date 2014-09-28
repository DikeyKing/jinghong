//
//  JHRESTEngine.m
//  精弘论坛
//
//  Created by Dikey on 9/22/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHRESTEngine.h"
#import "JHForumAPI.h"
#import "JHFourmItem.h"
#import "JHTopicItem.h"

#import "JHUserDefaults.h"

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
    [self POST:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_BOARD_LIST] success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        NSDictionary *objectDic = responseObject;
        
        if ([objectDic objectForKey:@"rs"] != 0) {
            
            //声明forumArray
            //声明forumItemArray
            //转换forumArray
            //得到forumItemArray
            //不要关心细节，细节是模型类的事情
            
            NSArray *forumArray = [objectDic objectForKey:@"list"];
            NSMutableArray *forumItemArray = [NSMutableArray new];
            
            for (NSMutableDictionary *forumDic in forumArray) {
                [forumItemArray addObject:[[JHFourmItem alloc]initWithDictionary:forumDic]];
            }
            
            //forumItemArray 包含了服务器返回的所有版块名，回调指CenterView 更新视图~
            succeededBlock(forumItemArray);
            
        }else{
            NSLog(@"获取首页失败了,参数错误");
        }
          
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"获取首页失败了%@",error);
    }];
    return self;
}

-(instancetype)getTopicsListOnSucceeded:(ArrayBlock)succeededBlock
                                onError:(ErrorBlock)errorBlock
{
//    [self POST:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_TOPICS_LIST] success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        //获取数据后
//        NSDictionary *objectDic = responseObject;
//        NSLog(@"获取的List 是%@",objectDic);
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        //
//        //value	__NSCFConstantString *	@"JSON text did not start with array or object and option to allow fragments not set."	0x3bc6ebd0
//        //3840
//    }];
    
    [self GET:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_TOPICS_LIST] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *objectDic = responseObject;
        
        
        /*
         {
         "board_id" = 455;
         "board_name" = "\U300e\U540c\U4e61\U60c5\U8c0a\U300f";
         essence = 0;
         hits = 4452;
         hot = 0;
         "last_reply_date" = 1411915369000;
         "pic_path" = "";
         replies = 343;
         subject = "          \U53c8\U662f\U4e00\U5e74\U6bd5\U4e1a\U65f6\Uff0c\U8be5\U8d70\U7684\U7ec8\U7a76\U8981\U8d70\Uff0c \U56e0\U4e3a\U53bb\U5b9e\U4e60\U4e86\U8fd9\U5b66\U671f\Uff0c\U628a\U697c\U8352";
         title = "\U2605\U5317\U4ed1\U2605 \U4e1c\U65b9\U5927\U6e2f\U2014\U5b81\U6ce2\U5317\U4ed1\Uff08\U6316\U8d77\U5927\U697c\U627e\U4e2a\U65b0\U697c\U4e3b\Uff09";
         top = 0;
         "topic_id" = 873818;
         type = normal;
         "user_id" = 111704;
         "user_nick_name" = "\U5c0f\U5676";
         vote = 0;

         */
        
        
        if ([objectDic objectForKey:@"rs"]!= 0) {
            NSArray *topicsArray = [objectDic objectForKey:@"list"];
            NSMutableArray *topicsItemArray = [NSMutableArray new];
            
          //  NSLog(@"获取的item 是%@",topicsItemArray);
            NSLog(@"subject key is %@",[topicsArray[0] objectForKey:@"subject"]);
            
            for (NSMutableDictionary *topicsDic in topicsArray) {
                // 这步将topicsArray 中的JSON  转换成 topicsItem 添加至Array
                // 然后返回 topicsItemArray
                [topicsItemArray addObject:[[JHTopicItem alloc]initWithDictionary:topicsDic]];
            }
            NSLog(@"获取的List 是%@",topicsItemArray);

            succeededBlock(topicsItemArray);
        }

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    return self;
    
    /*
     list =     (
     {
     "board_id" = 455;
     "board_name" = "\U300e\U540c\U4e61\U60c5\U8c0a\U300f";
     essence = 0;
     hits = 40;
     hot = 0;
     "last_reply_date" = 1411714867000;
     "pic_path" = "";
     replies = 5;
     subject = "\U4f5c\U4e3a\U4e00\U540d\U5728\U5de5\U59274\U5e74\U7684\U8001\U4eba\Uff0c\U5176\U5b9e\U4e00\U76f4\U6000\U5ff5\U5c71\U4e1c\U7684\U5927\U9992\U5934\Uff0c\U7c73\U996d\U5403\U4e0d\U4e60\U60ef\Uff0c\U8fc7\U8282\U601d\U5ff5\U5bb6\U4eba\Uff0c";
     title = "[\U5730\U533a]2014\U5e74\U65b0\U5efa\U5c71\U4e1c\U8001\U4e61\U4f1a\U7fa4\Uff1a280739409";
     top = 0;
     "topic_id" = 1626191;
     type = normal;
     "user_id" = 202508;
     "user_nick_name" = yixianjuke;
     vote = 0;
     },
     {
     "board_id" = 455;
     "board_name" = "\U300e\U540c\U4e61\U60c5\U8c0a\U300f";
     essence = 0;
     hits = 37;
     hot = 0;
     "last_reply_date" = 1411655917000;
     "pic_path" = "";
     replies = 7;
     subject = "\U6c42\U805a\U4f1a\Uff0c\U6c42\U9a9a\U6270\Uff0c\U521a\U6765\U5b66\U6821\U597d\U65e0\U804a\U7684\U8bf4\Uff0c\U627e\U4e2a\U8001\U4e61\U4e0d\U5bb9\U6613\U554a\Uff01\U770b\U4e86\U597d\U591a\U5e16\U5b50\U53d1\U73b0\U90fd\U662f\U516d\U5b89\U4eba";
     title = "[\U5730\U533a]\U5bfb\U627e14\U7ea7\U5b89\U5fbd\U7684\U8001\U4e61\Uff01";
     top = 0;
     "topic_id" = 1627022;
     type = normal;
     "user_id" = 273723;
     "user_nick_name" = "may\U7ae5\U90ed\U51ef";
     vote = 0;
     },

     */
    
}


-(instancetype)getRecentTopicsOnSucceeded:(ArrayBlock)succeededBlock
                                  onError:(ErrorBlock)errorBlock
{
    [self GET:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_RECENT_TOPICS] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *objectDic = responseObject;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    return self;
}
@end


