//
//  JHUser.m
//  精弘论坛
//
//  Created by Dikey on 9/17/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHUser.h"
#import "JHUserDefaults.h"

@implementation JHUser
+(instancetype)sharedInstance
{
    static JHUser *sharedJHUser =nil;
    static dispatch_once_t oneceToken;
    dispatch_once(&oneceToken,^{
        sharedJHUser = [[JHUser alloc]init];
        sharedJHUser.secretToken = @"";
        sharedJHUser.token = @"";
    });
    return sharedJHUser;
}

@end
