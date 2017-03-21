//
//  ZJBApplyHonorVC.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/20.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBApplyHonorVC.h"
#import "ZJBHonorOneViewController.h"
#import "ZJBHonorTwoViewController.h"
#import "ZJBHonorThreeViewController.h"
#import "ZJBHonorFourViewController.h"
#import "ZJBHonorFiveViewController.h"

@interface ZJBApplyHonorVC ()<UIScrollViewDelegate>
{
    UIScrollView * headScrollView;
    UIScrollView * contentScrollView;
    BOOL isRight;
}
@property (nonatomic ,strong) NSMutableArray * viewsArr;
@end

@implementation ZJBApplyHonorVC

-(NSMutableArray *)viewsArr{
    if (!_viewsArr) {
        _viewsArr = [[NSMutableArray alloc]init];
    }
    return _viewsArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createHeadView];
    [self createContentView];
}
#pragma mark - 创建头部view
-(void)createHeadView
{
    headScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, 70)];
    headScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headScrollView];
    NSArray *titleArr = [[NSArray alloc]initWithObjects:@"申领告知",@"填写信息",@"资料上传",@"生成清单",@"等待审核", nil];
    NSInteger count = titleArr.count;
    CGFloat viewW = (zjbWindowW-24)/count;
    
    for (int i = 0; i<count; i++) {
        UIView * titleView = [[UIView alloc]initWithFrame:CGRectMake(12+i*viewW, 0, viewW, 70)];
        
        UIImageView * numImg = [[UIImageView alloc]initWithFrame:CGRectMake(0.5*viewW-6, 14, 12, 18)];
        
        numImg.image = [UIImage imageNamed:@"grey_weizhi"];
        [numImg setContentMode:UIViewContentModeScaleAspectFill];
        UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(0.5*viewW-6, 18, 12, 7)];
        if (i == 1) {
            NSLog(@"numImg=%@",numImg);
        }
        numLab.textAlignment = NSTextAlignmentCenter;
        numLab.text = [NSString stringWithFormat:@"%d",i+1];
        numLab.font = [UIFont systemFontOfSize:10];
        numLab.textColor = [UIColor grayColor];
        UIView *lineLab = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectMT(numImg, 0), viewW, 1)];
        lineLab.backgroundColor = [UIColor grayColor];
        
        UILabel * titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectMT(lineLab, 5), viewW, 30)];
        titleLab.text = titleArr[i];
        titleLab.textColor = [UIColor grayColor];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.font = [UIFont systemFontOfSize:13];
        
        [headScrollView addSubview:titleView];
        [titleView addSubview:numImg];
        [titleView addSubview:numLab];
        [titleView addSubview:lineLab];
        [titleView addSubview:titleLab];
        
        [self.viewsArr addObject:titleView];
        
        if (i == 0) {
            numImg.image = [UIImage imageNamed:@"red_weizhi"];
            numLab.textColor = [UIColor redColor];
            lineLab.backgroundColor = [UIColor redColor];
            titleLab.textColor = [UIColor redColor];
        }
    }
}
#pragma mark - 创建显示view
-(void)createContentView
{
    contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectMT(headScrollView, 15), zjbWindowW, zjbWindowH-85)];
    contentScrollView.backgroundColor = [UIColor whiteColor];
    contentScrollView.delegate = self;
    contentScrollView.scrollEnabled = NO;
    [self.view addSubview:contentScrollView];
    
    //添加子控制器
    [self addViewController];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    contentScrollView.contentSize = CGSizeMake(self.childViewControllers.count*zjbWindowW, 0);
    contentScrollView.pagingEnabled = YES;
//    contentScrollView.scrollEnabled = NO;
    contentScrollView.showsHorizontalScrollIndicator = NO;
    
    [self setUpOneChildViewController:0];
}
#pragma mark  添加子控制器
-(void)addViewController
{
    ZJBHonorOneViewController* vc1 = [[ZJBHonorOneViewController alloc]init];
    [self addChildViewController:vc1];
    [vc1 ZJBActionBlock1:^(NSInteger number) {
        [self gotoAction:number];
    }];
    
    ZJBHonorTwoViewController * vc2 = [[ZJBHonorTwoViewController alloc]init];
    [self addChildViewController:vc2];
    [vc2 ZJBActionBlock2:^(NSInteger number) {
        [self gotoAction:number];
    }];
    
    ZJBHonorThreeViewController * vc3 = [[ZJBHonorThreeViewController alloc]init];
    vc3.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:vc3];
    
    ZJBHonorFourViewController * vc4 = [[ZJBHonorFourViewController alloc]init];
    vc4.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:vc4];
    
    ZJBHonorFiveViewController * vc5 = [[ZJBHonorFiveViewController alloc]init];
    vc5.view.backgroundColor = [UIColor blackColor];
    [self addChildViewController:vc5];
}

