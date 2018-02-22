//
//  GameBase.m
//  Jumpjump
//
//  Created by Zhi Zhuang on 18/2/20.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import "GameBase.h"

@implementation GameBase

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSprite:frame];
    }
    return self;
}

-(void)initSprite:(CGRect) frame
{
    UIView * sprite = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    sprite.backgroundColor = [UIColor greenColor];
    [self addSubview:sprite];
}

-(void)setSurface:(int) flag
{
    
}

-(void)updatePosition:(CGPoint) point
{
    
}
@end
