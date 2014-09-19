//
//  JHCenterViewController.m
//  精弘论坛
//
//  Created by Dikey on 9/14/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHCenterViewController.h"
#import "AFNetworking.h"
#import "JHUser.h"
#import "JHForumListCell.h"

@interface JHCenterViewController ()

@end

@implementation JHCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    
    [self getFormList];
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
                                 @"forumKey": @"CIuLQ1lkdPtOlhNuV4",
                                 
                                 @"sdkVersion": @"2.0.0",
                                 @"accessToken":[JHUser sharedInstance].token,
                                 //@"accessToken":@"8a7e56597e8b55881c67b1cb28b1b",
                                 
                                 @"forumType":@"7",
                                 @"sdkType": @"1",
                                 @"accessSecret":[JHUser sharedInstance].secretToken,
                                 //@"accessSecret":@"2a113ad6cfadce314a60a79d33cb7",
                                 
                                 @"forumId":@"1",
                                 @"packageName": @"com.mobcent.newforum.app82036",
                                 @"platType": @"5"
                                 };
    
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = responseObject;
        if ([[dic objectForKey:@"rs"] boolValue] == 1) {
            if (!_forumList) {
                _forumList = [[NSArray alloc]init];
            }
            _forumList = [dic objectForKey:@"list"];
            [_tableView reloadData];
            
            
            
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma UITableViewDataSoucce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_forumList count];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_forumList!=nil) {
        return [[_forumList[section]objectForKey:@"board_list"] count];
    }
    return 0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*    "board_category_id" = 478;
     "board_category_name" = "\U767d\U9a79\U8fc7\U9699";
     "board_category_type" = 2;
     "board_list" =     (
     {
     "board_child" = 1;
     "board_content" = 1;
     "board_id" = 299;
     "board_img" = "";
     "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
     forumRedirect = "";
     "last_posts_date" = 1411089180000;
     "posts_total_num" = 4236;
     "td_posts_num" = 3;
     "topic_total_num" = 245;
     }*/
    
    JHForumListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JHForumListCell"];
    if (_forumList) {
        
        _boardList = [_forumList[0] objectForKey:@"board_list"];
        
        cell.boardName.text = [_boardList[0] objectForKey:@"board_name"];
        
        
    }
    return cell;
}

- (IBAction)selectedSegment:(id)sender
{
    switch ([sender selectedSegmentIndex]) {
        case 0:
            NSLog(@"最新帖子");
            _tableView.hidden = YES;
            
            break;
        case 1:
            NSLog(@"论坛列表");
            _tableView.hidden =NO;
            
            break;
        default:
            break;
    }
}



#pragma sementControll

@end
