//
//  JHCommonConfigs.m
//  精弘论坛
//
//  Created by Dikey on 9/21/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHCommonConfigs.h"

@implementation JHCommonConfigs
+(instancetype)sharedConfig
{
    static JHCommonConfigs *sharedJHConfigs= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedJHConfigs = [JHCommonConfigs new];
        sharedJHConfigs.secretToken = @"";
        sharedJHConfigs.token = @"";
        sharedJHConfigs.boardID = 0;
    });
    return sharedJHConfigs;
}
@end
