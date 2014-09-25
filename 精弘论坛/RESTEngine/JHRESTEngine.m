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
        NSLog(@"获取的List 是%@",objectDic);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    return self;
}
@end


