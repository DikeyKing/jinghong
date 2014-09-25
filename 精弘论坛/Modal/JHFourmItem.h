//
//  JHFourmItem.h
//  精弘论坛
//
//  Created by Dikey on 9/24/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//
// 
#import <Foundation/Foundation.h>
#import "JHDataModel.h"

@interface JHFourmItem : JHDataModel

@property (copy,nonatomic) NSString *board_category_id;
@property (copy,nonatomic) NSString *board_category_name;
@property (copy,nonatomic) NSString *board_category_type;
@property (copy,nonatomic) NSMutableArray *board_list;

/*
 "board_category_id" = 478;
 "board_category_name" = "\U767d\U9a79\U8fc7\U9699";
 "board_category_type" = 2;
 "board_list" =  array
 
 array{
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
}
 
*/

@end
