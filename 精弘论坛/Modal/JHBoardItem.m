//
//  JHBoardItem.m
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHBoardItem.h"


@implementation JHBoardItem
//+(instancetype)init
//{
//    static JHBoardItem *jHBoardItem = nil;
//    static dispatch_once_t *onceToken ;
//    dispatch_once(onceToken,^{
//        jHBoardItem = [JHBoardItem new];
//    });
//    return jHBoardItem;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}
-(void) setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    
}


/*
 forumArray [0] [1]
 forumArray [i] objectForKey[board_category_name] 是标题
 [forumItemArray objectForKey [board_category_name]]; 获得所有标题
 boardArray = [forumArray[0] objectForKey board_list]
 boardItem = boardArray[i]
 [boardItemArray addObject BoardItem];
 */


/*
 Printing description of dic:
 {
 body =     {
 externInfo = "<null>";
 };
 errcode = "";
 head =     {
 alert = 0;
 errCode = 00000000;
 errInfo = "\U8c03\U7528\U6210\U529f,\U6ca1\U6709\U4efb\U4f55\U9519\U8bef";
 version = "2.1.0.1";
 };
 list =     (
 {
 "board_category_id" = 478;
 "board_category_name" = "\U767d\U9a79\U8fc7\U9699";
 "board_category_type" = 2;
 "board_list" =             (
 {
 "board_child" = 1;
 "board_content" = 1;
 "board_id" = 299;
 "board_img" = "";
 "board_name" = "\U300e \U65b0\U751f\U62a5\U5230 \U300f";
 forumRedirect = "";
 "last_posts_date" = 1411520580000;
 "posts_total_num" = 4290;
 "td_posts_num" = 1;
 "topic_total_num" = 251;
 }
 );
 },
 {
 "board_category_id" = 116;
 "board_category_name" = "\U518d\U6b21\U8d77\U822a";
 "board_category_type" = 2;
 "board_list" =             (
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 455;
 "board_img" = "";
 "board_name" = "\U300e\U540c\U4e61\U60c5\U8c0a\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411523040000;
 "posts_total_num" = 526795;
 "td_posts_num" = 2;
 "topic_total_num" = 917;
 },
 {
 "board_child" = 1;
 "board_content" = 0;
 "board_id" = 466;
 "board_img" = "";
 "board_name" = "\U300e\U79df\U623f\U4e8c\U624b\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411524600000;
 "posts_total_num" = 0;
 "td_posts_num" = 0;
 "topic_total_num" = 0;
 },
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 464;
 "board_img" = "";
 "board_name" = "\U300e\U5b66\U4e60\U8d44\U6e90\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411498200000;
 "posts_total_num" = 5453;
 "td_posts_num" = 1;
 "topic_total_num" = 375;
 },
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 385;
 "board_img" = "";
 "board_name" = "\U300e\U9e4a\U6865\U62db\U4eb2\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411523040000;
 "posts_total_num" = 46693;
 "td_posts_num" = 9;
 "topic_total_num" = 562;
 },
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 459;
 "board_img" = "";
 "board_name" = "\U300e\U5b66\U751f\U517c\U804c\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411524960000;
 "posts_total_num" = 118329;
 "td_posts_num" = 38;
 "topic_total_num" = 17677;
 },
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 458;
 "board_img" = "";
 "board_name" = "\U300e\U5b66\U672f\U4eba\U751f\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411469160000;
 "posts_total_num" = 96710;
 "td_posts_num" = 0;
 "topic_total_num" = 13023;
 },
 {
 "board_child" = 1;
 "board_content" = 1;
 "board_id" = 456;
 "board_img" = "";
 "board_name" = "\U300e\U6587\U827a\U4e4b\U8def\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411520580000;
 "posts_total_num" = 304743;
 "td_posts_num" = 1;
 "topic_total_num" = 11840;
 },
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 465;
 "board_img" = "";
 "board_name" = "\U300e\U7535\U8111\U7f51\U7edc\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411500180000;
 "posts_total_num" = 264833;
 "td_posts_num" = 3;
 "topic_total_num" = 23947;
 },
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 162;
 "board_img" = "";
 "board_name" = "\U300e\U65c5\U6e38\U6237\U5916\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411524540000;
 "posts_total_num" = 107252;
 "td_posts_num" = 2;
 "topic_total_num" = 4784;
 },
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 461;
 "board_img" = "";
 "board_name" = "\U300e\U60c5\U611f\U79d8\U5bc6\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411521960000;
 "posts_total_num" = 652604;
 "td_posts_num" = 4;
 "topic_total_num" = 21882;
 },
 {
 "board_child" = 1;
 "board_content" = 1;
 "board_id" = 30;
 "board_img" = "";
 "board_name" = "\U300e\U97f3\U4e50\U5f71\U89c6\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411486140000;
 "posts_total_num" = 153079;
 "td_posts_num" = 0;
 "topic_total_num" = 8093;
 },
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 303;
 "board_img" = "";
 "board_name" = "\U300e \U6c60\U5858\U8fb9 \U300f";
 forumRedirect = "";
 "last_posts_date" = 1411524960000;
 "posts_total_num" = 2220611;
 "td_posts_num" = 57;
 "topic_total_num" = 78141;
 }
 );
 },
 {
 "board_category_id" = 69;
 "board_category_name" = "\U5b66\U6821\U7248\U5757";
 "board_category_type" = 2;
 "board_list" =             (
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 471;
 "board_img" = "";
 "board_name" = "\U300e\U5b9e\U4e60\U5c31\U4e1a\U521b\U4e1a\U300f";
 forumRedirect = "";
 "last_posts_date" = 1411524420000;
 "posts_total_num" = 60161;
 "td_posts_num" = 4;
 "topic_total_num" = 9546;
 },
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 470;
 "board_img" = "";
 "board_name" = "\U300e For U\U7ef4\U6743 \U300f";
 forumRedirect = "";
 "last_posts_date" = 1411524480000;
 "posts_total_num" = 32441;
 "td_posts_num" = 2;
 "topic_total_num" = 7830;
 },
 {
 "board_child" = 1;
 "board_content" = 1;
 "board_id" = 91;
 "board_img" = "";
 "board_name" = "\U300e \U7814\U7a76\U751f\U9662 \U300f";
 forumRedirect = "";
 "last_posts_date" = 1411384920000;
 "posts_total_num" = 32921;
 "td_posts_num" = 0;
 "topic_total_num" = 4539;
 },
 {
 "board_child" = 1;
 "board_content" = 0;
 "board_id" = 409;
 "board_img" = "";
 "board_name" = "\U300e \U672c\U79d1\U5b66\U9662 \U300f";
 forumRedirect = "";
 "last_posts_date" = 1411522260000;
 "posts_total_num" = 0;
 "td_posts_num" = 0;
 "topic_total_num" = 0;
 }
 );
 },
 {
 "board_category_id" = 254;
 "board_category_name" = "\U8bba\U575b\U7ad9\U52a1";
 "board_category_type" = 2;
 "board_list" =             (
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 285;
 "board_img" = "";
 "board_name" = "\U300e \U8bba\U575b\U4e8b\U52a1 \U300f";
 forumRedirect = "";
 "last_posts_date" = 1411227660000;
 "posts_total_num" = 28814;
 "td_posts_num" = 0;
 "topic_total_num" = 1026;
 },
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 2;
 "board_img" = "";
 "board_name" = "\U300e \U7248\U4e3b\U7533\U8bf7 \U300f";
 forumRedirect = "";
 "last_posts_date" = 1411399200000;
 "posts_total_num" = 18057;
 "td_posts_num" = 0;
 "topic_total_num" = 408;
 },
 {
 "board_child" = 0;
 "board_content" = 1;
 "board_id" = 291;
 "board_img" = "";
 "board_name" = "\U300e \U5408\U4f5c\U4e8b\U5b9c \U300f";
 forumRedirect = "";
 "last_posts_date" = 1395598620000;
 "posts_total_num" = 918;
 "td_posts_num" = 0;
 "topic_total_num" = 162;
 }
 );
 },
 {
 "board_category_id" = 7;
 "board_category_name" = "\U7cbe\U5f18\U7f51\U7edc";
 "board_category_type" = 2;
 "board_list" =             (
 {
 "board_child" = 1;
 "board_content" = 1;
 "board_id" = 86;
 "board_img" = "";
 "board_name" = "\U300e \U6591\U7af9\U4e4b\U5bb6 \U300f";
 forumRedirect = "";
 "last_posts_date" = 0000;
 "posts_total_num" = 140230;
 "td_posts_num" = 1;
 "topic_total_num" = 4723;
 }
 );
 }
 );
 "online_user_num" = 0;
 rs = 1;
 "td_visitors" = 0;
 }

 */


@end
