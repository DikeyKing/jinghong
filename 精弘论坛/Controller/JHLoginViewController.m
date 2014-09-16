//
//  JHLoginViewController.m
//  精弘论坛
//
//  Created by Dikey on 8/27/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHLoginViewController.h"
#import "MBProgressHUD.h"

#import "AFNetworking.h"


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
    
    NSString *urlString = @"http://bbs.zjut.edu.cn/forum.php?mod=forumdisplay&fid=303&mobile=yes";
    
    NSDictionary  *parameters = @{@"mod": @"forumdisplay",@"fid":@"303"};
    
    
    
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *req = [NSURLRequest requestWithURL:url];
//    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:req delegate:self startImmediately:YES];
 

     //get 方式
     NSString *properlyEscapedURL = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
     NSURL *URL = [NSURL URLWithString:properlyEscapedURL];
     NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
     AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];

    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, NSData *responseObject) {
     
        
       NSString *src = [self GBKresponse2String:responseObject];
     
        NSLog(@"%@", src);

        
        
        
        
//    NSString *requestTmp = [NSString stringWithString:operation.responseString];
//    NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
//        
//     //系统自带JSON解析
//     NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
//     NSLog(@"resultDic:%@", resultDic);

    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
     NSLog(@"error:%@",error);}];
     [operation start];

    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//  
//    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"返回失败");
//    }];
}

//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    NSData *receivedDate = [[NSData alloc]init];
//    receivedDate  = data;
//    NSLog(@"收到的数据%@",data);
//    
//}


- (NSString *)GBKresponse2String:(id) responseObject {
    
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSString *src = [[NSString alloc] initWithData:responseObject encoding:gbkEncoding];
    if (!src) src = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    return src;
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
    [self startLoginProgress];
    
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
