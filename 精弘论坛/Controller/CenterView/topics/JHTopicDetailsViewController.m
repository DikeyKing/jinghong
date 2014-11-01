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

const static int addPage =1;
const static int minPage = 1;
const static int firstPage =1;

@interface JHTopicDetailsViewController ()

@property (copy ,nonatomic) NSMutableArray *topicsDetailsItems; //这个array包含所以帖子信息数据
@property (assign, nonatomic) int topicDetailPageNumber;

@end

@implementation JHTopicDetailsViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    _topicDetailPageNumber = firstPage;
    [JHUserDefaults saveTopicDetailPage:@"1"];
    
    [self setTableViewHeaderAndFoot]; //与tableView相关的操作
    [self getTopicDetails];
}

-(void)viewWillAppear:(BOOL)animated
{
//    [self getTopicDetailsCache];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [SVProgressHUD dismiss];
}

-(void)getTopicDetailsCache
{
    NSArray *data = [[JHRESTEngine sharedJHRESTManager]getCachedArray:CacheType_TopicsDetails];
    
    if (!data && data.count==0) {
//        [self getTopicDetails];
        [SVProgressHUD showProgress:SVProgressHUDMaskTypeGradient status:@"已经是最后一页"];
        [SVProgressHUD dismiss];
        
    }else{
        if (!_topicsDetailsItems) {
            _topicsDetailsItems = [NSMutableArray new];
            for (id object in data) {
                if (![_topicsDetailsItems containsObject:object]) {
                    [_topicsDetailsItems addObject:object];
                }
            }
            [_topicDetailTV reloadData];
        }else{
            for (JHTopicDetailItem* object in data) {
                if (![_topicsDetailsItems containsObject:object]) {
                    [_topicsDetailsItems addObject:object];
                }
            }            
            if (_topicsDetailsItems.count!=0) {
                [_topicDetailTV reloadData];
            }else{
                [SVProgressHUD showProgress:SVProgressHUDMaskTypeBlack status:@"已经是最后一页"];
            }
        }
    }
}

-(void)setTableViewHeaderAndFoot
{
    _topicDetailTV.delegate = self;
    _topicDetailTV.dataSource =self;
    
    [_topicDetailTV addHeaderWithCallback:^{
        _topicDetailTV.headerRefreshingText = @"下拉刷新~";
        if (_topicDetailPageNumber == firstPage ) {
            [self getTopicDetails];
        }else{
            _topicDetailPageNumber -= minPage;
            [JHUserDefaults savePage:[NSString stringWithFormat:@"%d",_topicDetailPageNumber]];
            [self getTopicDetailsCache];
        }
        
        [_topicDetailTV headerEndRefreshing];
    }];
    
    [_topicDetailTV addFooterWithCallback:^{
        _topicDetailTV.footerRefreshingText = @"上拉加载更多";
        _topicDetailPageNumber += addPage;
        [JHUserDefaults saveTopicDetailPage:[NSString stringWithFormat:@"%d",_topicDetailPageNumber]];
        [self getTopicDetailsCache];
        
        [_topicDetailTV footerEndRefreshing];
        
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
    
    
    if (indexPath.row==0&&_topicsDetailsItems!=nil&&_topicsDetailsItems.count!=0 &&_topicDetailPageNumber==1 ) {
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
