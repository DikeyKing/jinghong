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
+ (void)saveUid:(NSString *)uid;

+ (NSString *)getUserName;
+ (NSString *)getPassword;
+ (NSString *)getToken;
+ (NSString *)getSecretToken;
+ (NSString *)getLoginState;
+ (NSString *)getUid;

@end
