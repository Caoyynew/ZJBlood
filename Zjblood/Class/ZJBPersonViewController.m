//
//  ZJBPersonViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/7.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBPersonViewController.h"
#import "CPersonView.h"
#import "CPersonTableView.h"
@interface ZJBPersonViewController ()
{
    CPersonView *cpersonView;
    CPersonTableView *cpersonTableView;
    
    UIImageView *navBarLineHideView;
}
@end

@implementation ZJBPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView * rootView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, zjbWindowW, zjbWindowH)];
    //取消滑动反弹效果
    rootView.bounces = NO;
    
    cpersonView = [[CPersonView alloc]initWithFrame:CGRectMake(0, 0 ,zjbWindowW , 320) withDic:nil];
    cpersonView.backgroundColor = tabarColor;
    [rootView addSubview:cpersonView];
    
    cpersonTableView = [[CPersonTableView alloc]initWithFrame:CGRectMake(0, 342, zjbWindowW, zjbWindowH-342)];
    [rootView addSubview:cpersonTableView];
    
    [self.view addSubview:rootView];
    //设置上下滑动范围
    rootView.contentSize = CGSizeMake(0, zjbWindowH+44);
    // Do any additional setup after loading the view.
}
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
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
