//
//  CDanmakuView.m
//  CDanmaku
//
//  Created by cailei on 15/7/15.
//  Copyright (c) 2015年 cailei. All rights reserved.
//

#import "CDanmakuView.h"
#import "CDanmakuText.h"

@interface CDanmakuView(){
    NSTimer *_commentTimer;//计时器
    
    CGFloat height;//高度设置
    
    NSMutableArray *aliveArray;//存活的弹幕队列
//    CGFloat nowTime;//计时器
}

@end


@implementation CDanmakuView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    aliveArray = [NSMutableArray new];
    [self start];
    
}


-(void)start{//开始弹幕
    _commentTimer = [NSTimer timerWithTimeInterval:0.5f
                                            target:self selector:@selector(_commentTimerFired)
                                          userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_commentTimer forMode:NSRunLoopCommonModes];
    
    CDanmakuText *cDanmakuText = [[CDanmakuText alloc] initWithString:@"aaaaa" withColor:[UIColor redColor]];
    [cDanmakuText setPosition:CGPointMake(400, height)];
    cDanmakuText.startTime = [NSDate timeIntervalSinceReferenceDate];
//    [aliveArray addObject:cDanmakuText];
//    [aliveArray insertObject:cDanmakuText atIndex:2];
    [self.layer addSublayer:cDanmakuText];
    
    
    [cDanmakuText move];

}

-(void)_commentTimerFired{
//    CDanmakuText *cDanmakuText = [[CDanmakuText alloc] initWithString:@"aaaaa" withColor:[UIColor redColor]];
//    [cDanmakuText setPosition:CGPointMake(400, height)];
//    
//    [self.layer addSublayer:cDanmakuText];
//    
//    
//    [cDanmakuText move];
//    height+=20;
//    nowTime += 0.5;
    CDanmakuText *text = aliveArray[0];
//    NSLog(@"%f",[text getXPoistion:[NSDate timeIntervalSinceReferenceDate]]);

}
//找到最高点

//-(Float32)_findTheYPostion{
//    Float32 yPosition;
//    for (CDanmakuText *text in aliveArray) {
//        
//    }
//    
//    
//}




@end
