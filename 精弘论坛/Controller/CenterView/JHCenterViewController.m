//
//  JHCenterViewController.m
//  精弘论坛
//
//  Created by Dikey on 9/14/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHCenterViewController.h"

#import "AFNetworking.h"
#import "JHForumAPI.h"
#import "JHForumListCell.h"
#import "JHTopicsViewController.h"

#import "JHJsonToModel.h"

@interface JHCenterViewController ()

@end

@implementation JHCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    
    [self getBoardList];
}

#warning 这里还需要加入判定，可能板块中还有板块(会闪退)
-(void)getBoardList
{
    NSString *urlString =JH_BASE_URL;
    NSDictionary *parameters = [JHForumAPI getParameterDic:GET_BOARD_LIST];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = responseObject;
        if ([[dic objectForKey:@"rs"] boolValue] == 1) {
            if (!_forumList) {
                _forumList = [[NSArray alloc]init];
            }
            _forumList = [JHJsonToModel getBoardItem:[dic objectForKey:@"list"]];
            
//            _forumList = [dic objectForKey:@"list"];
    
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
        _boardList = [_forumList[indexPath.section] objectForKey:@"board_list"];
        
        //_boardID[indexPath.row] = [_forumList[indexPath.section] objectForKey:@"board_id"];
        
        cell.boardName.text = (NSString*)[_boardList[indexPath.row] objectForKey:@"board_name"];
        cell.tdPostCount.text = [NSString stringWithFormat:@"%@",[_boardList[indexPath.row] objectForKey:@"td_posts_num"]];
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _boardList = [_forumList[indexPath.section] objectForKey:@"board_list"];
    NSLog(@"编号%@ 版块%@",[_boardList[indexPath.row] objectForKey:@"board_id"],[_boardList[indexPath.row] objectForKey:@"board_name"]);
    
    JHTopicsViewController *jHTopicsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"JHTopicsViewController"];
    [JHCommonConfigs sharedConfig].boardID = [[_boardList[indexPath.row] objectForKey:@"board_id"]intValue];
    
    [self.navigationController pushViewController:jHTopicsVC animated:YES];
    
    
    
    
    
    //todo:根据推送至下一个界面，下一个界面根据board_id来获取页面内容
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma sementControll

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

@end
