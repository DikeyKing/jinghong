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
/*
 "board_id": 455,
 "board_name": "『同乡情谊』",
 "board_child": 0,
 "board_img": "",
 "topic_total_num": 915,
 "posts_total_num": 526718,
 "td_posts_num": 9,
 "last_posts_date": "1411111560000",
 "board_content": 1,
 "forumRedirect": ""
 */

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


//@property (copy, nonatomic) NSString *boardId;
//@property (copy, nonatomic) NSString *boardName;
//@property (copy, nonatomic) NSString *boardChild;
//@property (copy, nonatomic) NSString *boardImg;
//@property (copy, nonatomic) NSString *topicTotalNum;
//@property (copy, nonatomic) NSString *postsTotalNum;
//@property (copy, nonatomic) NSString *tdPostsNum;
//@property (copy, nonatomic) NSString *lastPostsDate;
//@property (copy, nonatomic) NSString *boardcontent;

//@property (copy, nonatomic) NSString *forumRedirect;
@end


/*    "board_category_id" = 478;
 "board_category_name" = "\U767d\U9a79\U8fc7\U9699";
 "board_category_type" = 2;
 "board_list" =     (
 {
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
 }*/

