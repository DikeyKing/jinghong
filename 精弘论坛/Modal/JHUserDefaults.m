//
//  JHUserDefaults.m
//  精弘论坛
//
//  Created by Dikey on 9/17/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHUserDefaults.h"

@implementation JHUserDefaults

+ (void)saveUserName:(NSString *)userName
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userName forKey:@"userName"];
}

+ (void)savePassword:(NSString *)password
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:password forKey:@"password"];
}

+ (void)saveToken:(NSString *)token
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:token forKey:@"token"];
}

+ (void)saveSecretToken:(NSString *)secretToken
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:secretToken forKey:@"secretToken"];
}

+ (void)saveLoginState:(NSString *)loginState
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:loginState forKey:@"loginState"];
    
}

+ (NSString *)getUserName
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (NSString *)[defaults objectForKey:@"userName"];
}

+ (NSString *)getPassword
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (NSString *)[defaults objectForKey:@"password"];
}

+ (NSString *)getToken
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (NSString *)[defaults objectForKey:@"token"];
}

+ (NSString *)getSecretToken
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (NSString *)[defaults objectForKey:@"secretToken"];
}

+ (NSString *)getLoginState
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (NSString *)[defaults objectForKey:@"loginState"];
}



+ (void)saveUid:(NSString *)uid
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:uid forKey:@"uid"];
}

+ (NSString *)getUid
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (NSString * )[defaults objectForKey:@"uid"];
}


+ (void)saveBoardID:(NSString*)boardID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:(id)boardID forKey:@"boardID"];
    
}
+ (NSString * )getBoardID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (NSString * )[defaults objectForKey:@"boardID"];
}

+ (void)saveTopicID:(NSString *)TopicID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:TopicID forKey:@"TopicID"];
    
}
+ (NSString * )getTopicID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (NSString * )[defaults objectForKey:@"TopicID"];
}


+ (void)savePage:(NSString *)page
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    [defaults setObject:page forKey:@"page"];
}
+ (NSString * )getPage
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"page"]==nil) {
        return @"1";
    }else
        return (NSString *)[defaults objectForKey:@"page"];
}



@end
