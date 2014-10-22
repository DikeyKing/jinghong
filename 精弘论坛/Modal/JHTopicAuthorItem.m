//
//  JHTopicAuthorItem.m
//  精弘论坛
//
//  Created by Dikey on 10/8/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHTopicAuthorItem.h"

#define FONT_SIZE 14.0f

#define CELL_CONTENT_MARGIN 10.0f

#define CELL_CONTENT_ORIGINHEIGHT 50.0f


@implementation JHTopicAuthorItem

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
    if([key isEqualToString:@"content"])
    {
        NSArray *array =  (NSArray *)value;
        if (array!=nil && array.count!= 0) {
            NSDictionary *dic = array[0];
            _contenttypeInfor = [dic objectForKey:@"infor"];
            _contentType = [[dic objectForKey:@"type"]intValue];
            _cellHeight = [self calculateCellHeight:_contenttypeInfor];
        }
    }
    else
        [super setValue:value forKey:key];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    //实际上用不到这么多参数的
    
    [aCoder encodeObject:_activityInfo forKey:@"activityInfo"];
    [aCoder encodeObject:_contenttypeInfor forKey:@"contenttypeInfor"];
    [aCoder encodeInt:_contentType forKey:@"contentType"];
    [aCoder encodeObject:_create_date forKey:@"create_date"];
    
    [aCoder encodeInt:_essence forKey:@"essence"];
    [aCoder encodeInt:_flag forKey:@"flag"];
    [aCoder encodeInt:_gender forKey:@"gender"];
    [aCoder encodeInt:_hits forKey:@"hits"];
    [aCoder encodeInt:_hot forKey:@"hot"];

    [aCoder encodeObject:_icon forKey:@"icon"];
    [aCoder encodeInt:_is_favor forKey:@"is_favor"];
    [aCoder encodeInt:_level forKey:@"level"];
    [aCoder encodeInt:_location forKey:@"location"];
    
    [aCoder encodeObject:_managePanel forKey:@"managePanel"];
    [aCoder encodeObject:_poll_info forKey:@"poll_info"];
    [aCoder encodeInt:_replies forKey:@"replies"];
    [aCoder encodeInt:_reply_posts_id forKey:@"reply_posts_id"];
    [aCoder encodeInt:_reply_status forKey:@"reply_status"];
    [aCoder encodeInt:_sortId forKey:@"sortId"];
    [aCoder encodeInt:_status forKey:@"status"];
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeInt:_top forKey:@"top"];

    [aCoder encodeInt:_topic_id forKey:@"topic_id"];
    [aCoder encodeObject:_type forKey:@"type"];
    [aCoder encodeObject:_user_nick_name forKey:@"user_nick_name"];
    [aCoder encodeObject:_userTitle forKey:@"userTitle"];
    [aCoder encodeInt:_vote forKey:@"vote"];
    [aCoder encodeInt:_user_id forKey:@"user_id"];
    
    [aCoder encodeFloat:_cellHeight forKey:@"cellHeight"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
      self.activityInfo= [aDecoder decodeObjectForKey:@"activityInfo"];
      self.contenttypeInfor = [ aDecoder decodeObjectForKey:@"contenttypeInfor"];
      self.contentType =[ aDecoder decodeIntForKey:@"contentType"];
     self.create_date =   [ aDecoder decodeObjectForKey:@"create_date"];
        
     self.essence =   [ aDecoder decodeIntForKey:@"essence"];
    self.flag =    [ aDecoder decodeIntForKey:@"flag"];
    self.gender =    [ aDecoder decodeIntForKey:@"gender"];
    self.hits =    [aDecoder decodeIntForKey:@"hits"];
    self.hot =    [aDecoder decodeIntForKey:@"hot"];
        
    self.icon =    [aDecoder decodeObjectForKey:@"icon"];
    self.is_favor =    [aDecoder decodeIntForKey:@"is_favor"];
    self.level =    [aDecoder decodeIntForKey:@"level"];
    self.location =    [aDecoder decodeIntForKey:@"location"];
        
    self.managePanel =    [aDecoder decodeObjectForKey:@"managePanel"];
    self.poll_info =    [aDecoder decodeObjectForKey:@"poll_info"];
    self.replies =    [aDecoder decodeIntForKey:@"replies"];
     self.reply_posts_id =   [aDecoder decodeIntForKey:@"reply_posts_id"];
     self.reply_status =   [aDecoder decodeIntForKey:@"reply_status"];
     self.sortId =   [aDecoder decodeIntForKey:@"sortId"];
     self.status =   [aDecoder decodeIntForKey:@"status"];
     self.title =   [aDecoder decodeObjectForKey:@"title"];
     self.top =   [aDecoder decodeIntForKey:@"top"];
        
    self.topic_id =    [aDecoder decodeIntForKey:@"topic_id"];
    self.type =    [aDecoder decodeObjectForKey:@"type"];
    self.user_nick_name =    [aDecoder decodeObjectForKey:@"user_nick_name"];
    self.userTitle =    [aDecoder decodeObjectForKey:@"userTitle"];
    self.vote =    [aDecoder decodeIntForKey:@"vote"];
    self.user_id =     [aDecoder decodeIntForKey:@"user_id"];
    _cellHeight = [aDecoder decodeFloatForKey:@"cellHeight"];
        
    }
    
    return self;
}

