//
//  JHCenterViewController.h
//  精弘论坛
//
//  Created by Dikey on 9/14/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JHCenterViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (copy, nonatomic) NSArray *forumList;
@property (copy, nonatomic) NSArray *boardList;
@property (copy, nonatomic) NSMutableArray *boardID;


@end
