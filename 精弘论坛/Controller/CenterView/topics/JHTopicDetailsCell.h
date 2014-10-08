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

@property (weak, nonatomic) IBOutlet UILabel *detailText;

-(void)displayValues:(JHTopicDetailItem *)topicDetailItem;

@end