/*
 
 @property (assign,nonatomic) int hot;

 @property (assign,nonatomic) int topic_id;
 @property (copy,nonatomic) NSMutableString *type;
 @property (copy,nonatomic) NSMutableString *user_nick_name;
 @property (copy,nonatomic) NSMutableString *userTitle;
 @property (assign,nonatomic) int vote;
 @property (assign,nonatomic) int user_id;
 @property (assign,nonatomic,readonly) CGFloat cellHeight; //根据infor 计算出cell高度
 
 
 @property (copy,nonatomic) NSMutableString *activityInfo;
 @property (copy,nonatomic) NSMutableString *contenttypeInfor;
 @property (assign,nonatomic) int contentType;
 @property (copy,nonatomic) NSMutableString *create_date;
 @property (assign,nonatomic) int essence;
 @property (assign,nonatomic) int flag;
 @property (assign,nonatomic) int gender;
 @property (assign,nonatomic) int hits;

 @property (copy,nonatomic) NSMutableString *icon;
 @property (assign,nonatomic) int is_favor;
 @property (assign,nonatomic) int level;
 @property (assign,nonatomic) int location;
 @property (copy,nonatomic) NSMutableString *managePanel;
 @property (copy,nonatomic) NSMutableString *poll_info;
 @property (assign,nonatomic) int replies;
 @property (assign,nonatomic) int reply_posts_id;
 @property (assign,nonatomic) int reply_status;
 @property (assign,nonatomic) int sortId;
 @property (assign,nonatomic) int status;
 @property (copy,nonatomic) NSMutableString *title;
 @property (assign,nonatomic) int top;
 
 
 */


/*
 
 "topic": {
 "activityInfo": null,
 "content": [
 {
 "infor": "测试内容[酷]",
 "type": 0
 }
 ],
 "create_date": "1410948638000",
 "essence": 0,
 "flag": 0,
 "gender": 1,
 "hits": 11,
 "hot": 0,
 "icon": "http://center.zjut.com/avatar.php?uid=273684&size=middle",
 "is_favor": 0,
 "level": 0,
 "location": "",
 "managePanel": [
 ],
 "poll_info": null,
 "replies": 3,
 "reply_posts_id": 0,
 "reply_status": 1,
 "sortId": 0,
 "status": 1,
 "title": "[闲聊灌水]测试标题",
 "top": 0,
 "topic_id": 1626836,
 "type": "normal",
 "user_id": 273684,
 "user_nick_name": "iOSApp",
 "userTitle": "注册会员",
 "vote": 0
	},

 
 */

@end
