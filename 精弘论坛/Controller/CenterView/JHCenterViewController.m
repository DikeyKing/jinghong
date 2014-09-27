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
#import "SVProgressHUD.h"
#import "JHRESTEngine.h"

#import "JHBoardItem.h"
#import "JHFourmItem.h"

@interface JHCenterViewController ()

@property (strong, nonatomic) JHFourmItem *jHForumItem;
@property (strong, nonatomic) JHBoardItem *jHBoardItem;

@end

@implementation JHCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self getBoardList];

}

-(void)viewWillAppear:(BOOL)animated
{

}

-(void)getRecentTopTenTopics
{

}

-(void)getBoardList
{
    [[JHRESTEngine sharedJHRESTManager]getBoardListOnSucceeded:^(NSMutableArray *modelObjects) {
        if (!_forumItemList) {
            _forumItemList = [[NSArray alloc]init];
        }
        if (modelObjects!=nil) {
        _forumItemList = [modelObjects copy];
        [_tableView reloadData];
        }else{
            [SVProgressHUD showErrorWithStatus:@"没有返回列表"];
        }
    } onError:^(NSError *engineError) {
        
    }];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma UITableViewDataSoucce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_forumItemList count];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_forumItemList!=nil) {
//        return [[_forumItemList[section]objectForKey:@"board_list"] count];
        _jHForumItem = _forumItemList[section];
        return [_jHForumItem.board_list count];
    }
    return 0;
}

#warning 这里还需要加入判定，可能板块中还有板块(会闪退)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHForumListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JHForumListCell"];
    if (_forumItemList) {
        _jHForumItem = _forumItemList[indexPath.section];
        _jHBoardItem = _jHForumItem.board_list[indexPath.row];
        
        cell.boardName.text = _jHBoardItem.board_name;
        cell.tdPostCount.text = [NSString stringWithFormat:@"%@",_jHBoardItem.td_posts_num];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    JHTopicsViewController *jHTopicsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"JHTopicsViewController"];
    
    if (_forumItemList) {
        _jHForumItem = _forumItemList[indexPath.section];
        _jHBoardItem = _jHForumItem.board_list[indexPath.row];
        
        [JHCommonConfigs sharedConfig].boardID = [_jHBoardItem.board_id intValue];
        [self.navigationController pushViewController:jHTopicsVC animated:YES];
     }
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
            
            
            //切换标题，重新赋予数据源，最新帖子
            //[_tableView reloadData];
            
            _tableView.hidden = YES;
            
            break;
        case 1:
            NSLog(@"论坛列表");
            
            
            //论坛状态
            //[_tableView reloadData];

            _tableView.hidden =NO;
            break;
        default:
            break;
    }
}

@end
