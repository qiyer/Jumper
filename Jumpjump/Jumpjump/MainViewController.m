//
//  MainViewController.m
//  Jumpjump
//
//  Created by Zhi Zhuang on 18/2/19.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import "MainViewController.h"
#import "GameViewController.h"
#import "ImageCongif.h"


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 60, 40)];
    [btn setTitle:@"Play" forState:UIControlStateNormal];
    btn.center = CGPointMake(kWidth/2.0, kHeight/2.0);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(gotoGameVC) forControlEvents:UIControlEventTouchUpInside];
    
    [[ImageCongif shareInstance] loadImgData];
}

-(void)gotoGameVC
{
    GameViewController*  gameVC = [[GameViewController alloc] init];
    [self presentViewController:gameVC animated:NO completion:nil];
    NSLog(@"11111");
}

@end
