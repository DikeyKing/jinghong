//
//  JHTopicDetailsCell.m
//  精弘论坛
//
//  Created by Dikey on 9/29/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHTopicDetailsCell.h"
#import "JHTopicDetailItem.h"

@implementation JHTopicDetailsCell
-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)displayValues:(JHTopicDetailItem *)topicDetailItem
{
    
    _detailText.text = topicDetailItem.infor;
    _reply_name.text = topicDetailItem.reply_name;
    _posts_date.text = topicDetailItem.posts_date;
    _userTitle.text = topicDetailItem.userTitle;
    _position.text = [NSString stringWithFormat:@"%d",topicDetailItem.position]; 
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*
 {
 body =     {
 externInfo = "<null>";
 };
 errcode = "";
 forumName = "\U300e \U6c60\U5858\U8fb9 \U300f";
 forumTopicUrl = "http://bbs.zjut.edu.cn/forum.php?mod=viewthread&tid=1628072";
 "has_next" = 0;
 head =     {
 alert = 0;
 errCode = 00000000;
 errInfo = "\U8c03\U7528\U6210\U529f,\U6ca1\U6709\U4efb\U4f55\U9519\U8bef";
 version = "2.1.0.1";
 };
 "icon_url" = "";
 "img_url" = "";
 list =     (
 {
 icon = "http://center.zjut.com/avatar.php?uid=180167&size=middle";
 "is_quote" = 0;
 level = 2;
 location = "";
 managePanel =             (
 );
 position = 2;
 "posts_date" = 1411972184000;
 "quote_content" = "";
 "quote_pid" = 0;
 "quote_user_name" = "";
 "reply_content" =             (
 {
 infor = "\U9e3d\U5b50\U559c\U6b22\U5403\U7eff\U8c46";
 type = 0;
 }
 );
 "reply_id" = 180167;
 "reply_name" = cxiaac;
 "reply_posts_id" = 14062877;
 "reply_status" = 1;
 "reply_type" = normal;
 "role_num" = 1;
 status = 1;
 title = "";
 userTitle = "\U4e2d\U7ea7\U4f1a\U5458";
 },
 {
 icon = "http://center.zjut.com/avatar.php?uid=142896&size=middle";
 "is_quote" = 0;
 level = 11;
 location = "";
 managePanel =             (
 );
 position = 3;
 "posts_date" = 1411972949000;
 "quote_content" = "";
 "quote_pid" = 0;
 "quote_user_name" = "";
 "reply_content" =             (
 {
 infor = "[mobcent_phiz=http://bbs.zjut.edu.cn/static/image/smiley/yoyocici/A61.gif]\U9b42\U4e4b\U633d\U9e3d";
 type = 0;
 }
 );
 "reply_id" = 142896;
 "reply_name" = "\U5343\U5bd2";
 "reply_posts_id" = 14062886;
 "reply_status" = 1;
 "reply_type" = normal;
 "role_num" = 1;
 status = 1;
 title = "";
 userTitle = "\U8d85\U7ea7\U7248\U4e3b";
 },
 {
 icon = "http://center.zjut.com/avatar.php?uid=156181&size=middle";
 "is_quote" = 0;
 level = 3;
 location = "";
 managePanel =             (
 );
 position = 4;
 "posts_date" = 1411982031000;
 "quote_content" = "";
 "quote_pid" = 0;
 "quote_user_name" = "";
 "reply_content" =             (
 {
 infor = "[mobcent_phiz=http://bbs.zjut.edu.cn/static/image/smiley/newface/79.gif]\U70e4\U4e73\U9e3d";
 type = 0;
 }
 );
 "reply_id" = 156181;
 "reply_name" = "\U96f6\U843d\U4e16\U4eba";
 "reply_posts_id" = 14063011;
 "reply_status" = 1;
 "reply_type" = normal;
 "role_num" = 1;
 status = 1;
 title = "";
 userTitle = "\U9ad8\U7ea7\U4f1a\U5458";
 },
 {
 icon = "http://center.zjut.com/avatar.php?uid=258344&size=middle";
 "is_quote" = 0;
 level = 1;
 location = "";
 managePanel =             (
 );
 position = 5;
 "posts_date" = 1411984384000;
 "quote_content" = "";
 "quote_pid" = 0;
 "quote_user_name" = "";
 "reply_content" =             (
 {
 infor = "\U98de\U4e0d\U4e86\U4e86\U3002\U3002\U3002";
 type = 0;
 }
 );
 "reply_id" = 258344;
 "reply_name" = "tl_sun";
 "reply_posts_id" = 14063042;
 "reply_status" = 1;
 "reply_type" = normal;
 "role_num" = 1;
 status = 1;
 title = "";
 userTitle = "\U521d\U7ea7\U4f1a\U5458";
 },
 {
 icon = "http://center.zjut.com/avatar.php?uid=192362&size=middle";
 "is_quote" = 0;
 level = 9;
 location = "";
 managePanel =             (
 );
 position = 6;
 "posts_date" = 1411998978000;
 "quote_content" = "";
 "quote_pid" = 0;
 "quote_user_name" = "";
 "reply_content" =             (
 {
 infor = "\U5929\U5929\U88ab\U653e\U9e3d\U5b50\Uff0c\U517b\U4e0d\U8fc7\U6765\U4e86";
 type = 0;
 }
 );
 "reply_id" = 192362;
 "reply_name" = "\U672a\U7adf";
 "reply_posts_id" = 14063235;
 "reply_status" = 1;
 "reply_type" = normal;
 "role_num" = 1;
 status = 1;
 title = "";
 userTitle = "\U7cbe\U5f18\U8d35\U5bbe";
 },
 {
 icon = "http://center.zjut.com/avatar.php?uid=192882&size=middle";
 "is_quote" = 0;
 level = 9;
 location = "";
 managePanel =             (
 );
 position = 7;
 "posts_date" = 1412647083000;
 "quote_content" = "";
 "quote_pid" = 0;
 "quote_user_name" = "";
 "reply_content" =             (
 {
 infor = "\U636e\U8bf4\U633a\U8865\U7684\U2026\U2026";
 type = 0;
 }
 );
 "reply_id" = 192882;
 "reply_name" = smalljonxs;
 "reply_posts_id" = 14065481;
 "reply_status" = 1;
 "reply_type" = normal;
 "role_num" = 1;
 status = 1;
 title = "";
 userTitle = "\U8bba\U575b\U8d35\U5bbe";
 },
 {
 icon = "http://center.zjut.com/avatar.php?uid=253868&size=middle";
 "is_quote" = 0;
 level = 0;
 location = "";
 managePanel =             (
 );
 position = 8;
 "posts_date" = 1412655200000;
 "quote_content" = "";
 "quote_pid" = 0;
 "quote_user_name" = "";
 "reply_content" =             (
 {
 infor = "\U4e0d\U4f1a\U517b..\U4f46\U662f\U60f3\U5e2e\U5fd9..\U697c\U4e3b\U770b\U770b\U811a\U4e0a\U6709\U6807\U8bb0\U5417\Uff1f\U517b\U597d\U4f24\U5e94\U8be5\U80fd\U653e\U98de\U56de\U53bb\U7684\U5427";
 type = 0;
 }
 );
 "reply_id" = 253868;
 "reply_name" = "Monkey.S";
 "reply_posts_id" = 14065523;
 "reply_status" = 1;
 "reply_type" = normal;
 "role_num" = 1;
 status = 1;
 title = "";
 userTitle = "\U6ce8\U518c\U4f1a\U5458";
 }
 );
 page = 1;
 rs = 1;
 topic =     {
 activityInfo = "<null>";
 content =         (
 {
 infor = " \U672c\U5e16\U6700\U540e\U7531 zjutxkf \U4e8e 2014-9-29 11:21 \U7f16\U8f91 ";
 type = 0;
 },
 {
 aid = 0;
 infor = "http://bbs.zjut.edu.cn/forum.php?mod=image&aid=1500922&size=285x400&key=5700559ba4209f29&type=fixnone";
 originalInfo = "http://bbs.zjut.edu.cn/forum.php?mod=image&aid=1500922&size=285x400&key=5700559ba4209f29&type=fixnone";
 type = 1;
 },
 {
 infor = "\U7fc5\U8180\U6709\U4e9b\U4f24\Uff0c\U98de\U4e0d\U4e86\U4e86\Uff0c\U672c\U4eba\U4e0d\U4f1a\U517b\U9e3d\U5b50\Uff0c\U671b\U7231\U5fc3\U4eba\U58eb\U6536\U517b\Uff0c\U8c22\U8c22
 \n\U6709\U610f\U8005\U8054\U7cfb15068850856 \Uff08517137\Uff09\U5f90";
 type = 0;
 }
 );
 "create_date" = 1411960788000;
 essence = 0;
 flag = 0;
 gender = 1;
 hits = 93;
 hot = 0;
 icon = "http://center.zjut.com/avatar.php?uid=266241&size=middle";
 "is_favor" = 0;
 level = 0;
 location = "";
 managePanel =         (
 );
 "poll_info" = "<null>";
 replies = 7;
 "reply_posts_id" = 0;
 "reply_status" = 1;
 sortId = 0;
 status = 1;
 title = "[\U6c42\U52a9\U54a8\U8be2]\U5c71\U91cc\U4e00\U53ea \U9e3d\U5b50  \U6c42\U5305\U517b";
 top = 0;
 "topic_id" = 1628072;
 type = "normal_complex";
 userTitle = "\U6ce8\U518c\U4f1a\U5458";
 "user_id" = 266241;
 "user_nick_name" = zjutxkf;
 vote = 0;
 };
 "total_num" = 7;
 }

 
 */

@end
