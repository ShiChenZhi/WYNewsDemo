//
//  SYViewController.m
//  WYNewsDemo
//
//  Created by qianfeng on 16/7/25.
//  Copyright © 2016年 Zhimai. All rights reserved.
//

#import "SYViewController.h"
#import "SYTopView.h"
#import "SYScorllView.h"
#import "SYTableViewController.h"

@interface SYViewController () <SYTopViewDelegate>
{
    NSArray *_array;
    SYTopView *_topView;
    SYScorllView *_scrollView;
}

@end

@implementation SYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self createTopView];
    
    [self createScrollView];
}

-(void)createTopView
{
    _array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20"];
    _topView = [[SYTopView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 40) titleArray:_array];
    [self.view addSubview:_topView];
}

-(void)createScrollView
{
    _scrollView = [[SYScorllView alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 60)];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < _array.count; i++) {
        __block BOOL isContained = NO;
        [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            SYTableViewController *tableVC = obj;
            
            //_array[i] 本为URL，在这弄一些假数据替代
            if ([tableVC.urlString isEqualToString:_array[i]]) {
                [arrayM addObject:tableVC];
                isContained = YES;
                *stop = YES;
            }
        }];
        if (!isContained) {
            SYTableViewController *tableVC = [[SYTableViewController alloc] initWithStyle:UITableViewStylePlain];
            tableVC.urlString = _array[i];
            [arrayM addObject:tableVC];
        }
    }
    
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    for (UITableViewController *tableVC in arrayM) {
        [self addChildViewController:tableVC];
    }
    
    _scrollView.contentSize = CGSizeMake(self.childViewControllers.count * [UIScreen mainScreen].bounds.size.width, 0);
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        UITableViewController *tableVC = self.childViewControllers[i];
        tableVC.tableView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * i, 0, [UIScreen mainScreen].bounds.size.width, _scrollView.frame.size.height);
        [_scrollView addSubview:tableVC.tableView];
    }
    [self.view addSubview:_scrollView];
}

-(void)topView:(SYTopView *)topView buttonClickIndex:(NSInteger)index
{
    [_scrollView setContentOffset:CGPointMake(index * [UIScreen mainScreen].bounds.size.width, 0) animated:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [_topView setSelectBtn:scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_topView moveLineOffset:scrollView.contentOffset.x];
}

@end
