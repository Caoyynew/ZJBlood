//
//  ZJBMyRecordViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/17.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBMyRecordViewController.h"
#import "ZJBReviewTableViewController.h"
#import "ZJBAlreadyTableViewController.h"
#import "ZJBWholeTableViewController.h"
@interface ZJBMyRecordViewController ()<UIScrollViewDelegate>
{
    UIScrollView * headScroll;
    UIScrollView * contentScroll;
    UILabel * line;
}
// 选中按钮
@property (nonatomic, weak) UIButton *selTitleButton;
@property (nonatomic, strong) NSMutableArray *headViewsArr;
@end

@implementation ZJBMyRecordViewController

- (NSMutableArray *)headViewsArr
{
    if (!_headViewsArr)
    {
        _headViewsArr = [NSMutableArray array];
    }
    return _headViewsArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);

    [self createContentView];
    [self createHeadView];
    
    // Do any additional setup after loading the view.
}
#pragma mark - 顶部View
-(void)createHeadView
{
    headScroll =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, 40)];
    [self.view addSubview:headScroll];
    headScroll.backgroundColor = [UIColor whiteColor];
    
    NSArray * titleName = [[NSArray alloc]initWithObjects:@"审核中",@"已审核",@"全部", nil];
    NSArray * countArr = [[NSArray alloc]initWithObjects:@"20",@"20",@"20", nil];
    
    for (int i = 0; i<3; i++) {
        
        CGFloat width = zjbWindowW/3;
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(width*i, 0, width, 40)];
        UILabel *style = [[UILabel alloc]initWithFrame:CGRectMake(0, 7, width, 11)];
        style.text = titleName[i];
        style.textColor = [UIColor grayColor];
        style.font = [UIFont systemFontOfSize:16];
        style.textAlignment = NSTextAlignmentCenter;
        
        UILabel *coutLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 23, width, 9)];
        coutLab.textColor = [UIColor grayColor];
        coutLab.text = [NSString stringWithFormat:@"(%@)",countArr[i]];
        coutLab.font = [UIFont systemFontOfSize:12];
        coutLab.textAlignment = NSTextAlignmentCenter;
        
        view.alpha = 0.5;
        
        [view addSubview:style];
        [view addSubview:coutLab];
        UITapGestureRecognizer * touch=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoAction:)];
        view.userInteractionEnabled= YES;
        [view addGestureRecognizer:touch];
        [headScroll addSubview:view];
        [self.headViewsArr addObject:view];
        view.tag = i;
        if (i == 0) {
            line = [[UILabel alloc]initWithFrame:CGRectMake(0, 39, zjbWindowW/3, 1)];
            line.backgroundColor = [UIColor redColor];
            style.textColor = [UIColor redColor];
            coutLab.textColor = [UIColor redColor];
            view.alpha = 1;
            [headScroll addSubview:line];
            [self setUpOneChildViewController:i];
        }
    }
    headScroll.contentSize = CGSizeMake(zjbWindowW, 0);
}

#pragma mark  顶部按钮点击操作
-(void)gotoAction:(UITapGestureRecognizer *)sender
{
    NSInteger tag = [sender view].tag;
    NSLog(@"tag == %ld",(long)tag);
    [self setUpOneChildViewController:tag];
    [contentScroll setContentOffset:CGPointMake(tag*zjbWindowW, 0) animated:YES];
}
#pragma mark - 创建内容显示view
-(void)createContentView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    contentScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0,40, zjbWindowW, zjbWindowH-40)];
    contentScroll.delegate = self;
    contentScroll.pagingEnabled = YES;
    contentScroll.showsHorizontalScrollIndicator = NO;
    contentScroll.contentSize = CGSizeMake(3*zjbWindowW, 0);
    contentScroll.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:contentScroll];
    
    ZJBReviewTableViewController *vc = [[ZJBReviewTableViewController alloc] init];
    [self addChildViewController:vc];
    
    ZJBAlreadyTableViewController *vc1 = [[ZJBAlreadyTableViewController alloc] init];
    [self addChildViewController:vc1];
    
    ZJBWholeTableViewController *vc2 = [[ZJBWholeTableViewController alloc] init];
    [self addChildViewController:vc2];
    
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger i = contentScroll.contentOffset.x / zjbWindowW;
    [self setUpOneChildViewController:i];
    [contentScroll setContentOffset:CGPointMake(i*zjbWindowW, 0) animated:YES];
}
// 只要滚动UIScrollView就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger middleIndex = offsetX / zjbWindowW;
    NSInteger rightIndex = middleIndex + 1;
    NSInteger leftIndex = middleIndex - 1;
    
    UIView *middleButton = self.headViewsArr[middleIndex];
    
    [UIView animateWithDuration:0.5 animations:^{
        line.transform =CGAffineTransformMakeTranslation(middleIndex*zjbWindowW/3,0);
    }];
    UIView *rightButton = nil;
    if (rightIndex < self.headViewsArr.count) {
        rightButton = self.headViewsArr[rightIndex];
    }
    UIView *leftButton = nil;
    if (leftIndex>-1) {
        leftButton = self.headViewsArr[leftIndex];
    }
    for (UILabel *label in middleButton.subviews) {
        label.textColor = [UIColor redColor];
    }
    for (UILabel *label in leftButton.subviews) {
        label.textColor = [UIColor grayColor];
    }
    for (UILabel *label in rightButton.subviews) {
        label.textColor = [UIColor grayColor];
    }
    [UIView animateWithDuration:0.5 animations:^{
        middleButton.alpha = 1.0;
        rightButton.alpha = 0.5;
        leftButton.alpha = 0.5;
    }];
}
#pragma mark 设置子控制器
- (void)setUpOneChildViewController:(NSUInteger)i
{
    CGFloat x = i * zjbWindowW;
    
    UIViewController *vc = self.childViewControllers[i];
    
    if (vc.view.superview) {
        return;
    }
    vc.view.frame = CGRectMake(x, 0, zjbWindowW, zjbWindowH - contentScroll.frame.origin.y);
    
    [contentScroll addSubview:vc.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
