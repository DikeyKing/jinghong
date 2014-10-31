//
//  JHUserDefaults.h
//  精弘论坛
//
//  Created by Dikey on 9/17/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHUserDefaults : NSObject

+ (void)saveUserName:(NSString *)userName;
+ (void)savePassword:(NSString *)password;
+ (void)saveToken:(NSString *)token;
+ (void)saveSecretToken:(NSString *)token;
+ (void)saveLoginState:(NSString *)loginState;

+ (NSString *)getUserName;
+ (NSString *)getPassword;
+ (NSString *)getToken;
+ (NSString *)getSecretToken;
+ (NSString *)getLoginState;


+ (void)saveUid:(NSString *)uid;
+ (NSString * )getUid;

+ (void)saveBoardID:(NSString * )boardID;
+ (NSString * )getBoardID;

+ (void)saveTopicID:(NSString * )TopicID;
+ (NSString * )getTopicID;

+ (void)savePage:(NSString *)page; //当前帖子列表Page
+ (NSString * )getPage;

+ (void)saveRecentTopicPage:(NSString *)page; //最近帖子page
+ (NSString * )getRecentTopicPage;

+ (void)saveTopicDetailPage:(NSString *)page; //帖子详情page
+ (NSString * )getTopicDetailPage;

@end
