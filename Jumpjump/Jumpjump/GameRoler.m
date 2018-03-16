//
//  GameRoler.m
//  Jumpjump
//
//  Created by Zhi Zhuang on 18/2/20.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import "GameRoler.h"

@implementation GameRoler

-(void)jump:(int) baseCount toPoint:(CGPoint) point
{
    CGFloat height = baseCount*8;
    CGPoint gPoint = CGPointMake(height*(self.center.x - point.x )/(point.y - self.center.y)+self.center.x, self.center.y-height);
//    CGPoint dPoint = CGPointMake(flag*(baseCount*6+5)+self.center.x, self.center.y-baseCount*5);

    [UIView animateWithDuration:0.3 // 动画时长
                          delay:0.1 // 动画延迟
                        options:UIViewAnimationOptionCurveEaseOut // 动画过渡效果
                     animations:^{
                         self.center = gPoint;
                     }
                     completion:^(BOOL finished) {
                         
                         [[NSNotificationCenter defaultCenter] postNotificationName:JUMP_EVENT_ROLEJUMPED object:nil];
                         
                         // 动画完成后执行
//                         [UIView animateWithDuration:0.15 // 动画时长
//                                               delay:0.05 // 动画延迟
//                                             options:UIViewAnimationOptionCurveEaseIn // 动画过渡效果
//                                          animations:^{
//                                              self.center = dPoint;
//                                          }
//                                          completion:^(BOOL finished) {
//                                              // 动画完成后执行
//                                              // code...
//                                              [[NSNotificationCenter defaultCenter] postNotificationName:JUMP_EVENT_ROLEJUMPED object:nil];
//                                          }];
                     }];
}
@end
