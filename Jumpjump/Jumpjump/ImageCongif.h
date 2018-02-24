//
//  ImageCongif.h
//  Jumpjump
//
//  Created by Zhi Zhuang on 2018/2/24.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCongif : NSObject

+(instancetype)shareInstance;

-(void)loadImgData;
-(CGPoint) getAnchorPointByName:(NSString*)image;
@end
