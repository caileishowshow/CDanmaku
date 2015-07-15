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
//-(void)setYPosition:(CGFloat)yPosition{
//    self.frame = CGRectMake(positionSize.x, positionSize.y, self.frame.size.width, self.frame.size.height);    
//}

//动起来的动画
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

-(Float32)getXPoistion:(NSTimeInterval)nowTime{
    return (375-(-self.frame.size.width))/5*(nowTime-_startTime);
}


//动画代理
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    CALayer *layer = [anim valueForKey:@"animationLayer"];
    NSLog(@"%f",layer.contentsCenter.origin.x);
    [layer removeFromSuperlayer];

}

@end
