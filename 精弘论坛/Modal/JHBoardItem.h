//
//  JHBoardItem.h
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHDataModel.h"

@interface JHBoardItem : JHDataModel

@property (copy, nonatomic) NSString *board_id;
@property (copy, nonatomic) NSString *board_name;
@property (copy, nonatomic) NSString *board_child;
@property (copy, nonatomic) NSString *board_img;
@property (copy, nonatomic) NSString *topic_total_num;
@property (copy, nonatomic) NSString *posts_total_num;
@property (copy, nonatomic) NSString *td_posts_num;
@property (copy, nonatomic) NSString *last_posts_date;
@property (copy, nonatomic) NSString *board_content;
@property (copy, nonatomic) NSString *forumRedirect;

@end


/*
 "board_child" = 1;
 "board_content" = 1;
 "board_id" = 299;
 "board_img" = "";
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 forumRedirect = "";
 "last_posts_date" = 1411089180000;
 "posts_total_num" = 4236;
 "td_posts_num" = 3;
 "topic_total_num" = 245;
 */

