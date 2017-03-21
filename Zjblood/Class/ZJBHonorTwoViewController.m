//
//  ZJBHonorTwoViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBHonorTwoViewController.h"

@interface ZJBHonorTwoViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView * applyTableView;
    
    UITextField * name;
    UITextField * phone;
    UITextField * bloodnum;
    UITextField * postAddress;
    
    NSString * nameStr;
    NSString * phoneStr;
    NSString * bloodnumStr;
    NSString * postAddressStr;
}
@end

@implementation ZJBHonorTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = CGRectMake(0, 0, zjbWindowW, zjbWindowH-150);
    applyTableView = [[UITableView alloc]initWithFrame:rect];
    applyTableView.delegate = self;
    applyTableView.dataSource = self;
    [self.view addSubview:applyTableView];
    applyTableView.tableFooterView = [[UIView alloc]init];
}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }else if (section == 1){
        return 4;
    }else if (section == 2){
        return 3;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row ==0) {
        return 52.0f;
    }
    if (indexPath.section == 2 && indexPath.row == 2) {
        return 180.0f;
    }
    return 45.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else{
        return 15.0f;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    return view;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    if (section == 2) {
//        return 100.0f;
//    }else{
//        return 0;
//    }
//}
//-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView * footView = [[UIView alloc]init];
//    if (section == 2) {
//        footView.backgroundColor = [UIColor orangeColor];
//    }
//    return footView;
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]init];
   
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        if (indexPath.row==0) {
            cell.imageView.image = [UIImage imageNamed:@"honormessage"];
            cell.textLabel.text = @"申领者信息";
            cell.accessoryType = UITableViewCellAccessoryNone;
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"所在城市";
            cell.detailTextLabel.text = @"浙江 杭州";
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"献血者姓名";
            name = [[UITextField alloc]initWithFrame:CGRectMake(zjbWindowW*0.4, 0,zjbWindowW*0.5, 45)];
            name.textAlignment = NSTextAlignmentRight;
            name.delegate = self;
            name.text = nameStr;
            name.tag = 50;
            [cell addSubview:name];
        }else if (indexPath.row == 3){
            cell.textLabel.text = @"献血者证件号";
            bloodnum = [[UITextField alloc]initWithFrame:CGRectMake(zjbWindowW*0.4, 0, zjbWindowW*0.5, 45)];
            bloodnum.tag = 51;
            bloodnum.delegate = self;
            bloodnum.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
            bloodnum.text = bloodnumStr;
            bloodnum.textAlignment = NSTextAlignmentRight;
            [cell addSubview:bloodnum];
        }else if (indexPath.row == 4){
            cell.textLabel.text = @"献血者电话";
            phone = [[UITextField alloc]initWithFrame:CGRectMake(zjbWindowW*0.4, 0, zjbWindowW*0.5, 45)];
            phone.textAlignment = NSTextAlignmentRight;
            phone.delegate = self;
            phone.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
            phone.text = phoneStr;
            phone.tag = 52;
            [cell addSubview:phone];
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"学历(选填)";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"职业(选填)";
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"血型";
        }else if (indexPath.row == 3){
            cell.textLabel.text = @"RH血型";
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"领取方式";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"邮寄地址";
            postAddress = [[UITextField alloc]initWithFrame:CGRectMake(zjbWindowW*0.4, 0, zjbWindowW*0.5, 45)];
            postAddress.tag = 53;
            postAddress.delegate = self;
            postAddress.textAlignment = NSTextAlignmentRight;
            postAddress.text = postAddressStr;
            [cell addSubview:postAddress];
        }else if (indexPath.row ==2){
            cell.accessoryType = UITableViewCellAccessoryNone;
            UIButton * nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100,40,200,40)];
            nextBtn.backgroundColor = buttonColor;
            nextBtn.clipsToBounds=YES;
            nextBtn.layer.cornerRadius=5;
            nextBtn.tag = 20;
            [nextBtn setTitle:@"下一项" forState:UIControlStateNormal];
            [nextBtn addTarget:self action:@selector(adviceAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:nextBtn];
            
            UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100, CGRectMT(nextBtn, 20), 200, 40)];
            backBtn.backgroundColor = [UIColor grayColor];
            backBtn.clipsToBounds=YES;
            backBtn.layer.cornerRadius=5;
            backBtn.tag = 21;
            [backBtn setTitle:@"上一步" forState:UIControlStateNormal];
            [backBtn addTarget:self action:@selector(adviceAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:backBtn];

        }
    }
    return cell;
}
-(void)ZJBActionBlock2:(ZJBActionBlock2)block
{
    self._block = block;
}
-(void)adviceAction:(UIButton *)sender
{
    if (sender.tag == 20) {
        NSLog(@"下一项");
        self._block(1);
    }else if (sender.tag == 21){
        NSLog(@"上一步");
        self._block(2);
    }
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger tag = textField.tag;
    if (tag == 50) {
        nameStr = name.text;
        [name resignFirstResponder];
        [bloodnum becomeFirstResponder];
    }
    if (tag == 51) {
        bloodnumStr = bloodnum.text;
        [bloodnum resignFirstResponder];
        [phone becomeFirstResponder];
    }
    if (tag == 52) {
        phoneStr = phone.text;
        [phone resignFirstResponder];
    }
    if (tag == 53) {
        postAddressStr = postAddress.text;
        [postAddress resignFirstResponder];
    }
    return YES;
    
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
