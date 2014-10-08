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

//#import "JHTopicDetailItem.h"

#import "JHRESTEngine.h"

@interface JHTopicDetailsViewController ()

@property (strong ,nonatomic) NSArray *topicsDetailsItems; //这个array包含所以帖子信息数据

@end

@implementation JHTopicDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _topicDetailTV.delegate = self;
    _topicDetailTV.dataSource =self;
    
    [self getTopicDetails];
}

-(void)getTopicDetails
{
    [[JHRESTEngine sharedJHRESTManager]getTopicDetailsOnSucceeded:^(NSMutableArray *modelObjects) {
        if (!_topicsDetailsItems) {
            _topicsDetailsItems = [NSArray new];
        }
        if (modelObjects!=nil) {
            _topicsDetailsItems = [modelObjects copy];
            [_topicDetailTV reloadData];
            
        }
        
    } onError:^(NSError *engineError) {
    
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
    
    if (_topicsDetailsItems!=nil&&_topicsDetailsItems.count!=0) {
        [topicDetailCell displayValues:(JHTopicDetailItem *)_topicsDetailsItems[indexPath.row]];
    }
    
    return topicDetailCell;
}

#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
