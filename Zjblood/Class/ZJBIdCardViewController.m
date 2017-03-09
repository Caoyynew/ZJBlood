//
//  ZJBIdCardViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/9.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBIdCardViewController.h"

@interface ZJBIdCardViewController ()
{
     UITextField * idCardField;
}
@end

@implementation ZJBIdCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏右按钮
    [self createRightButton];
    idCardField = [[UITextField alloc]initWithFrame:CGRectMake(0, 20, zjbWindowW, 60)];
    idCardField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    CGRect frame = idCardField.bounds;
    frame.size.width = 20;
    UIView * leftView = [[UIView alloc]initWithFrame:frame];
    idCardField.leftViewMode = UITextFieldViewModeAlways;
    idCardField.leftView = leftView;
    idCardField.backgroundColor = [UIColor whiteColor];
    idCardField.font = [UIFont systemFontOfSize:18];
    idCardField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:idCardField];
    if (self.zjbIdCard != nil) {
        idCardField.text = self.zjbIdCard;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    idCardField.text = self.zjbIdCard;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

-(void)createRightButton
{
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveAction)];
    rightBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

-(void)saveAction
{
    self._block(idCardField.text);
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)ZJBIdCardBlock:(ZJBIdCardBlock)block
{
    self._block = block;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [idCardField resignFirstResponder];
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
