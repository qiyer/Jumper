//
//  GameViewController.m
//  Jumpjump
//
//  Created by Zhi Zhuang on 18/2/19.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import "GameViewController.h"
#import "GameRoler.h"
#import "GameFoundation.h"

@implementation GameViewController{
    double           timeCount;
    GameRoler      * roler;
    NSMutableArray * foundations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initSprite];
    [self initEvents];
}

-(void)initSprite
{
    roler = [[GameRoler alloc] initWithFrame:CGRectMake(100, 400, 30, 30)];
    [self.view addSubview:roler];
    
    GameFoundation * foundation1 = [[GameFoundation alloc]initWithFrame:CGRectMake(50, 500, 60, 60) color:[UIColor redColor]];
    [self.view addSubview:foundation1];
}

-(void)initEvents
{
    UILongPressGestureRecognizer *longPressGest = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressView:)];
    //长按等待时间
    //    longPressGest.minimumPressDuration = 3;
    //长按时候,手指头可以移动的距离
    longPressGest.allowableMovement = 30;
    [self.view addGestureRecognizer:longPressGest];
    self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneClick:)];
    [self.view addGestureRecognizer:tapGest];
}

-(void)longPressView:(UILongPressGestureRecognizer *)longPressGest
{
    
    NSLog(@"%ld",longPressGest.state);
    if (longPressGest.state==UIGestureRecognizerStateBegan) {
        timeCount = [self getCurrentTime];
        NSLog(@"长按手势开启:%f",timeCount);
    } else {
        timeCount = [self getCurrentTime] - timeCount;
        NSLog(@"长按手势结束:%f",timeCount);
        double num = timeCount*10.0 + 5 ;
        [self jumpRoler:(int)num];
    }
    
}

-(void)oneClick:(UITapGestureRecognizer *)tapGest
{
    [self jumpRoler:5];
    NSLog(@"one click");
}

-(void)jumpRoler:(int) count
{
    NSLog(@"jumpRoler count:%d",count);
    [roler jump:count];
}

-(double) getCurrentTime
{
    NSDate * date = [NSDate date];
    return date.timeIntervalSince1970;
}

@end
