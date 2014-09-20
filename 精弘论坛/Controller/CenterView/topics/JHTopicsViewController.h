//
//  JHTopicsViewController.h
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHTopicsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *topicsTableView;

@property (copy,nonatomic) NSString *boardID;

@property (assign,nonatomic) int page;
@property (assign,nonatomic) int topicID;

@property (strong, nonatomic) NSArray *topicsList;




/*
 "page": 1,
 "has_next": 1,
 "total_num": 78097
 */

@end
