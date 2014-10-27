//
//  JHCenterViewController.h
//  精弘论坛
//
//  Created by Dikey on 9/14/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHCenterViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView; //论坛列表tableView
@property (weak, nonatomic) IBOutlet UITableView *recentTopicsTV;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@end
