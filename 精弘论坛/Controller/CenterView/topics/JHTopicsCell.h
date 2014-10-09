//
//  JHTopicsCell.h
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHTopicItem;

@interface JHTopicsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *topicTitle;
@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (assign,nonatomic,readonly) CGFloat *cellHeight;
-(void)displayValues:(JHTopicItem *)topicItem;



@end
