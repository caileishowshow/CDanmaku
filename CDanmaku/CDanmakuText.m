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
        self.textString = text;
        self.textColor = color;
        
        
        //设置CATextLayer的默认属性
        self.string = _textString;
        self.fontSize = 8;//字体大小
        self.foregroundColor = [_textColor CGColor];
        
    }
    return self;
}

@end
