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
@interface ZJBMyDataTableViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    __block NSString * myName;
    __block NSString * myAddress;
    __block NSString * inputAddress;
    __block NSString * idCard;
    __block NSString * mySexName;
    
    UIImage * myHeadImg;
}
//相机管理器
@property (nonatomic ,strong) UIImagePickerController * imagePicker;
@property (nonatomic ,strong) UIImageView * headImage;
@end

@implementation ZJBMyDataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLeftButton];
    self.tableView.tableFooterView = [[UIView alloc]init];
}
#pragma mark - 导航栏右搜索按钮
-(void)createLeftButton
{
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhui"] style:UIBarButtonItemStyleDone target:self action:@selector(searchAction)];
    leftBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
}
-(void)ZJBHeadImgBlock:(ZJBHeadImgBlock)block
{
    self._block = block;
}

-(void)searchAction
{
    if (myHeadImg != nil) {
        
        self._block(myHeadImg);
        
    }
    [self.navigationController popViewControllerAnimated:YES];
}


// 返回按钮按下
- (void)backBtnClicked:(UIButton *)sender{

    [self.navigationController popViewControllerAnimated:YES];
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
    if (section == 0) {
        return 0;
    }else{
        return 15.0f;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 55.0f;
    }else{
        return 45.0f;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndetifier = @"systemDatacell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndetifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"pheadlogo"];
        cell.textLabel.text = @"头像";
        _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(cell.frame.size.width*0.8, cell.frame.size.height*0.15, cell.frame.size.height*0.7, cell.frame.size.height*0.7)];
        _headImage.layer.cornerRadius = 2.0f;
        _headImage.clipsToBounds = YES;
        if (myHeadImg == nil) {
            _headImage.image = [UIImage imageNamed:@""];
        }else{
            _headImage.image = myHeadImg;
        }
        [cell addSubview:_headImage];
    }else if (indexPath.section ==1){
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"pername"];
            cell.textLabel.text = @"姓名";
            cell.detailTextLabel.text = myName;
        }else if (indexPath.row == 1){
            cell.imageView.image = [UIImage imageNamed:@"persex"];
            cell.textLabel.text = @"性别";
            cell.detailTextLabel.text = mySexName;
        }else if (indexPath.row == 2){
            cell.imageView.image = [UIImage imageNamed:@"perphone"];
            cell.textLabel.text = @"手机号";
//            cell.accessoryType = UITableViewCellAccessoryNone;
        }else if (indexPath.row == 3){
            cell.imageView.image = [UIImage imageNamed:@"peridcard"];
            cell.textLabel.text = @"身份证";
            cell.detailTextLabel.text = idCard;
        }else if (indexPath.row == 4){
            cell.imageView.image = [UIImage imageNamed:@"peraddress"];
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
        _imagePicker = [[UIImagePickerController alloc]init];
        // 允许编辑
        _imagePicker.allowsEditing=YES;
        // 设置代理，检测操作
        _imagePicker.delegate=self;
        [self selectedImageForIcon];

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
#pragma mark  - 展示选择图片方式
-(void)selectedImageForIcon
{
    UIAlertController *alertController = [[UIAlertController alloc]init];
    UIAlertAction *actionCamera=[UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:_imagePicker animated:YES completion:nil];
    }];
    UIAlertAction *actionPhotoLIbrary=[UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:_imagePicker animated:YES completion:nil];
        
    }];
    UIAlertAction *actionPhotoAlbum=[UIAlertAction actionWithTitle:@"打开图库" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _imagePicker.sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self presentViewController:_imagePicker animated:YES completion:nil];
    }];
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:actionCamera];
    [alertController addAction:actionPhotoAlbum];
    [alertController addAction:actionPhotoLIbrary];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}
#pragma mark - UIImagePickerControllerDataDelegate
//完成拍照后的回调方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage * selectImg = info[@"UIImagePickerControllerEditedImage"];
    myHeadImg = selectImg;
    NSData *imgData = UIImageJPEGRepresentation(selectImg, 0.5);
    [[NSUserDefaults standardUserDefaults]setObject:imgData forKey:@"USER_HEAD_IMG"];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
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
