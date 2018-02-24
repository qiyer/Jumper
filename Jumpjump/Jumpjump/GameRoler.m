//
//  GameRoler.m
//  Jumpjump
//
//  Created by Zhi Zhuang on 18/2/20.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import "GameRoler.h"

@implementation GameRoler

-(void)jump:(int) baseCount
{
    CGPoint gPoint = CGPointMake(baseCount*5+5+self.center.x, self.center.y-baseCount*7);
    CGPoint dPoint = CGPointMake(baseCount*6+5+self.center.x, self.center.y-baseCount*5);

    [UIView animateWithDuration:0.3 // 动画时长
                          delay:0.1 // 动画延迟
                        options:UIViewAnimationOptionCurveEaseOut // 动画过渡效果
                     animations:^{
                         self.center = gPoint;
                     }
                     completion:^(BOOL finished) {
                         // 动画完成后执行
                         [UIView animateWithDuration:0.15 // 动画时长
                                               delay:0.05 // 动画延迟
                                             options:UIViewAnimationOptionCurveEaseIn // 动画过渡效果
                                          animations:^{
                                              self.center = dPoint;
                                          }
                                          completion:^(BOOL finished) {
                                              // 动画完成后执行
                                              // code...
                                              [[NSNotificationCenter defaultCenter] postNotificationName:JUMP_EVENT_ROLEJUMPED object:nil];
                                          }];
                     }];
}
@end
