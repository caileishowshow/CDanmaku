//
//  CDanmakuText.h
//  CDanmaku
//  弹幕文字类
//  Created by cailei on 15/7/15.
//  Copyright (c) 2015年 cailei. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

//一个枚举，用来定义弹幕的位置，现在分为三种，一般的，在顶上的，在底部的
typedef enum : NSUInteger {
    CDanmakuNomal,
    CDanmakuTop,
    CDanmakuButtom,
} CDanmakuTextPosition;



@interface CDanmakuText : CATextLayer


@property(nonatomic,strong)NSString *textString;//弹幕显示文字
@property(nonatomic,strong)UIColor *textColor;//弹幕颜色
@property(nonatomic,assign)CDanmakuTextPosition cdanmuPostion;//弹幕位置

//新的初始化方法
-(instancetype)initWithString:(NSString *)text withColor:(UIColor *)color;

@end
