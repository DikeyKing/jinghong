//
//  JHRecentTopicsCell.h
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHTopicItem;

@interface JHRecentTopicsCell : UITableViewCell

@property (strong,nonatomic) JHTopicItem* recentTopicItem;

@property (weak,nonatomic) IBOutlet UILabel *boardName;
@property (weak,nonatomic) IBOutlet UILabel *subject;
@property (weak,nonatomic) IBOutlet UILabel *title;
@property (weak,nonatomic) IBOutlet UILabel *userNickName;

-(void)displayValues:(JHTopicItem *)topicItem;

@end
