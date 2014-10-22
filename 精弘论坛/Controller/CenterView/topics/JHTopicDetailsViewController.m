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

#define ORIGIN_CELL_HEIGHT 300.0f

@interface JHTopicDetailsViewController ()

@property (strong ,nonatomic) NSArray *topicsDetailsItems; //这个array包含所以帖子信息数据

@end

@implementation JHTopicDetailsViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self getTopicDetails];
    
    
    NSData *data = (NSData*)[[JHRESTEngine sharedJHRESTManager]getCachedArray:CacheType_TopicsDetails];
    NSArray *cachedItems = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if (!_topicsDetailsItems) {
        _topicsDetailsItems = [[NSArray alloc]initWithArray:cachedItems];
        NSLog(@"%@",_topicsDetailsItems);
        
        if (_topicsDetailsItems!=nil && _topicsDetailsItems.count!=0) {
            [_topicDetailTV reloadData];
        }
    }
    
//    _topicsDetailsItems=[[JHRESTEngine sharedJHRESTManager]getCachedArray:CacheType_TopicsDetails];
//    if (_topicsDetailsItems!=nil && _topicsDetailsItems.count!=0) {
//        [_topicDetailTV reloadData];
//        NSLog(@"_topicsDetailsItems 缓存中读取");
//    }
    
    
    [self setTableViewHeaderAndFoot]; //与tableView相关的操作
}

-(void)viewWillDisappear:(BOOL)animated
{
    [SVProgressHUD dismiss];
}

-(void)setTableViewHeaderAndFoot
{
    _topicDetailTV.delegate = self;
    _topicDetailTV.dataSource =self;
    
    [_topicDetailTV addHeaderWithCallback:^{
        _topicDetailTV.headerRefreshingText = @"测试下拉刷新环境~";
        [self getTopicDetails];
        
        [_topicDetailTV headerEndRefreshing];
    }];
    
    [_topicDetailTV addFooterWithCallback:^{
        _topicDetailTV.footerRefreshingText = @"测试上拉刷新";
        
        [_topicDetailTV footerEndRefreshing];
#warning todo：获取下一页的所有帖子然后加载（会不会下一页和第一页重复了？）
    }];
    
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
