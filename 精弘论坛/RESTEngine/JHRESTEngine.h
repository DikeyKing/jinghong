//
//  JHRESTEngine.h
//  精弘论坛
//
//  Created by Dikey on 9/22/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^VoidBlock)(void);
typedef void (^ErrorBlock)(NSError* engineError);
typedef void (^ArrayBlock)(NSArray *modelObjects);

@interface JHRESTEngine : AFHTTPRequestOperationManager

+(instancetype)sharedJHRESTManager;

-(instancetype)loginWithCompletion:(void(^)(NSError *err))block;

-(instancetype)getBoardListOnSucceeded:(ArrayBlock)succeededBlock
                     onError:(ErrorBlock)errorBlock;

-(instancetype)getTopicsListOnSucceeded:(ArrayBlock)succeededBlock
                                onError:(ErrorBlock)errorBlock;

-(instancetype)getRecentTopicsOnSucceeded:(ArrayBlock)succeededBlock
                                onError:(ErrorBlock)errorBlock;

-(instancetype)getTopicDetailsOnSucceeded:(ArrayBlock)succeededBlock
                                  onError:(ErrorBlock)errorBlock;

-(instancetype)postNewTopicOnSucceeded:(ArrayBlock)succdedBlock
                               onerror:(ErrorBlock)errorBlock;


//typedef void (^VoidBlock)(void);
//typedef void (^ModelBlock)(JSONModel* aModelBaseObject);
//typedef void (^ArrayBlock)(NSMutableArray* listOfModelBaseObjects);
//typedef void (^ErrorBlock)(NSError* engineError);
//                                
//OnSucceeded:(ArrayBlock) succeededBlock
//onError:(ErrorBlock) errorBlock;


@end
