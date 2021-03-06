//
//  JHForumListCell.h
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHBoardItem;

@interface JHForumListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *boardName;
@property (weak, nonatomic) IBOutlet UILabel *tdPostCount;

-(void)displayValues:(JHBoardItem *)boardItem;
@end
