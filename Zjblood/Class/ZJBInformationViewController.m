//
//  ZJBInformationViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/7.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBInformationViewController.h"
#import "ZJBInfoTableViewController.h"
#import "ZJBPolicyTableViewController.h"
#import "ZJBLoveTableViewController.h"

static CGFloat const titleH = 44;
static CGFloat const maxTitleScale = 1.3;

@interface ZJBInformationViewController ()<UIScrollViewDelegate>
{
    UIScrollView *titleScrollView;
    UIScrollView *contentScrollView;
    UILabel * lineLab ;
}
//@property (nonatomic, weak) UIScrollView *titleScrollView;
//@property (nonatomic, weak) UIScrollView *contentScrollView;
// 选中按钮
@property (nonatomic, weak) UIButton *selTitleButton;

@property (nonatomic, strong) NSMutableArray *buttons;
@end

@implementation ZJBInformationViewController

- (NSMutableArray *)buttons
{
    if (!_buttons)
    {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTitleScrollView];
    [self setupContentScrollView];
    [self addChildViewController];
    [self setupTitle];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    contentScrollView.contentSize = CGSizeMake(self.childViewControllers.count * zjbWindowW, 0);
    contentScrollView.pagingEnabled = YES;
    contentScrollView.showsHorizontalScrollIndicator = NO;
    contentScrollView.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

#pragma mark - 设置头部标题栏
- (void)setupTitleScrollView
{
    CGRect rect = CGRectMake(0, 0, zjbWindowW, titleH);
    titleScrollView = [[UIScrollView alloc] initWithFrame:rect];
    titleScrollView.backgroundColor = tabarColor;
    self.navigationItem.titleView = titleScrollView;
}

#pragma mark - 设置内容
- (void)setupContentScrollView
{
    CGRect rect = CGRectMake(0, 0, zjbWindowW, zjbWindowH);
    contentScrollView = [[UIScrollView alloc] initWithFrame:rect];
    [self.view addSubview:contentScrollView];
}

#pragma mark - 添加子控制器
- (void)addChildViewController
{
    ZJBInfoTableViewController *vc = [[ZJBInfoTableViewController alloc] init];
    vc.title = @"资讯";
    [self addChildViewController:vc];
    
    ZJBPolicyTableViewController *vc1 = [[ZJBPolicyTableViewController alloc] init];
    vc1.title = @"政策";
    [self addChildViewController:vc1];
    
    ZJBLoveTableViewController *vc2 = [[ZJBLoveTableViewController alloc] init];
    vc2.title = @"爱心汇";
    [self addChildViewController:vc2];
    
//    ZJBLoveTableViewController *vc3 = [[ZJBLoveTableViewController alloc] init];
//    vc3.title = @"爱心";
//    [self addChildViewController:vc3];
//    
//    ZJBLoveTableViewController *vc4 = [[ZJBLoveTableViewController alloc] init];
//    vc4.title = @"爱汇心";
//    [self addChildViewController:vc4];
//    
}

#pragma mark - 设置标题
- (void)setupTitle
{
    NSUInteger count = self.childViewControllers.count;
    
    CGFloat x = 0;
    CGFloat w = 80;
    CGFloat h = titleH;
    
    for (int i = 0; i < count; i++)
    {
        UIViewController *vc = self.childViewControllers[i];
        
        x = i * w;
        CGRect rect = CGRectMake(x, 0, w, h);
        
        UIButton *btn = [[UIButton alloc] initWithFrame:rect];
        
        btn.tag = i;
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(chick:) forControlEvents:UIControlEventTouchDown];
        
        NSString *content = btn.titleLabel.text;
        UIFont *font = btn.titleLabel.font;
        CGSize size = CGSizeMake(MAXFLOAT, 30.0f);
        CGSize buttonSize = [content boundingRectWithSize:size
                                                  options:NSStringDrawingTruncatesLastVisibleLine  | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                               attributes:@{ NSFontAttributeName:font}
                                                  context:nil].size;
        btn.alpha = 0.5;
        [self.buttons addObject:btn];
        [titleScrollView addSubview:btn];
        //显示第一次加载页面数据
        if (i == 0)
        {
            btn.alpha = 1.0;
            lineLab = [[UILabel alloc]initWithFrame:CGRectMake((w-buttonSize.width*maxTitleScale)/2, h-7, buttonSize.width*maxTitleScale, 1)];
            lineLab.backgroundColor = [UIColor whiteColor];
            [titleScrollView addSubview:lineLab];
            [self chick:btn];
            btn.transform = CGAffineTransformMakeScale(maxTitleScale,maxTitleScale);
    

        }
    }
    titleScrollView.contentSize = CGSizeMake(count * w, 0);
    titleScrollView.showsHorizontalScrollIndicator = YES;
}

// 按钮点击
- (void)chick:(UIButton *)btn
{
    NSUInteger i = btn.tag;
    [self setUpOneChildViewController:i];
    [self selTitleBtn:btn];
}
// 选中按钮
- (void)selTitleBtn:(UIButton *)btn
{
    self.selTitleButton.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:0.5 animations:^{
        self.selTitleButton.transform = CGAffineTransformMakeScale(maxTitleScale, maxTitleScale);
    }];
    [contentScrollView setContentOffset:CGPointMake(btn.tag*zjbWindowW+0.5, 0) animated:YES];
}

- (void)setUpOneChildViewController:(NSUInteger)i
{
    CGFloat x = i * zjbWindowW;
    
    UIViewController *vc = self.childViewControllers[i];
    
    if (vc.view.superview) {
        return;
    }
    vc.view.frame = CGRectMake(x, 0, zjbWindowW, zjbWindowH - contentScrollView.frame.origin.y-44);
    
    [contentScrollView addSubview:vc.view];
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger i = contentScrollView.contentOffset.x / zjbWindowW;
    [self selTitleBtn:self.buttons[i]];
    [self setUpOneChildViewController:i];
}

// 只要滚动UIScrollView就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger middleIndex = offsetX / zjbWindowW;
    NSInteger rightIndex = middleIndex + 1;
    NSInteger leftIndex = middleIndex - 1;
    
    UIButton *middleButton = self.buttons[middleIndex];

    UIButton *rightButton = nil;
    UIButton *leftButton = nil;
    if (leftIndex>-1) {
        leftButton = self.buttons[leftIndex];
    }
    if (rightIndex < self.buttons.count) {
        rightButton = self.buttons[rightIndex];
    }
    [UIView animateWithDuration:0.5 animations:^{
        if (rightButton == nil) {
            lineLab.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(middleIndex*80,0), 1.4, 1);
        }else{
            lineLab.transform =CGAffineTransformMakeTranslation(middleIndex*80,0);

        }
    }];
   
    
    [UIView animateWithDuration:0.5 animations:^{
        middleButton.alpha = 1.0;
        rightButton.alpha = 0.5;
        leftButton.alpha = 0.5;
        middleButton.transform = CGAffineTransformMakeScale(maxTitleScale, maxTitleScale);
        rightButton.transform = CGAffineTransformMakeScale(1, 1);
        leftButton.transform = CGAffineTransformMakeScale(1, 1);
    }];
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
