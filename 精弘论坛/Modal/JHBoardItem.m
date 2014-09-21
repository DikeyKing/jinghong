//
//  JHBoardItem.m
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHBoardItem.h"


@implementation JHBoardItem
+(instancetype)init
{
    static JHBoardItem *jHBoardItem = nil;
    static dispatch_once_t *onceToken ;
    dispatch_once(onceToken,^{
        jHBoardItem = [JHBoardItem new];
    });
    return jHBoardItem;
}

//-(instancetype)initWithBoardId:(int )boardID
//                     boardName:(NSString *)boardName
//                 postsTotalNum:(int )topicTotalNum
//                 tdPostsNum:(int )postsTotalNum
//                 lastPostsDate:(int )tdPostsNum
//                 forumRedirect:(int )lastPostsDate
//                 topicTotalNum:(int )forumRedirect
//{
//    static JHBoardItem *sharedBoardItem =nil;
//    static dispatch_once_t oneceToken;
//    dispatch_once(&oneceToken,^{
//        sharedBoardItem = [[JHBoardItem alloc]init];
//    });
//    return sharedBoardItem;
//}

@end

//@property (assign,nonatomic) int boardId;
//@property (copy,nonatomic) NSString* boardName;
//@property (assign,nonatomic) int topicTotalNum;
//@property (assign,nonatomic) int postsTotalNum;
//@property (assign,nonatomic) int tdPostsNum;
//@property (assign,nonatomic) int lastPostsDate;
//@property (assign,nonatomic) int forumRedirect;
