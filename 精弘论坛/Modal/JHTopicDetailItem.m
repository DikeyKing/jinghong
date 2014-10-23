//
//  JHTopicDetailItem.m
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHTopicDetailItem.h"


@implementation JHTopicDetailItem

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void) setValue:(id)value forKey:(NSString *)key
{
    //假如这里是一个Array...含有子板块，我们需要特殊处理
    if([key isEqualToString:@"reply_content"])
    {
        NSArray *tempArray = (NSArray *)value;
        if (tempArray!=nil && tempArray.count!=0) {
            NSDictionary *dic = tempArray[0];
            _infor = [dic objectForKey:@"infor"];
            _type = [[dic objectForKey:@"type"]intValue];
            _cellHeight = [self calculateCellHeight:_infor];
        }
    }
    else
        [super setValue:value forKey:key];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_icon forKey:@"icon"];
    [aCoder encodeObject:_is_quote forKey:@"is_quote"];
    [aCoder encodeObject:_level forKey:@"level"];
    [aCoder encodeObject:_location forKey:@"location"];
    [aCoder encodeObject:_managePanel forKey:@"managePanel"];
    [aCoder encodeInt:_position forKey:@"position"];
    
    [aCoder encodeObject:_posts_date forKey:@"posts_date"];
    [aCoder encodeObject:_quote_content forKey:@"quote_content"];
    [aCoder encodeObject:_quote_pid forKey:@"quote_pid"];
    [aCoder encodeObject:_quote_user_name forKey:@"quote_user_name"];
    [aCoder encodeObject:_infor forKey:@"infor"];
    [aCoder encodeInt:_type forKey:@"type"];
    [aCoder encodeFloat:_reply_id forKey:@"reply_id"];
    
    [aCoder encodeObject:_reply_name forKey:@"reply_name"];
    [aCoder encodeInt:_reply_status forKey:@"reply_status"];
    [aCoder encodeFloat:_reply_posts_id forKey:@"reply_posts_id"];
    
    [aCoder encodeObject:_reply_type forKey:@"reply_type"];
    [aCoder encodeInt:_role_num forKey:@"role_num"];
    [aCoder encodeInt:_status forKey:@"status"];

    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_userTitle forKey:@"userTitle"];
    
    [aCoder encodeFloat:_cellHeight forKey:@"cellHeight"];
    
    

}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.icon = [aDecoder decodeObjectForKey:@"icon"];
        self.is_quote = [aDecoder decodeObjectForKey:@"is_quote"];
        self.level = [aDecoder decodeObjectForKey:@"level"];
        self.location = [aDecoder decodeObjectForKey:@"location"];
        self.managePanel = [aDecoder decodeObjectForKey:@"managePanel"];
        self.position = [aDecoder decodeIntForKey:@"position"];
        self.posts_date = [aDecoder decodeObjectForKey:@"posts_date"];
        self.quote_content = [aDecoder decodeObjectForKey:@"quote_content"];
        self.quote_pid = [aDecoder decodeObjectForKey:@"quote_pid"];
        self.quote_user_name = [aDecoder decodeObjectForKey:@"quote_user_name"];
        self.infor = [aDecoder decodeObjectForKey:@"infor"];
        self.type = [aDecoder decodeIntForKey:@"type"];
        self.reply_id = [aDecoder decodeFloatForKey:@"reply_id"];
        self.reply_name = [aDecoder decodeObjectForKey:@"reply_name"];
        self.reply_posts_id = [aDecoder decodeFloatForKey:@"reply_posts_id"];
        self.reply_status = [aDecoder decodeIntForKey:@"reply_status"];
        self.reply_type = [aDecoder decodeObjectForKey:@"reply_type"];
        self.role_num = [aDecoder decodeIntForKey:@"role_num"];
        self.status = [aDecoder decodeIntForKey:@"status"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.userTitle = [aDecoder decodeObjectForKey:@"userTitle"];
        self.cellHeight = [aDecoder decodeFloatForKey:@"cellHeight"];
    }
    return self;
}



@end
