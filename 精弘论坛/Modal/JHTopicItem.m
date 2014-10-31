//
//  JHTopicItem.m
//  精弘论坛
//
//  Created by Dikey on 9/25/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHTopicItem.h"

@implementation JHTopicItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        self.markAsRead = 0;
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:_board_id forKey:@"board_id"];
    [aCoder encodeObject:_board_name forKey:@"board_name"];
    [aCoder encodeObject:_last_reply_date forKey:@"last_reply_date"];
    [aCoder encodeInt:_essence forKey:@"essence"];
    [aCoder encodeInt:_hits forKey:@"hits"];
    [aCoder encodeInt:_hot forKey:@"hot"];
    [aCoder encodeObject:_pic_path forKey:@"pic_path"];
    [aCoder encodeFloat:_replies forKey:@"replies"];
    [aCoder encodeObject:_subject forKey:@"subject"];
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeInt:_top forKey:@"top"];
    [aCoder encodeInt:_topic_id forKey:@"topic_id"];
    [aCoder encodeObject:_type forKey:@"type"];
    [aCoder encodeInt:_user_id forKey:@"user_id"];
    [aCoder encodeObject:_user_nick_name forKey:@"user_nick_name"];
    [aCoder encodeInt:_vote forKey:@"vote"];
    [aCoder encodeInt:_markAsRead forKey: @"markAsRead"];
    
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self){
        self.board_id = [aDecoder decodeIntForKey:@"board_id"];
        self.board_name = [aDecoder decodeObjectForKey:@"board_name"];
        self.essence = [aDecoder decodeIntForKey:@"essence"];
        self.hits = [aDecoder decodeIntForKey:@"hits"];
        self.hot = [aDecoder decodeIntForKey:@"hot"];
        self.last_reply_date = [aDecoder decodeObjectForKey:@"last_reply_date"];
        self.pic_path = [aDecoder decodeObjectForKey:@"pic_path"];
        self.replies = [aDecoder decodeFloatForKey:@"replies"];
        self.subject = [aDecoder decodeObjectForKey:@"subject"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.top = [aDecoder decodeIntForKey:@"top"];
        self.topic_id = [aDecoder decodeIntForKey:@"topic_id"];
        self.type = [aDecoder decodeObjectForKey:@"type"];
        self.user_id = [aDecoder decodeIntForKey:@"user_id"];
        self.user_nick_name = [aDecoder decodeObjectForKey:@"user_nick_name"];
        self.vote = [aDecoder decodeIntForKey:@"vote"];
        self.markAsRead = [aDecoder decodeIntForKey:@"markAsRead"];
    }
    
    return self;
}




@end



/*
 "board_id" = 455;
 "board_name" = "\U300e\U540c\U4e61\U60c5\U8c0a\U300f";
 essence = 0;
 hits = 4452;
 hot = 0;
 "last_reply_date" = 1411915369000;
 "pic_path" = "";
 replies = 343;
 subject = "          \U53c8\U662f\U4e00\U5e74\U6bd5\U4e1a\U65f6\Uff0c\U8be5\U8d70\U7684\U7ec8\U7a76\U8981\U8d70\Uff0c \U56e0\U4e3a\U53bb\U5b9e\U4e60\U4e86\U8fd9\U5b66\U671f\Uff0c\U628a\U697c\U8352";
 title = "\U2605\U5317\U4ed1\U2605 \U4e1c\U65b9\U5927\U6e2f\U2014\U5b81\U6ce2\U5317\U4ed1\Uff08\U6316\U8d77\U5927\U697c\U627e\U4e2a\U65b0\U697c\U4e3b\Uff09";
 top = 0;
 "topic_id" = 873818;
 type = normal;
 "user_id" = 111704;
 "user_nick_name" = "\U5c0f\U5676";
 vote = 0;
 
*/