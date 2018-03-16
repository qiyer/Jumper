//
//  ActionController.h
//  Jumpjump
//
//  Created by Zhi Zhuang on 2018/2/22.
//  Copyright © 2018年 Zhi Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionController : NSObject

-(void)initFoundations:(UIViewController*) vc;
-(NSMutableArray* )foundations;
    
-(CGPoint )resetPoint;
-(CGPoint )toPoint;

-(void)caculateNext;
-(void)createNext;
@end
