//
//  GameBase.h
//  Jumpjump
//
//  Created by Zhi Zhuang on 18/2/20.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameBase : UIView

-(void)setSurface:(int) flag;

-(void)updatePosition:(CGPoint) point;

@end
