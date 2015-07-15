//
//  CDanmakuText.m
//  CDanmaku
//  弹幕文字类
//  Created by cailei on 15/7/15.
//  Copyright (c) 2015年 cailei. All rights reserved.
//

#import "CDanmakuText.h"

@implementation CDanmakuText
//初始化，设置弹幕
-(instancetype)initWithString:(NSString *)text withColor:(UIColor *)color{
    if (self = [super init]) {
        
        fontSize = 15;
        
        
        self.textString = text;
        self.textColor = color;
        
        
        //设置CATextLayer的默认属性
        self.string = _textString;
        self.fontSize = fontSize;//字体大小
        self.foregroundColor = [_textColor CGColor];
        self.frame = [self _createTheFrame];
        
    }
    return self;
}
//计算出整个TextLayer的宽高
-(CGRect )_createTheFrame{
    CGSize textSize = [_textString boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:fontSize] } context:nil].size;
    CGRect frame = CGRectMake(0, 0, textSize.width, textSize.height);
    return frame;
}

//设置弹幕高度
-(void)setYPosition:(CGPoint)positionSize{
    self.frame = CGRectMake(positionSize.x, positionSize.y, self.frame.size.width, self.frame.size.height);
}



-(void)move{
    //动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.repeatCount = 0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = 3;
//    animation.removedOnCompletion = NO;
    [animation setValue:self forKey:@"animationLayer"];
    animation.delegate = self;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(375, self.frame.origin.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(-self.frame.size.width, self.frame.origin.y)];
    [self addAnimation:animation forKey:@"Comment"];
}
//动画代理
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    CDanmakuText *layer = [anim valueForKey:@"animationLayer"];
    [layer removeFromSuperlayer];
}
- (void)dealloc{
    NSLog(@"aaa");
}
@end
