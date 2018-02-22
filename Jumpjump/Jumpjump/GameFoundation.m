//
//  GameFoundation.m
//  Jumpjump
//
//  Created by Zhi Zhuang on 18/2/20.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import "GameFoundation.h"

@implementation GameFoundation

-(instancetype)initWithFrame:(CGRect) frame color:(UIColor*) color{
    self = [super initWithFrame:frame];
    self.backgroundColor = color;
    return self;
}

@end
