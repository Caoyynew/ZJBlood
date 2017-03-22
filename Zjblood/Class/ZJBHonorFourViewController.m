//
//  ZJBHonorFourViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBHonorFourViewController.h"

@interface ZJBHonorFourViewController ()

@end

@implementation ZJBHonorFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //按钮
    UIButton * nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100,120,200,40)];
    nextBtn.backgroundColor = buttonColor;
    nextBtn.clipsToBounds=YES;
    nextBtn.layer.cornerRadius=5;
    nextBtn.tag = 40;
    [nextBtn setTitle:@"下一项" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(adviceAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100, CGRectMT(nextBtn, 20), 200, 40)];
    backBtn.backgroundColor = [UIColor grayColor];
    backBtn.clipsToBounds=YES;
    backBtn.layer.cornerRadius=5;
    backBtn.tag = 41;
    [backBtn setTitle:@"上一步" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(adviceAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:nextBtn];
    [self.view addSubview:backBtn];
}
-(void)adviceAction:(UIButton *)sender
{
    if (sender.tag == 40) {
        NSLog(@"下一项");
        self._block(5);
    }else if (sender.tag == 41){
        NSLog(@"上一步");
        self._block(6);
    }
}
-(void)ZJBActionBlock4:(ZJBActionBlock4)block
{
    self._block = block;
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
