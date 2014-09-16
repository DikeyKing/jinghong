//
//  JHLoginViewController.m
//  精弘论坛
//
//  Created by Dikey on 8/27/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHLoginViewController.h"
#import "MBProgressHUD.h"

@interface JHLoginViewController ()
@property (strong,nonatomic) MBProgressHUD *loginHud;
@end

@implementation JHLoginViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    _userName.delegate =self;
    _userPassword.delegate =self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//开始登录
-(void)startLoginProgress
{
    NSLog(@"开始登录");

}

//登录按钮
- (IBAction)startLogin:(id)sender
{
    NSLog(@"开始登录");
    
    _loginHud = [[MBProgressHUD alloc]initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:_loginHud];
    _loginHud.delegate = (id)self;
    _loginHud.labelText = @"Loading";
    [_loginHud showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
    
    //todo：显示HUD
    //返回数据的时候
}

- (void)myTask {
	// Do something usefull in here instead of sleeping ...
	sleep(3);
    
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


@end
