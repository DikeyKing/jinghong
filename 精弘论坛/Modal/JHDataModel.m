//
//  JHDataModel.m
//  精弘论坛
//
//  Created by Dikey on 9/22/14.
//  Copyright (c) 2014 dikey. All rights reserved.
//

#import "JHDataModel.h"
#define FONT_SIZE 17.0f
#define CELL_CONTENT_MARGIN 10.0f
#define CELL_CONTENT_ORIGINHEIGHT 130.0f

@implementation JHDataModel

-(id)initWithDictionary :(NSDictionary *)jsonDic
{
    if(self = [super init]){
    [self setValuesForKeysWithDictionary:jsonDic];
    }
    
    return self;
}

-(CGFloat)calculateCellHeight:(NSString *)sizeString
{
    
    CGFloat currentDeviceWidth = [UIScreen mainScreen].bounds.size.width;
    CGSize constrain = CGSizeMake((currentDeviceWidth - 2*CELL_CONTENT_MARGIN), 9999);
    
    NSDictionary * attributes = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:FONT_SIZE] forKey:NSFontAttributeName];
    
    NSAttributedString *attributedText = [[NSAttributedString alloc]initWithString:sizeString
                                                                        attributes:attributes];
    CGRect contentRect = [attributedText boundingRectWithSize:constrain
                                                      options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                      context:nil];
    
    NSLog(@"contentSize %f %f",contentRect.size.width,contentRect.size.height);

    if ((contentRect.size.height + CELL_CONTENT_ORIGINHEIGHT)<160.0f) {
        return 160.0f;
    }else
        return contentRect.size.height + CELL_CONTENT_ORIGINHEIGHT;
}

@end
