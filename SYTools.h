//
//  SYTools.h
//  爱限免App
//
//  Created by qianfeng on 16/6/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SYTools : NSObject

+(UIButton *)createButton:(NSString *)title withType:(UIButtonType)type setBackgroundColor:(UIColor *)backColor setTintColor:(UIColor *)tintColor tintFont:(CGFloat)font;

+(UILabel *)createLabel:(NSString *)title withTextAlignment:(NSTextAlignment)textAlignment setTextColor:(UIColor *)textColor tintFont:(CGFloat)font;

+(UIImage *)createImage:(NSString *)imageStr;

@end
