//
//  JHRESTEngine.m
//  精弘论坛
//
//  Created by Dikey on 9/22/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHRESTEngine.h"
#import "JHForumAPI.h"
#import "JHUserDefaults.h"

static NSString * const kJHBaseURLString = @"http://bbs.zjut.edu.cn/mobcent/app/web/index.php";
static NSString * const kJHLoginURLString = @"http://bbs.zjut.edu.cn/mobcent/login/login.php";

@implementation JHRESTEngine

//static HPHttpClient *_sharedClient = nil;
//static dispatch_once_t onceToken;
//dispatch_once(&onceToken, ^{
//    _sharedClient = [[HPHttpClient alloc] initWithBaseURL:[NSURL URLWithString:kHPClientBaseURLString]];
//});

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

-(id)loginWithCompletion:(void (^)(NSError *))block{
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

-(id)getBoardListOnSucceeded:(ArrayBlock)succeededBlock
                     onError:(ErrorBlock)errorBlock
{
    [self POST:kJHBaseURLString parameters:[JHForumAPI getParameterDic:GET_BOARD_LIST] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *objectDic = responseObject;
       
        if ([objectDic objectForKey:@"rs"] != 0) {
            //把dic 中list 解析为boardItem，传回array
            //将array传回block
            //然后block中刷新tableView
             NSArray *forumArray = [objectDic objectForKey:@"list"];
            NSMutableArray *forumNameArray = [NSMutableArray new];

            for (int i = 0; i< [forumArray count]; i++) {
                forumNameArray[i] = [forumArray[i] objectForKey:@"list"];
                
            }
            
            /*
             forumArray [0] [1]
             forumArray [i] objectForKey[board_category_name] 是标题
             [forumItemArray objectForKey [board_category_name]]; 获得所有标题
             boardArray = [forumArray[0] objectForKey board_list]
             boardItem = boardArray[i]
             [boardItemArray addObject BoardItem];
             
             list =     (
             {
             "board_category_id" = 478;
             "board_category_name" = "\U767d\U9a79\U8fc7\U9699";
             "board_category_type" = 2;
             "board_list" =             (
             {
             "board_child" = 1;
             "board_content" = 1;
             "board_id" = 299;
             "board_img" = "";
             "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
             
             */

            
            
            NSLog(@"成功了%@",objectDic);
            
        }else{
            //返回错误
            //block中显示 
        }
        

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败了%@",error);
        
    }];
    
    
    return self;
}
     
     
     
@end


