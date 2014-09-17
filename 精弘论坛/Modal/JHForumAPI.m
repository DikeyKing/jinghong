//
//  JHForumAPI.m
//  精弘论坛
//
//  Created by Dikey on 9/17/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHForumAPI.h"
#import "AFNetworking.h"

#define JH_FORUMTYPE @"7"
#define JH_FORUMKEY @"CIuLQ1lkdPtOlhNuV4"
#define JH_SDKTYPE @"1"
#define JH_PACKAGENAME @"com.mobcent.newforum.app82036"
#define JH_PLATTYPE @"5"
#define JH_APPNAME @"2.0.0"
#define JH_SDKVERSION @"appletest"


@implementation JHForumAPI

+(void)login
{
    NSString *urlString = @"http://bbs.zjut.edu.cn/mobcent/login/login.php";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    NSDictionary *parameters = @{@"forumType": JH_FORUMTYPE,
                                 @"forumKey": JH_FORUMKEY,
                                 @"sdkType": JH_SDKTYPE,
                                 @"packageName": JH_PACKAGENAME,
                                 @"platType": JH_PLATTYPE,
                                 @"appName": JH_APPNAME,
                                 @"sdkVersion": JH_SDKVERSION,

                                 @"email": @"iosapp",
                                 @"password": @"appletest"
                                 };
    
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = responseObject;
        if ([[dic objectForKey:@"rs"] boolValue] == 1) {
            
            //保存设置
            //            [Toolkit saveUserName:_nameTextField.text];
            //            [Toolkit saveID:[dic objectForKey:@"id"]];
            //            [Toolkit saveName:[dic objectForKey:@"name"]];
            //            [Toolkit saveToken:[dic objectForKey:@"token"]];
            
//            _loginHud = [[MBProgressHUD alloc]initWithView:self.navigationController.view];
//            [self.navigationController.view addSubview:_loginHud];
//            _loginHud.delegate = (id)self;
//            _loginHud.labelText = @"登录成功";
//            [_loginHud showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
//            
        }
        else{
//            _loginHud = [[MBProgressHUD alloc]initWithView:self.navigationController.view];
//            [self.navigationController.view addSubview:_loginHud];
//            _loginHud.delegate = (id)self;
//            _loginHud.labelText = @"输入有误";
//            [_loginHud showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
//            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
