//
//  JHTopicDetailsCell.m
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHTopicDetailsCell.h"
#import "JHTopicDetailItem.h"

@implementation JHTopicDetailsCell
-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)displayValues:(JHTopicDetailItem *)topicDetailItem
{
    
    _detailText.text = topicDetailItem.infor;
    _reply_name.text = topicDetailItem.reply_name;
    _posts_date.text = topicDetailItem.posts_date;
    _userTitle.text = topicDetailItem.userTitle;
    _position.text = [NSString stringWithFormat:@"%d",topicDetailItem.position]; 
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
