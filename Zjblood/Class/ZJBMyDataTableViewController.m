//
//  ZJBMyDataTableViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/8.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBMyDataTableViewController.h"
#import "ZJBNameViewController.h"
#import "ZJBSexViewController.h"
#import "ZJBIdCardViewController.h"
#import "ZJBAddressViewController.h"
@interface ZJBMyDataTableViewController ()
{
    __block NSString * myName;
    __block NSString * myAddress;
    __block NSString * inputAddress;
    __block NSString * idCard;
    __block NSString * mySexName;
}
@end

@implementation ZJBMyDataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableView.tableFooterView = [[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }else if (section ==1){
        return 5;
    }else{
        return 0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndetifier = @"systemDatacell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndetifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"name"];
        cell.textLabel.text = @"头像";
    }else if (indexPath.section ==1){
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"name"];
            cell.textLabel.text = @"姓名";
            cell.detailTextLabel.text = myName;
        }else if (indexPath.row == 1){
            cell.imageView.image = [UIImage imageNamed:@"sex"];
            cell.textLabel.text = @"性别";
            cell.detailTextLabel.text = mySexName;
        }else if (indexPath.row == 2){
            cell.imageView.image = [UIImage imageNamed:@"phone"];
            cell.textLabel.text = @"手机号";
//            cell.accessoryType = UITableViewCellAccessoryNone;
        }else if (indexPath.row == 3){
            cell.imageView.image = [UIImage imageNamed:@"idcard"];
            cell.textLabel.text = @"身份证";
            cell.detailTextLabel.text = idCard;
        }else if (indexPath.row == 4){
            cell.imageView.image = [UIImage imageNamed:@"address"];
            cell.textLabel.text = @"地址";
            cell.detailTextLabel.text = myAddress;
        }
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSLog(@"打开相册相机");
    }else if (indexPath.section ==1){
        if (indexPath.row ==0) {
            ZJBNameViewController *nameVC = [[ZJBNameViewController alloc]init];
            nameVC.title = @"姓名";
            nameVC.view.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
            if (![myName isEqualToString:@""]) {
                nameVC.zjbName = myName;
            }
            [nameVC ZJBNameBlock:^(NSString *str) {
                myName = str;
                NSLog(@"%@",myName);
                [self.tableView reloadData];
            }];
            [self.navigationController pushViewController:nameVC animated:YES];
        }else if (indexPath.row ==1){
            ZJBSexViewController *sexVC = [[ZJBSexViewController alloc]init];
            sexVC.view.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
            sexVC.title = @"性别";
            sexVC.sexStr = mySexName;
            [sexVC ZJBSexBlock:^(NSString *sexName) {
                mySexName = sexName;
                [self.tableView reloadData];
            }];
            [self.navigationController pushViewController:sexVC animated:YES];
        }else if (indexPath.row ==2){
            
        }else if (indexPath.row ==3){
            ZJBIdCardViewController *idVC = [[ZJBIdCardViewController alloc]init];
            idVC.title = @"身份证";
            idVC.view.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
            if (idCard != nil) {
                idVC.zjbIdCard = idCard;
            }
            [idVC ZJBIdCardBlock:^(NSString *str) {
                idCard = str;
                [self.tableView reloadData];
            }];
            [self.navigationController pushViewController:idVC animated:YES];
        }else if (indexPath.row ==4){
            ZJBAddressViewController *addressVC = [[ZJBAddressViewController alloc]init];
            addressVC.title = @"地址";
            addressVC.view.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
            if (inputAddress !=nil) {
                addressVC.zjbAddress = inputAddress;
            }
            [addressVC ZJBAddressBlock:^(NSString *loc, NSString *input) {
                inputAddress = input;
                myAddress = [NSString stringWithFormat:@"%@%@",loc,input];
                [self.tableView reloadData];
            }];
            [self.navigationController pushViewController:addressVC animated:YES];
        }
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
