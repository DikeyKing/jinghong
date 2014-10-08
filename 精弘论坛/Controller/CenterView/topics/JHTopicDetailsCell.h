//
//  JHTopicDetailsCell.h
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHTopicDetailItem;

@interface JHTopicDetailsCell : UITableViewCell
//icon
//posts_date
//reply_name
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *reply_name;
@property (weak, nonatomic) IBOutlet UILabel *userTitle; //
@property (weak, nonatomic) IBOutlet UILabel *position; //楼层
@property (weak, nonatomic) IBOutlet UILabel *posts_date;

@property (weak, nonatomic) IBOutlet UILabel *detailText;



-(void)displayValues:(JHTopicDetailItem *)topicDetailItem;

@end
