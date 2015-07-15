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
}

@end


@implementation CDanmakuView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self start];
}


-(void)start{//开始弹幕
    _commentTimer = [NSTimer timerWithTimeInterval:0.5f
                                            target:self selector:@selector(_commentTimerFired)
                                          userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_commentTimer forMode:NSRunLoopCommonModes];
    
    

}

-(void)_commentTimerFired{
    for (int i=0; i<10; i++) {
        //初始化弹幕类
        CDanmakuText *cDanmakuText = [[CDanmakuText alloc] initWithString:@"aaaaa" withColor:[UIColor redColor]];
        [cDanmakuText setPosition:CGPointMake(self.bounds.size.width, i*20)];
        
        [self.layer addSublayer:cDanmakuText];
        
        
        [cDanmakuText move];
    }
}




@end
