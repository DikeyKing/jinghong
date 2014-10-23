//
//  JHBoardItem.m
//  精弘论坛
//
//  Created by Dikey on 9/19/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHBoardItem.h"

@implementation JHBoardItem

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

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_board_id forKey:@"board_id"];
    [aCoder encodeObject:_board_name forKey:@"board_name"];
    [aCoder encodeObject:_board_child forKey:@"board_child"];
    [aCoder encodeObject:_board_img forKey:@"board_img"];
    [aCoder encodeObject:_topic_total_num forKey:@"topic_total_num"];
    [aCoder encodeObject:_posts_total_num forKey:@"posts_total_num"];
    [aCoder encodeObject:_td_posts_num forKey:@"td_posts_num"];
    [aCoder encodeObject:_last_posts_date forKey:@"last_posts_date"];
    [aCoder encodeObject:_board_content forKey:@"board_content"];
    [aCoder encodeObject:_forumRedirect forKey:@"forumRedirect"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _board_id = [aDecoder decodeObjectForKey:@"board_id"];
        _board_name = [aDecoder decodeObjectForKey:@"board_name"];
        _board_child =[aDecoder decodeObjectForKey:@"board_child"];
        _board_img =[aDecoder decodeObjectForKey:@"board_img"];
        _topic_total_num =[aDecoder decodeObjectForKey:@"topic_total_num"];
        _posts_total_num =[aDecoder decodeObjectForKey:@"posts_total_num"];
        _last_posts_date =[aDecoder decodeObjectForKey:@"last_posts_date"];
        _board_content =[aDecoder decodeObjectForKey:@"board_content"];
        _forumRedirect =[aDecoder decodeObjectForKey:@"forumRedirect"];
        _td_posts_num =[aDecoder decodeObjectForKey:@"td_posts_num"];
    }
    return self;
}
@end
