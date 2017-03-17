//
//  ZJBloodAskViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/14.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBloodAskViewController.h"

@interface ZJBloodAskViewController ()

@end

@implementation ZJBloodAskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRightButton];
    // Do any additional setup after loading the view.
}
-(void)createRightButton
{
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"serviceSearch"] style:UIBarButtonItemStyleDone target:self action:@selector(searchAction)];
    rightBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
-(void)searchAction
{
    NSLog(@"点击了search!!");
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
