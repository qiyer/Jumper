//
//  GameViewController.m
//  Jumpjump
//
//  Created by Zhi Zhuang on 18/2/19.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import "GameViewController.h"
#import "GameFoundation.h"
#import "GameRoler.h"
#import "ActionController.h"

@implementation GameViewController{
    double             timeCount;
    GameRoler        * roler;
    CADisplayLink    * displayLink;
    UILabel          * scoreLab;
    ActionController * actionCtrl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSprite];
    [self initContrl];
    [self initEvents];
}

-(void)initSprite
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor whiteColor].CGColor,
                       (id)[UIColor colorWithRed:255/255.0 green:192/255.0 blue:203/255.0 alpha:1.0].CGColor,
                       (id)[UIColor colorWithRed:255/255.0 green:182/255.0 blue:193/255.0 alpha:1.0].CGColor,
                        nil];
    [self.view.layer addSublayer:gradient];
    
    scoreLab = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, 200, 60)];
    scoreLab.text = @"888";
    scoreLab.font = [UIFont systemFontOfSize:40 weight:3];
    scoreLab.textColor = [UIColor darkGrayColor];
    [self.view addSubview:scoreLab];
    
    roler = [[GameRoler alloc] initWithSite:CGPointMake(60, 300) image:@"role"];
    [self.view addSubview:roler];
}

-(void)initEvents
{
    UILongPressGestureRecognizer *longPressGest = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressView:)];
    //长按时候,手指头可以移动的距离
    longPressGest.allowableMovement = 30;
    [self.view addGestureRecognizer:longPressGest];
    self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneClick:)];
    [self.view addGestureRecognizer:tapGest];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationJumped) name:JUMP_EVENT_ROLEJUMPED object:nil];
}

-(void)initContrl
{
    if (!actionCtrl) {
        actionCtrl = [[ActionController alloc]init];
        __weak typeof(self)  weakSelf = self;
        [actionCtrl initFoundations:weakSelf];
    }
}

- (void)startDisplayLink{
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)handleDisplayLink:(CADisplayLink *)displayLink{
    //do something
    NSLog(@"handleDisplayLink");
}

- (void)stopDisplayLink{
    [displayLink invalidate];
    displayLink = nil;
}

-(void)notificationJumped
{
    [actionCtrl caculateNext];
    [actionCtrl createNext];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self resetScreen];
    });
}

-(void)resetScreen
{
    CGPoint point = actionCtrl.resetPoint;
    [roler updatePosition:point];
    for (GameBase * gameBase in actionCtrl.foundations) {
        [gameBase updatePosition:point];
    }
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
