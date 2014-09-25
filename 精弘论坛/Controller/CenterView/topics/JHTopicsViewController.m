//
//  JHTopicsViewController.m
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHTopicsViewController.h"
#import "JHTopicsCell.h"
#import "JHRESTEngine.h"

@interface JHTopicsViewController ()

@end

@implementation JHTopicsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _topicsTableView.delegate = self;
    _topicsTableView.dataSource = self;
    
   // [JHCommonConfigs sharedConfig].page = 1;
    
    
    [self getTopics];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)getTopics
{
    [[JHRESTEngine sharedJHRESTManager]getTopicsListOnSucceeded:^(NSMutableArray *modelObjects) {
        //
    } onError:^(NSError *engineError) {
        //
    }];
    
}



/*
 "list": [
 {
 "board_id": 303,
 "board_name": "『 池塘边 』",
 "topic_id": 1627002,
 "type": "normal",
 "title": "[闲聊灌水]听说山里要禁电瓶车了、？",
 "user_id": 225561,
 "user_nick_name": "尐卩孩",
 "last_reply_date": "1411116372000",
 "vote": 0,
 "hot": 0,
 "hits": 42,
 "replies": 5,
 "essence": 0,
 "top": 0,
 "subject": "是真的么？还是不了了之了。有意入辆代步万一禁了那不草蛋了。  各位大神知道详情么",
 "pic_path": ""
 },
 */


/*
 r	forum/topiclist
 boardId	303
 appName	精弘论坛
 sdkVersion	2.0.0
 forumKey	CIuLQ1lkdPtOlhNuV4
 pageSize	10
 accessToken
 forumType	7
 page	1
 sdkType	1
 accessSecret
 forumId	1
 packageName	com.mobcent.newforum.app82036
 platType	5
 */


#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHTopicsCell *jHTopicsCell = [tableView dequeueReusableCellWithIdentifier:@"JHTopicsCell"];
    
    
    if (_topicsList!=nil) {
        NSDictionary *topicDic = _topicsList[indexPath.row];
        jHTopicsCell.topicTitle.text = [topicDic objectForKey:@"title"];
        jHTopicsCell.authorName.text = [topicDic objectForKey:@"user_nick_name"];

        
    }

    
    
    return jHTopicsCell;
}







@end
