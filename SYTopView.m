//
//  SYTopView.m
//  手工客App
//
//  Created by qianfeng on 16/6/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SYTopView.h"
#import "SYTools.h"

#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
#define kSYRed  [UIColor colorWithRed:205/255.0 green:51/255.0 blue:51.0/255 alpha:1.0]

@interface SYTopView ()

@property (nonatomic,strong) UIScrollView *titleView;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,assign) CGFloat num;

@end

@implementation SYTopView
{
    UIButton *_selectBtn;
}

-(id)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.num = (CGFloat)titleArray.count;
        
        self.titleView = [[UIScrollView alloc] initWithFrame:self.bounds];
        
        for (NSInteger index = 0; index < titleArray.count; index++) {
            UIButton *btn = [SYTools createButton:titleArray[index] withType:UIButtonTypeCustom setBackgroundColor:[UIColor brownColor] setTintColor:[UIColor blackColor] tintFont:14.0];
            
            btn.frame = CGRectMake(index * kScreenWidth / 4.0f , 2, kScreenWidth / 4.0f, frame.size.height - 4);
            
            btn.tag = 100 + index;
            
            [btn setTitleColor:kSYRed forState:UIControlStateSelected];
            
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.titleView addSubview:btn];
        }
        
        self.titleView.contentSize = CGSizeMake(kScreenWidth / 4.0f * titleArray.count, 0);
        self.titleView.bounces = NO;
        self.titleView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.titleView];
        
        self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 2, kScreenWidth / 4.0f, 2)];
        self.lineView.backgroundColor = kSYRed;
        [self.titleView addSubview:self.lineView];
        
        _selectBtn = (UIButton *)[self.titleView viewWithTag:100];
        _selectBtn.selected = YES;
    }
    return self;
}

-(void)btnClick:(UIButton *)btn
{
    if(_selectBtn == btn)
    {
        return;
    }
    
    _selectBtn.selected = NO;
    btn.selected = YES;
    _selectBtn = btn;
    
    [UIView animateWithDuration:0.15 animations:^{
        self.lineView.frame = CGRectMake((btn.tag - 100) * kScreenWidth / 4.0f, self.frame.size.height - 2, kScreenWidth / 4.0f, 2);
    }];
    
    [self.delegate topView:self buttonClickIndex:btn.tag - 100];
}

-(void)setSelectBtn:(NSInteger)index
{
    _selectBtn.selected = NO;
    
    UIButton *btn = (UIButton *)[self.titleView viewWithTag:index + 100];
    btn.selected = YES;
    
    _selectBtn = btn;
}

-(void)moveLineOffset:(CGFloat)Offsetx
{
    self.lineView.frame = CGRectMake(Offsetx / 4.0f, self.frame.size.height - 2, kScreenWidth / 4.0f, 2);
    
    if (Offsetx / kScreenWidth>=4 && Offsetx/kScreenWidth <= self.num - 4) {
        self.titleView.contentOffset = CGPointMake(kScreenWidth / 4.0f * Offsetx / kScreenWidth , 0);
    }
    
    if (Offsetx / kScreenWidth <= 3) {
        self.titleView.contentOffset = CGPointMake(0 , 0);
    }
}

@end
