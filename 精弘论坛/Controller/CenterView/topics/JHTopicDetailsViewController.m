//
//  JHTopicDetailsViewController.m
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//
//

#import "JHTopicDetailsViewController.h"
#import "JHTopicDetailsCell.h"
#import "JHRESTEngine.h"
#import "SVProgressHUD.h"
#import "JHTopicDetailItem.h"
#import "JHTopicAuthorItem.h"
#import "MJRefresh.h"
#import "JHUserDefaults.h"

#define ORIGIN_CELL_HEIGHT 300.0f

@interface JHTopicDetailsViewController ()

@property (strong ,nonatomic) NSArray *topicsDetailsItems; //这个array包含所以帖子信息数据
@property (assign, nonatomic) int topicDetailPageNumber;

@end

@implementation JHTopicDetailsViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    _topicDetailPageNumber = 1;
    [self setTableViewHeaderAndFoot]; //与tableView相关的操作
}

-(void)viewWillAppear:(BOOL)animated
{
    [self getTopicDetailsCache];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [SVProgressHUD dismiss];
}

-(void)getTopicDetailsCache
{
    NSArray *data = [[JHRESTEngine sharedJHRESTManager]getCachedArray:CacheType_TopicsDetails];
    if (data) {
        if (!_topicsDetailsItems) {
            _topicsDetailsItems = [[NSArray alloc]initWithArray:data];
            if (_topicsDetailsItems!=nil && _topicsDetailsItems.count!=0) {
                [_topicDetailTV reloadData];
                [self getTopicDetails];
            }else{
                [self getTopicDetails];
            }
        }
    }
}

-(void)setTableViewHeaderAndFoot
{
    _topicDetailTV.delegate = self;
    _topicDetailTV.dataSource =self;
    
    [_topicDetailTV addHeaderWithCallback:^{
        _topicDetailTV.headerRefreshingText = @"测试下拉刷新环境~";
        
        //pull to refresh,first look for data at cache
        
        [self getTopicDetails];
        [_topicDetailTV headerEndRefreshing];
    }];
    
    [_topicDetailTV addFooterWithCallback:^{
        _topicDetailTV.footerRefreshingText = @"测试上拉刷新";
#warning todo：获取下一页的所有帖子然后加载（会不会下一页和第一页重复了？）
        
//        int page = [[JHUserDefaults getPage]intValue]+1;
//        [JHUserDefaults savePage:[NSString stringWithFormat:@"%d",page]];
        
        [_topicDetailTV footerEndRefreshing];
        
    }];
    
}
-(void)getTopicDetailCache
{
    
}

-(void)getTopicDetails
{
    [SVProgressHUD showProgress:SVProgressHUDMaskTypeNone];
    
    [[JHRESTEngine sharedJHRESTManager]getTopicDetailsOnSucceeded:^(NSArray *modelObjects) {
        [SVProgressHUD dismiss];
        
        if (!_topicsDetailsItems) {
            _topicsDetailsItems = [NSArray new];
        }
        if (modelObjects!=nil) {
            _topicsDetailsItems = [modelObjects copy];
            [_topicDetailTV reloadData];
        }
        
    } onError:^(NSError *engineError) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (nil!=_topicsDetailsItems && _topicsDetailsItems.count!=0) {
        return _topicsDetailsItems.count;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHTopicDetailsCell *topicDetailCell = [tableView dequeueReusableCellWithIdentifier:@"JHTopicDetailsCell"];
    
    if (indexPath.row==0&&_topicsDetailsItems!=nil&&_topicsDetailsItems.count!=0 ) {
        [topicDetailCell displayValuesOfAuthor:(JHTopicAuthorItem *)_topicsDetailsItems[0]];
    }else if (_topicsDetailsItems!=nil&&_topicsDetailsItems.count!=0) {
        [topicDetailCell displayValues:(JHTopicDetailItem *)_topicsDetailsItems[indexPath.row]];
    }
    
    return topicDetailCell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0&&_topicsDetailsItems!=nil&&_topicsDetailsItems.count!=0 ){
        JHTopicAuthorItem *itemAuthor = (JHTopicAuthorItem *)_topicsDetailsItems[0];
        return itemAuthor.cellHeight;
    }else if (_topicsDetailsItems!=nil&&_topicsDetailsItems.count!=0) {
        JHTopicDetailItem *itemDetail = (JHTopicDetailItem *)_topicsDetailsItems[indexPath.row];
        return itemDetail.cellHeight;
    }else
        return ORIGIN_CELL_HEIGHT;
}

#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
