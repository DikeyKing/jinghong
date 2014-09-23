//
//  JHRESTEngine.m
//  精弘论坛
//
//  Created by Dikey on 9/22/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHRESTEngine.h"
#import "JHForumAPI.h"
#import "SVProgressHUD.h" 
#import "JHUserDefaults.h"

static NSString * const kJHBaseURLString = @"http://bbs.zjut.edu.cn/mobcent/app/web/index.php";
static NSString * const kJHLoginURLString = @"http://bbs.zjut.edu.cn/mobcent/login/login.php";

@implementation JHRESTEngine

//+(instancetype)sharedJHRESTManager
//{
//    static JHRESTEngine *sharedEngine = nil;
//    static dispatch_once_t *onceToken ;
//    dispatch_once(onceToken,^{
//        sharedEngine = [[JHRESTEngine manager]init];
//    });
//    return sharedEngine;
//}

-(id) loginWithName:(NSString*) loginName
           password:(NSString*) password
        onSucceeded:(VoidBlock) succeededBlock
            onError:(ErrorBlock) errorBlock
{
    JHRESTEngine *engineManager = [[JHRESTEngine alloc]init];
    [engineManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    
    [engineManager POST:kJHLoginURLString parameters:[JHForumAPI getParameterDic:GET_LOGIN]
 success:^(AFHTTPRequestOperation *operation, id responseObject) {
     
     /*
      Printing description of responseObject:
      {
      avatar = "http://center.zjut.com/images/noavatar_middle.gif";
      counts = "<null>";
      fid = 1;
      rs = 1;
      secret = 2a113ad6cfadce314a60a79d33cb7;
      token = 8a7e56597e8b55881c67b1cb28b1b;
      uid = 273684;
      }      
      */
     
     NSDictionary *dic = responseObject;
        //成功后的回调，把resopnseobject返回给loginVC；
     
        if ([[dic objectForKey:@"rs"] boolValue] == 1) {
            [JHUserDefaults saveToken:[dic objectForKey:@"token"]];
            [JHUserDefaults saveToken:[dic objectForKey:@"secret"]];
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            [JHCommonConfigs sharedConfig].loginState= YES ;
        }else{
            [SVProgressHUD showErrorWithStatus:@"用户名或密码错误"];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"发生错误"];
        
        //这里处理失败消息
        
    }];
    return nil;
}

@end
