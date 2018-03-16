//
//  GameBase.m
//  Jumpjump
//
//  Created by Zhi Zhuang on 18/2/20.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import "GameBase.h"
#import "ImageCongif.h"

@implementation GameBase{
    NSString * imageName;
}

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

- (instancetype)initWithFrame:(CGRect) frame image:(NSString*) url
{
    imageName = url;
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:url]];
        [self addSubview:image];
    }
    return self;
}

- (instancetype)initWithSite:(CGPoint)point image:(NSString*) url
{
    imageName = url;
    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:url]];
    self.anchorPoint = [[ImageCongif shareInstance] getAnchorPointByName:url];
    NSLog(@"anchorPoint: %f   %f", self.anchorPoint.x, self.anchorPoint.y);
    self = [super initWithFrame:CGRectMake(0, 0, image.frame.size.width, image.frame.size.height)];
    self.layer.anchorPoint = CGPointMake(self.anchorPoint.x/image.frame.size.width, self.anchorPoint.y/image.frame.size.height);
    if (self) {
        self.center = CGPointMake(point.x ,point.y );
        image.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
        image.layer.shadowOffset = CGSizeMake(-7,6);//shadowOffset阴影偏移
        image.layer.shadowOpacity = 0.8;//阴影透明度
        image.layer.shadowRadius = 5;//阴影半径
        [self addSubview:image];
    }
    UIView * redV = [[UIView alloc] initWithFrame:CGRectMake(self.anchorPoint.x, self.anchorPoint.y, 5, 5)];
    [self addSubview:redV];
    redV.backgroundColor = [UIColor redColor];
    return self;
}

-(void)setSurface:(int) flag
{
    
}

-(void)updatePosition:(CGPoint) point
{
    CGPoint newPoint = CGPointMake(self.center.x + point.x, self.center.y + point.y);
    NSLog(@"%@ updatePosition:%f   %f",imageName,newPoint.x , newPoint.y);
    [UIView animateWithDuration:0.4f // 动画时长
                          delay:0.0f // 动画延迟
                        options:UIViewAnimationOptionCurveEaseOut // 动画过渡效果
                     animations:^{
                         self.center = newPoint;
                     }
                     completion:^(BOOL finished) {
                         // 动画完成后执行
//                         [[NSNotificationCenter defaultCenter] postNotificationName:JUMP_EVENT_ROLEJUMPED object:nil];
                     }];
}

-(void)dropAction:(CGPoint) point
{
    NSLog(@"dropAction:%f   %f",self.center.y , point.y);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.2f // 动画时长
                              delay:0.0f // 动画延迟
                            options:UIViewAnimationOptionCurveEaseIn // 动画过渡效果
                         animations:^{
                             self.center = point;
                         }
                         completion:^(BOOL finished) {
                             NSLog(@"dropAction111");
                             // 动画完成后执行
                             //                         [[NSNotificationCenter defaultCenter] postNotificationName:JUMP_EVENT_ROLEJUMPED object:nil];
                         }];
    });

}
@end
