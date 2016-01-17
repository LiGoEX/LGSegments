//
//  ViewController.m
//  LGSegment
//
//  Created by LiGo on 12/19/15.
//  Copyright © 2015 LiGo. All rights reserved.
//

#import "ViewController.h"
#import "LGSegment.h"

#define LG_ScreenW [UIScreen mainScreen].bounds.size.width
#define LG_ScreenH [UIScreen mainScreen].bounds.size.height
//ScrollView高度
#define LG_scrollViewH 220
//Segment高度
#define LG_segmentH 40


@interface ViewController ()<UIScrollViewDelegate,SegmentDelegate>
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property(nonatomic,strong)NSMutableArray *buttonList;
@property (nonatomic, weak) LGSegment *segment;
@property(nonatomic,weak)CALayer *LGLayer;
@end

@implementation ViewController

- (NSMutableArray *)buttonList
{
    if (!_buttonList)
    {
        _buttonList = [NSMutableArray array];
    }
    return _buttonList;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //加载Segment
    [self setSegment];
    //加载ViewController
    [self addChildViewController];
    //加载ScrollView
    [self setContentScrollView];
    
}

-(void)setSegment {
    
    [self buttonList];
    //初始化
    LGSegment *segment = [[LGSegment alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - LG_scrollViewH - 50, self.view.frame.size.width, LG_segmentH)];
    segment.delegate = self;
    self.segment = segment;
    [self.view addSubview:segment];
    [self.buttonList addObject:segment.buttonList];
    self.LGLayer = segment.LGLayer;
    
}
//加载ScrollView
-(void)setContentScrollView {
    
    UIScrollView *sv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - LG_scrollViewH, self.view.frame.size.width, LG_scrollViewH)];
    [self.view addSubview:sv];
    sv.bounces = NO;
    sv.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    sv.contentOffset = CGPointMake(0, 0);
    sv.pagingEnabled = YES;
    sv.showsHorizontalScrollIndicator = NO;
    sv.scrollEnabled = YES;
    sv.userInteractionEnabled = YES;
    sv.delegate = self;
    
    for (int i=0; i<self.childViewControllers.count; i++) {
        UIViewController * vc = self.childViewControllers[i];
        vc.view.frame = CGRectMake(i * LG_ScreenW, 0, LG_ScreenW, 300);
        [sv addSubview:vc.view];
        
    }
    
    sv.contentSize = CGSizeMake(3 * LG_ScreenW, 0);
    self.contentScrollView = sv;
}
//加载3个ViewController
-(void)addChildViewController{
    
    UIViewController * vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor= [UIColor colorWithRed:80.0/255 green:227.0/255 blue:194.0/255 alpha:100];
    [self addChildViewController:vc1];
    UIViewController * vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor= [UIColor colorWithRed:0.0/255 green:167.0/255 blue:210.0/255 alpha:100];
    [self addChildViewController:vc2];
    UIViewController * vc3 = [[UIViewController alloc]init];
    vc3.view.backgroundColor= [UIColor colorWithRed:249.0/255 green:123.0/255 blue:134.0/255 alpha:100];
    [self addChildViewController:vc3];
}

#pragma mark - UIScrollViewDelegate
//实现LGSegment代理方法
-(void)scrollToPage:(int)Page {
    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = self.view.frame.size.width * Page;
    [UIView animateWithDuration:0.3 animations:^{
        self.contentScrollView.contentOffset = offset;
    }];
}
// 只要滚动UIScrollView就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    [self.segment moveToOffsetX:offsetX];
    
}

@end
