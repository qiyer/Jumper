//
//  ImageCongif.m
//  Jumpjump
//
//  Created by Zhi Zhuang on 2018/2/24.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import "ImageCongif.h"

@implementation ImageCongif{
    NSMutableDictionary *imgDic;
}

+(instancetype)shareInstance
{
    static ImageCongif * config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!config) {
            config = [[ImageCongif alloc] init];
        }
    });
    return config;
}

-(void)loadImgData
{
    NSBundle * bundle = [NSBundle mainBundle];
    NSString * path =[bundle pathForResource:@"config" ofType:@"plist"];
    imgDic = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@",imgDic);
}

-(CGPoint) getAnchorPointByName:(NSString*)image
{
    if (imgDic && [imgDic objectForKey:image]) {
        NSString * value = imgDic[image];
        NSArray * arr = [value componentsSeparatedByString:@","];
        return CGPointMake([arr[0] floatValue], [arr[1] floatValue]);
    }
    return CGPointMake(0, 0);
}

-(CGFloat) getWidthByName:(NSString*)image
{
    if (imgDic && [imgDic objectForKey:image]) {
        NSString * value = imgDic[image];
        NSArray * arr = [value componentsSeparatedByString:@","];
        return [arr[2] floatValue];
    }
    return 0;
}
@end
