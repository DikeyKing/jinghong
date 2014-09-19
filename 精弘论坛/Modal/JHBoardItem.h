//
//  JHBoardItem.h
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHBoardItem : NSObject

@property (assign,nonatomic) int boardId;
@property (copy,nonatomic) NSString* boardName;
@property (assign,nonatomic) int topicTotalNum;
@property (assign,nonatomic) int postsTotalNum;
@property (assign,nonatomic) int tdPostsNum;
@property (assign,nonatomic) int lastPostsDate;
@property (assign,nonatomic) int forumRedirect;

-(instancetype)initWithBoardId:(int )boardID
                     boardName:(NSString *)boardName
                 postsTotalNum:(int )topicTotalNum
                    tdPostsNum:(int )postsTotalNum
                 lastPostsDate:(int )tdPostsNum
                 forumRedirect:(int )lastPostsDate
                 topicTotalNum:(int )forumRedirect;

@end

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
