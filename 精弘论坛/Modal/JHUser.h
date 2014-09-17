//
//  JHUser.h
//  精弘论坛
//
//  Created by Dikey on 9/17/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHUser : NSObject
@property(nonatomic, copy)NSString *jH_email; //也就是ID
@property(nonatomic, strong)NSString * name;
@property(nonatomic, strong)NSString * token;

@property(nonatomic, strong)NSURL * avatar;
@property(nonatomic, strong)NSDate * lastlogin;
@property(nonatomic, strong)NSString * level;
@property(nonatomic, assign)int posts;
@property(nonatomic, assign)int perform;
@property(nonatomic, assign)int experience;
@property(nonatomic, assign)int medals;
@property(nonatomic, assign)int logins;
@property(nonatomic, assign)int life;
@property(nonatomic, strong)NSString * gender;
@property(nonatomic, strong)NSString * astro;
@property(nonatomic, strong)NSString * mode;

@end
