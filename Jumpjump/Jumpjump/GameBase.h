//
//  GameBase.h
//  Jumpjump
//
//  Created by Zhi Zhuang on 18/2/20.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameBase : UIView

@property(nonatomic,assign) CGPoint anchorPoint;

- (instancetype)initWithFrame:(CGRect) frame image:(NSString*) url;
- (instancetype)initWithSite :(CGPoint)point image:(NSString*) url;

-(void)setSurface     :(int)     flag;
-(void)updatePosition :(CGPoint) point;
-(void)dropAction     :(CGPoint) point;

@end
