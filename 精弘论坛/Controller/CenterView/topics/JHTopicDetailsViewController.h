//
//  JHTopicDetailsViewController.h
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHTopicDetailsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) IBOutlet UITableView *topicDetailTV;
@property (nonatomic,weak) IBOutlet UILabel *titleLabel;

@end
