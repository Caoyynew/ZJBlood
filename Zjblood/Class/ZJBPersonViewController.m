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
#import "ZJBMyDataTableViewController.h"

@interface ZJBPersonViewController ()<ZJBPushViewControllerDelegate1,ZJBPushViewControllerDelegate2>
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
    cpersonView.delegate = self;
    [rootView addSubview:cpersonView];
    
    cpersonTableView = [[CPersonTableView alloc]initWithFrame:CGRectMake(0, CGRectMT(cpersonView, -40), zjbWindowW,400)];
    cpersonTableView.delegate = self;
    [rootView addSubview:cpersonTableView];
    
    [self.view addSubview:rootView];
    //设置上下滑动范围
    //TODO:适配机型(未完善)
    if (zjbWindowH <600) {
        rootView.contentSize = CGSizeMake(0, zjbWindowH+80);
    }else{
        rootView.contentSize = CGSizeMake(0, zjbWindowH+40);
    }
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
-(void)ZJBPushViewControllerWithTitle1
{
    [self gotoMyDataVC];
}
-(void)ZJBPushViewControllerWithTitle2
{
    [self gotoMyDataVC];
}

-(void)gotoMyDataVC
{
    ZJBMyDataTableViewController *myData = [[ZJBMyDataTableViewController alloc]init];
    myData.view.backgroundColor = [UIColor whiteColor];
    [myData ZJBHeadImgBlock:^(UIImage *img) {
        cpersonView.iconImageView.image = img;
    }];
    myData.title = @"我的资料";
    myData.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:myData animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    NSLog(@"====================");
//}

@end
