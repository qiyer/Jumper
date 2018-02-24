//
//  ActionController.m
//  Jumpjump
//
//  Created by Zhi Zhuang on 2018/2/22.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import "ActionController.h"
#import "GameFoundation.h"

@implementation ActionController{
    NSMutableArray   * _foundations;
    UIViewController * viewVC;
    CGPoint            curPoint;
    float              curWidth;
    CGPoint            _resetPoint;
}

-(void) initFoundations:(UIViewController*) vc
{
    viewVC       = vc;
    curPoint     = kDefaltPoint;
    _foundations = [NSMutableArray array];
    
    GameFoundation * f1 = [[GameFoundation alloc] initWithSite:curPoint image:@"foundation_1"];
    curPoint = CGPointMake(curPoint.x + kWidth*0.4, curPoint.y-kWidth*0.4*tan(M_PI/6.0));
    GameFoundation * f2 = [[GameFoundation alloc] initWithSite:curPoint image:@"foundation_1"];
    curWidth = f2.frame.size.width;
    
    [viewVC.view addSubview:f1];
    [viewVC.view insertSubview:f2 belowSubview:f1];
    
    [_foundations addObject:f1];
    [_foundations addObject:f2];
}

-(void)caculateNext
{
    int count = arc4random() % 200 -100;
    float width = (kWidth - curWidth*2)*count/100;
    width = (count>=0) ? width + curWidth*0.5 : width-curWidth*0.5;
    curPoint = CGPointMake(curPoint.x + width*cos(M_PI/6.0), curPoint.y-fabs(width)*0.5);
    _resetPoint = CGPointMake(-width*cos(M_PI/6.0), fabs(width)*0.5);
}

-(void)createNext
{
    int flag = 1+arc4random() % 3;
    NSString * imageName = [NSString stringWithFormat:@"foundation_%d",flag];
    NSLog(@"%@", imageName);
    float dropHeight = 80.0f;
    GameFoundation * f = [[GameFoundation alloc] initWithSite:CGPointMake(curPoint.x, curPoint.y - dropHeight) image:imageName];
    curWidth = f.frame.size.width;
    [viewVC.view addSubview:f];
    [f dropAction:curPoint];
    
    GameFoundation * pre = _foundations[_foundations.count-1];
    [viewVC.view insertSubview:f belowSubview:pre];
    [_foundations addObject:f];
    //滚动 提前预设坐标
    curPoint = CGPointMake(curPoint.x + _resetPoint.x, curPoint.y + _resetPoint.y);
    
    if(_foundations.count >= 6){
        GameFoundation * old = _foundations[0];
        [old removeFromSuperview];
        [_foundations removeObjectAtIndex:0];
        old = nil;
    }
}

-(NSMutableArray* )foundations
{
    return _foundations;
}

-(CGPoint )resetPoint
{
    return _resetPoint;
}

@end
