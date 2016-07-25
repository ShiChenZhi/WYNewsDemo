//
//  SYTopView.h
//  手工客App
//
//  Created by qianfeng on 16/6/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SYTopView;

@protocol SYTopViewDelegate <NSObject>

-(void)topView:(SYTopView *)topView buttonClickIndex:(NSInteger)index;

@end

@interface SYTopView : UIView

@property (nonatomic,weak) id <SYTopViewDelegate> delegate;

-(id)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;

-(void)setSelectBtn:(NSInteger)index;

-(void)moveLineOffset:(CGFloat)Offsetx;


@end
