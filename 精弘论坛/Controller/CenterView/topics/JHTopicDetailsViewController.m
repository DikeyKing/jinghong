//
//  JHTopicDetailsViewController.m
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//
//

#import "JHTopicDetailsViewController.h"
#import "JHRESTEngine.h"

@interface JHTopicDetailsViewController ()

@property (strong ,nonatomic) NSArray *topicsDetailsItems;

@end

@implementation JHTopicDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
