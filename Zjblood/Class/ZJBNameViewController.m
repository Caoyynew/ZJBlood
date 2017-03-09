//
//  ZJBNameViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/9.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBNameViewController.h"

@interface ZJBNameViewController ()
{
    UITextField * nameField;
}
//@property (nonatomic, strong)UIButton *rightBtn;//右按钮

@end

@implementation ZJBNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //设置导航栏右按钮
    [self createRightButton];
    
    nameField = [[UITextField alloc]initWithFrame:CGRectMake(0, 20, zjbWindowW, 60)];
    CGRect frame = nameField.bounds;
    frame.size.width = 20;
    UIView * leftView = [[UIView alloc]initWithFrame:frame];
    nameField.leftViewMode = UITextFieldViewModeAlways;
    nameField.leftView = leftView;
    nameField.backgroundColor = [UIColor whiteColor];
    nameField.font = [UIFont systemFontOfSize:18];
    nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:nameField];
    if (self.zjbName != nil) {
        nameField.text = self.zjbName;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    nameField.text = self.zjbName;
}


-(void)createRightButton
{
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveAction)];
    rightBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

-(void)saveAction
{
    self._block(nameField.text);
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)ZJBNameBlock:(ZJBNameBlock)block
{
    self._block = block;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [nameField resignFirstResponder];
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