#pragma mark - 展示子控制器
- (void)setUpOneChildViewController:(NSUInteger)i
{
    CGFloat x = i * zjbWindowW;
    
    UIViewController *vc = self.childViewControllers[i];
    
    if (vc.view.superview) {
        return;
    }
    vc.view.frame = CGRectMake(x, 0, zjbWindowW, zjbWindowH - contentScrollView.frame.origin.y);
    [contentScrollView addSubview:vc.view];
    
}

#pragma mark - 跳转Action
-(void)gotoAction:(NSInteger)number
{
    //第一个页面
    if (number == 0) {
        isRight = YES;
        [contentScrollView setContentOffset:CGPointMake(zjbWindowW, 0) animated:YES];
        [self setUpOneChildViewController:1];
    }
    //第二个页面
    if (number == 1) {
        isRight = YES;
        [contentScrollView setContentOffset:CGPointMake(2*zjbWindowW, 0) animated:YES];
        [self setUpOneChildViewController:2];
    }
    if (number == 2) {
        isRight = NO;
        [contentScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    //第三个页面
    if (number == 3) {
        isRight = YES;
        [contentScrollView setContentOffset:CGPointMake(3*zjbWindowW, 0) animated:YES];
        [self setUpOneChildViewController:3];
    }
    if (number == 4) {
        isRight = NO;
        [contentScrollView setContentOffset:CGPointMake(zjbWindowW, 0) animated:YES];
    }
    //第四个页面
    if (number == 5 ) {
        isRight = YES;
        [contentScrollView setContentOffset:CGPointMake(4*zjbWindowW, 0) animated:YES];
        [self setUpOneChildViewController:4];
    }
    if (number ==6) {
        isRight = NO;
        [contentScrollView setContentOffset:CGPointMake(2*zjbWindowW, 0) animated:YES];
    }
    //第五个页面
    if (number == 7) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

#pragma mark - UIScrollViewDelegate
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    NSUInteger i = contentScrollView.contentOffset.x / zjbWindowW;
//    [contentScrollView setContentOffset:CGPointMake(i*zjbWindowW, 0) animated:YES];
//    if (i>-1 &&i<self.viewsArr.count) {
//        [self setUpOneChildViewController:i];
//    }
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger Index = offsetX / zjbWindowW;

    if (Index>=0 && Index <self.viewsArr.count) {
        if (isRight) {
            UIView * nowView = self.viewsArr[Index];
            [UIView animateWithDuration:0.3 animations:^{
                for (UILabel * lab in nowView.subviews) {
                    if ([lab isMemberOfClass:[UILabel class]]) {
                        lab.textColor = [UIColor redColor];
                    }
                }
                for (UIView * vw in nowView.subviews) {
                    if ([vw isMemberOfClass:[UIView class]]) {
                        vw.backgroundColor = [UIColor redColor];
                    }
                }
                for (UIImageView *img in nowView.subviews) {
                    if ([img isMemberOfClass:[UIImageView class]]) {
                        img.image = [UIImage imageNamed:@"red_weizhi"];
                    }
                }
            }];
        }else{
            UIView * nowView = self.viewsArr[Index+1];
            [UIView animateWithDuration:0.3 animations:^{
                for (UILabel * lab in nowView.subviews) {
                    if ([lab isMemberOfClass:[UILabel class]]) {
                        lab.textColor = [UIColor grayColor];
                    }
                }
                for (UIView * vw in nowView.subviews) {
                    if ([vw isMemberOfClass:[UIView class]]) {
                        vw.backgroundColor = [UIColor grayColor];
                    }
                }
                for (UIImageView *img in nowView.subviews) {
                    if ([img isMemberOfClass:[UIImageView class]]) {
                        img.image = [UIImage imageNamed:@"grey_weizhi"];
                    }
                }
            }];
        }
    }
    
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
