//
//  JHDataModel.m
//  精弘论坛
//
//  Created by Dikey on 9/22/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHDataModel.h"

@implementation JHDataModel

-(id)initWithDictionary :(NSDictionary *)jsonDic
{
    if(self = [super init]){
    [self setValuesForKeysWithDictionary:jsonDic];
    }
    
    
    return self;
}

@end
