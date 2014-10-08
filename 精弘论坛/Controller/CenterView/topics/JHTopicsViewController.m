//
//  JHTopicsViewController.m
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//  主题列表


#import "JHTopicsViewController.h"
#import "JHTopicDetailsViewController.h"

#import "JHTopicsCell.h"
#import "JHRESTEngine.h"
#import "JHTopicItem.h"
#import "JHCommonConfigs.h"

@interface JHTopicsViewController ()
@property (strong,nonatomic) JHTopicItem* jhTopicItem;


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
        
        _topicsItemList = [modelObjects copy];
        
        [_topicsTableView reloadData];
        
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
    if (_topicsItemList!=nil&&_topicsItemList.count!=0 ) {
        return [_topicsItemList count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHTopicsCell *jHTopicsCell = [tableView dequeueReusableCellWithIdentifier:@"JHTopicsCell"];
    
    if (_topicsItemList!=nil) {
        
        [jHTopicsCell displayValues:(JHTopicItem *)_topicsItemList[indexPath.row]];
        
        /*
         _jhTopicItem	JHTopicItem *	0x14f58fe0	0x14f58fe0
         JHDataModel	JHDataModel
         _board_id	int	455	455
         _board_name	NSMutableString *	@"『同乡情谊』"	0x14f755b0
         _essence	int	0	0
         _hits	int	4452	4452
         _hot	int	0	0
         _last_reply_date	NSMutableString *	@"1411915369000"	0x14f7c880
         _pic_path	NSMutableString *	@""	0x3bc672f0
         _replies	long	343	343
         _subject	NSMutableString *	@"          又是一年毕业时，该走的终究要走， 因为去实习了这学期，把楼荒"	0x14f6c480
         _title	NSMutableString *	@"★北仑★ 东方大港—宁波北仑（挖起大楼找个新楼主）"	0x14f6ff20
         _top	int	0	0
         _topic_id	int	873818	873818
         _type	NSMutableString *	@"normal"	0x14e51770
         _user_id	int	111704	111704
         _user_nick_name	NSMutableString *	@"小噶"	0x14e2e840
         _vote	int	0	0
         */
    }
    
    return jHTopicsCell;
}


#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _jhTopicItem =  (JHTopicItem* )_topicsItemList[indexPath.row];
    [JHCommonConfigs sharedConfig].boardID = _jhTopicItem.board_id;
    [JHCommonConfigs sharedConfig].topicID = _jhTopicItem.topic_id;
    [JHCommonConfigs sharedConfig].uid = _jhTopicItem.user_id;
    
    JHTopicDetailsViewController *topicDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"JHTopicDetailsViewController"];
    [self.navigationController pushViewController:topicDetailVC animated:YES];
}





@end
