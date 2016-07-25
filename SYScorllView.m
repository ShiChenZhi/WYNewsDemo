//
//  SYScorllView.m
//  WYNewsDemo
//
//  Created by qianfeng on 16/7/25.
//  Copyright © 2016年 Zhimai. All rights reserved.
//

#import "SYScorllView.h"

@interface SYScorllView ()

@end

@implementation SYScorllView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
    }
    return self;
}

@end
