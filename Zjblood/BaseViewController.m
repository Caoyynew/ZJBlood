//
//  BaseViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/7.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "BaseViewController.h"



@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController * serviceNC = [self setViewContriller:[[ZJBServiceViewController alloc]init] withTitle:@"服务窗" andImageName:@"service"];
    UINavigationController * informationNV = [self setViewContriller:[[ZJBInformationViewController alloc]init] withTitle:@"资讯窗" andImageName:@"information"];
    UINavigationController * personNC = [self setViewContriller:[[ZJBPersonViewController alloc]init] withTitle:@"我" andImageName:@"person"];
    NSArray *viewArr = @[serviceNC,informationNV,personNC];
    [self setViewControllers:viewArr animated:NO];
    //设置标签栏文字和图片的颜色
    //设置导航栏背景色
    [[UINavigationBar appearance] setBarTintColor:tabarColor];
    
    //设置标签栏风格(默认高度49)
    //    self.tabBar.barStyle = UIBarStyleDefault;
    //设置初始状态选中的下标
    self.selectedIndex = 0;

    // Do any additional setup after loading the view.
    
}

-(UINavigationController *)setViewContriller:(UIViewController *)vc withTitle:(NSString *)title andImageName:(NSString *)imageName
    {
        
        if ([title isEqualToString:@"我"]) {
            vc.title = @"个人中心";
            
        }else{
            vc.title = title;
        }
        vc.tabBarItem.title = title;
        vc.tabBarItem.image = [UIImage imageNamed:imageName];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                                NSForegroundColorAttributeName:tabarColor} forState:UIControlStateSelected];
        UINavigationController * NC = [[UINavigationController alloc]initWithRootViewController:vc];
        [NC.navigationBar setTitleTextAttributes:
         @{NSFontAttributeName:[UIFont systemFontOfSize:18],
           NSForegroundColorAttributeName:[UIColor whiteColor]}];
        //取消半透明
        NC.navigationBar.translucent = NO;
        //取消导航栏下方黑线
        if ([NC.title isEqualToString:@"个人中心"]) {
            [NC.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
            [NC.navigationBar setShadowImage:[[UIImage alloc] init]];
        }
        return NC;
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
