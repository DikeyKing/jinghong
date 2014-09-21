//
//  JHLoginViewController.m
//  精弘论坛
//
//  Created by Dikey on 8/27/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHLoginViewController.h"
#import "DataModel.h"

#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "JHUser.h"
#import "JHForumAPI.h"

@interface JHLoginViewController ()
@end

@implementation JHLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _userName.delegate =self;
    _userPassword.delegate =self;
}

-(void)viewWillAppear:(BOOL)animated
{
    _userName.text = @"iosapp";
    _userPassword.text = @"appletest";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//开始登录
-(void)startLoginProgress
{
    [SVProgressHUD showWithStatus:@"登录中"];

    NSString *urlString = @"http://bbs.zjut.edu.cn/mobcent/login/login.php";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    NSDictionary *parameters = @{@"forumType": @"7",
                                 @"forumKey": @"CIuLQ1lkdPtOlhNuV4",
                                 @"sdkType": @"1",
                                 @"packageName": @"com.mobcent.newforum.app82036",
                                 @"platType": @"5",
                                 @"appName": @"精弘论坛",
                                 @"email": _userName.text,
                                 @"sdkVersion": @"2.0.0",
                                 @"password": _userPassword.text
                                 };
    
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = responseObject;
        if ([[dic objectForKey:@"rs"] boolValue] == 1) {
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            [JHCommonConfigs sharedConfig].loginState= YES ;
            
            //保存设置
            //            [Toolkit saveUserName:_nameTextField.text];
            //            [Toolkit saveID:[dic objectForKey:@"id"]];
            //            [Toolkit saveName:[dic objectForKey:@"name"]];
            //            [Toolkit saveToken:[dic objectForKey:@"token"]];
            
            [JHCommonConfigs sharedConfig].token = [dic objectForKey:@"token"];
            [JHCommonConfigs sharedConfig].secretToken = [dic objectForKey:@"secret"];
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }else{
            [SVProgressHUD showErrorWithStatus:@"用户名或密码错误"];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

//登录按钮
- (IBAction)startLogin:(id)sender
{

    [self startLoginProgress];
}

//键盘切换
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _userName) {
        [_userPassword becomeFirstResponder];
    }
    if (textField == _userPassword) {
        [_userPassword resignFirstResponder];
    }
    [self startLoginProgress];    
    
    //直接登录
    return YES;
}

//点击背景
- (IBAction)backGroundTapped:(id)sender
{
    [_userPassword resignFirstResponder];
    [_userName resignFirstResponder];
}


-(void)getFormList
{
    NSString *urlString = @"http://bbs.zjut.edu.cn/mobcent/app/web/index.php";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    NSDictionary *parameters = @{
                                 @"r":@"forum/forumlist",
                                 @"baikeType":@"1",
                                 @"appName":@"精弘论坛",
                                 @"sdkVersion": @"2.0.0",
                                 @"forumKey": @"CIuLQ1lkdPtOlhNuV4",
                                 @"accessToken":@"8a7e56597e8b55881c67b1cb28b1b",
                                 
                                 @"forumType":@"7",
                                 @"sdkType": @"1",
                                 @"accessSecret":@"2a113ad6cfadce314a60a79d33cb7",
                                 
                                 @"forumId":@"1",
                                 @"packageName": @"com.mobcent.newforum.app82036",
                                 @"platType": @"5"
                                 };
    
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = responseObject;
        
        if ([[dic objectForKey:@"rs"] boolValue] == 1) {
            
            NSLog(@"%@",dic);
            //      NSLog(@"%@",array);
            
            
            
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }else{
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

@end
