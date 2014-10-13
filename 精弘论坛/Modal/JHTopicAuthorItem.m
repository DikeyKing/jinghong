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
