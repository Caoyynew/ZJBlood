//
//  ZJBHonorTwoViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBHonorTwoViewController.h"
#import "ZJBHonorAlertView.h"
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
    
//    ZJBHonorAlertView *alert1;
//    UIButton * backView;
    
    //选择返回数据
    NSString * cityStr;
    NSString * studyStr;
    NSString * jobStr;
    NSString * bloodStr;
    NSString * RHbloodStr;
    
    //数据
    NSArray * citysArr;
    NSArray * studyArr;
    NSArray * jobArr;
    NSArray * bloodArr;
    NSArray * rhbloodArr;

}
@end

@implementation ZJBHonorTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setDataArr];

    CGRect rect = CGRectMake(0, 0, zjbWindowW, zjbWindowH-150);
    applyTableView = [[UITableView alloc]initWithFrame:rect];
    applyTableView.delegate = self;
    applyTableView.dataSource = self;
    [self.view addSubview:applyTableView];
    applyTableView.tableFooterView = [[UIView alloc]init];
    
}
#pragma mark - 填充数据
-(void)setDataArr
{
    citysArr = [NSArray arrayWithObjects:@"杭州",@"滨江",@"下城区",@"上城区",@"西湖区",@"萧山区",@"余杭区", nil];
    studyArr = [NSArray arrayWithObjects:@"本科以下",@"本科以上",@"本科", nil];
    jobArr = [NSArray arrayWithObjects:@"现役军人",@"国家工作人员",@"其他",@"医务人员",@"高校学生", nil];
    bloodArr = [NSArray arrayWithObjects:@"A型",@"B型",@"AB型",@"O型",@"不祥", nil];
    rhbloodArr = [NSArray arrayWithObjects:@"阴性",@"阳性",@"不祥", nil];
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
            UILabel * alertLab1 = [[UILabel alloc]initWithFrame:CGRectMake(zjbWindowW*0.4, 0,zjbWindowW*0.5, 45)];
            alertLab1.textAlignment = NSTextAlignmentRight;
            alertLab1.text = cityStr;
            [cell addSubview:alertLab1];
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
            UILabel * alertLab2 = [[UILabel alloc]initWithFrame:CGRectMake(zjbWindowW*0.4, 0,zjbWindowW*0.5, 45)];
            alertLab2.textAlignment = NSTextAlignmentRight;
            alertLab2.text = studyStr;
            [cell addSubview:alertLab2];
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"职业(选填)";
            UILabel * alertLab3 = [[UILabel alloc]initWithFrame:CGRectMake(zjbWindowW*0.4, 0,zjbWindowW*0.5, 45)];
            alertLab3.textAlignment = NSTextAlignmentRight;
            alertLab3.text = jobStr;
            [cell addSubview:alertLab3];
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"血型";
            UILabel * alertLab4 = [[UILabel alloc]initWithFrame:CGRectMake(zjbWindowW*0.4, 0,zjbWindowW*0.5, 45)];
            alertLab4.textAlignment = NSTextAlignmentRight;
            alertLab4.text = bloodStr;
            [cell addSubview:alertLab4];
        }else if (indexPath.row == 3){
            cell.textLabel.text = @"RH血型";
            UILabel * alertLab5 = [[UILabel alloc]initWithFrame:CGRectMake(zjbWindowW*0.4, 0,zjbWindowW*0.5, 45)];
            alertLab5.textAlignment = NSTextAlignmentRight;
            alertLab5.text = RHbloodStr;
            [cell addSubview:alertLab5];
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"领取方式";
            cell.accessoryType = UITableViewCellAccessoryNone;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 1) {
        [self createAlertView:1];
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [self createAlertView:2];
        }
        if (indexPath.row == 1) {
            [self createAlertView:3];
        }
        if (indexPath.row == 2) {
            [self createAlertView:4];
        }
        if (indexPath.row == 3) {
            [self createAlertView:5];
        }
    }
}

-(void)createAlertView:(NSInteger)index
{
    CGFloat center = [UIScreen mainScreen].bounds.size.height/2;
    CGFloat rowHeight = 40.0f;
    if (index == 1) {
        ZJBHonorAlertView * alert1 = [[ZJBHonorAlertView alloc]initWithFrame:CGRectMake(zjbWindowW*0.15,center-150,zjbWindowW*0.7, 300) titleArr:citysArr];
        [alert1 ZJBHonorCellBackData:^(NSString *selectStr) {
            cityStr = selectStr;
            [applyTableView reloadData];

        }];
        [alert1 showView];
    }
    if (index == 2) {
        ZJBHonorAlertView * alert2 = [[ZJBHonorAlertView alloc]initWithFrame:CGRectMake(zjbWindowW*0.15,center-studyArr.count*rowHeight*0.5,zjbWindowW*0.7, studyArr.count*rowHeight) titleArr:studyArr];
        [alert2 ZJBHonorCellBackData:^(NSString *selectStr) {
            studyStr = selectStr;
            [applyTableView reloadData];

        }];
        [alert2 showView];
    }
    if (index == 3) {
        ZJBHonorAlertView * alert3 = [[ZJBHonorAlertView alloc]initWithFrame:CGRectMake(zjbWindowW*0.15,center-jobArr.count*rowHeight*0.5,zjbWindowW*0.7, jobArr.count*rowHeight) titleArr:jobArr];
        [alert3 ZJBHonorCellBackData:^(NSString *selectStr) {
            jobStr = selectStr;
            [applyTableView reloadData];

        }];
        [alert3 showView];
    }
    if (index == 4) {
        ZJBHonorAlertView * alert4 = [[ZJBHonorAlertView alloc]initWithFrame:CGRectMake(zjbWindowW*0.15,center-bloodArr.count*rowHeight*0.5,zjbWindowW*0.7, bloodArr.count*rowHeight) titleArr:bloodArr];
        [alert4 ZJBHonorCellBackData:^(NSString *selectStr) {
            bloodStr = selectStr;
            [applyTableView reloadData];

        }];
        [alert4 showView];
    }
    if (index == 5) {
        ZJBHonorAlertView * alert5 = [[ZJBHonorAlertView alloc]initWithFrame:CGRectMake(zjbWindowW*0.15,center-rhbloodArr.count*rowHeight*0.5,zjbWindowW*0.7, rhbloodArr.count*rowHeight) titleArr:rhbloodArr];
        [alert5 ZJBHonorCellBackData:^(NSString *selectStr) {
            RHbloodStr = selectStr;
            [applyTableView reloadData];

        }];
        [alert5 showView];
    }

}

#pragma mark - 页面跳转
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

#pragma mark - 收起键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger tag = textField.tag;
    nameStr = name.text;
    phoneStr = phone.text;
    bloodnumStr = bloodnum.text;
    postAddressStr = postAddress.text;
    if (tag == 50) {
        [name resignFirstResponder];
//        [bloodnum becomeFirstResponder];
    }
    if (tag == 51) {
        [bloodnum resignFirstResponder];
//        [phone becomeFirstResponder];
    }
    if (tag == 52) {
        [phone resignFirstResponder];
    }
    if (tag == 53) {
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
