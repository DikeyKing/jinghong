//
//  JHTopicDetailsCell.h
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHTopicDetailItem;
@class JHTopicAuthorItem;

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

@property (assign,nonatomic,readonly) CGFloat cellHeight; //根据infor 计算出cell高度

-(void)displayValuesOfAuthor:(JHTopicAuthorItem *)topicAuthorItem;
-(void)displayValues:(JHTopicDetailItem *)topicDetailItem;

@end
