//
//  SYTools.m
//  爱限免App
//
//  Created by qianfeng on 16/6/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SYTools.h"


@implementation SYTools

+(UIButton *)createButton:(NSString *)title withType:(UIButtonType)type setBackgroundColor:(UIColor *)backColor setTintColor:(UIColor *)tintColor tintFont:(CGFloat)font
{
    UIButton *btn = [UIButton buttonWithType:type];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.backgroundColor = backColor;
    [btn setTitleColor:tintColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    
    return btn;
}

+(UILabel *)createLabel:(NSString *)title withTextAlignment:(NSTextAlignment)textAlignment setTextColor:(UIColor *)textColor tintFont:(CGFloat)font
{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textAlignment = textAlignment;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:font];
    
    return label;
}

+(UIImage *)createImage:(NSString *)imageStr
{
    return [UIImage imageNamed:imageStr];
}

@end
