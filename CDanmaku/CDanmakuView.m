//
//  CDanmakuView.m
//  CDanmaku
//
//  Created by cailei on 15/7/15.
//  Copyright (c) 2015年 cailei. All rights reserved.
//

#import "CDanmakuView.h"
#import "CDanmakuText.h"
@implementation CDanmakuView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self start];
}


//-(instancetype)initWithFrame:(CGRect)frame{
//    if (self= [super initWithFrame:frame]) {
//        [self start];
//    }
//    return self;
//}
//
//
//-(instancetype)init{
//    if ([super init]) {
//        [self start];
//    }
//    return self;
//计算frame
//}

-(void)start{//开始弹幕
    
    //初始化弹幕类
    CDanmakuText *cDanmakuText = [[CDanmakuText alloc] initWithString:@"aaaaa" withColor:[UIColor redColor]];
    cDanmakuText.frame = CGRectMake(-self.bounds.size.width, 0, 50, 30);

    [self.layer addSublayer:cDanmakuText];
    
    
    //动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.repeatCount = 0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = 3;
    animation.removedOnCompletion = NO;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width, 0)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(-cDanmakuText.frame.size.width, 0)];
    [cDanmakuText addAnimation:animation forKey:@"Comment"];

}

@end
