//
//  ZJBHonorThreeViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBHonorThreeViewController.h"

@interface ZJBHonorThreeViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    NSInteger whichImg;
    UIImage * image1;
    UIImage * image2;
    
    UIImageView * uploadPic1;
    UIImageView * uploadPic2;
    
}
@property (nonatomic ,strong) UIImagePickerController * imagePicker;

@end

@implementation ZJBHonorThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (uploadPic1 && image1) {
        uploadPic1.image = image1;
    }
    if (uploadPic2 && image2) {
        uploadPic2.image = image2;
    }
}

-(void)createUI
{
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, 15)];
    lineView.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    [self.view addSubview:lineView];
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 15, zjbWindowW, 53)];
    titleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titleView];
    
    UIImageView * dataLogoImg = [[UIImageView alloc]initWithFrame:CGRectMake(15, 16.5, 23, 20)];
    dataLogoImg.image = [UIImage imageNamed:@"ziliaozhaopian"];
    [dataLogoImg setContentMode:UIViewContentModeScaleAspectFill];
    
    UILabel * titleLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(dataLogoImg, 10), 15, 100, 23)];
    titleLab.text = @"资料照片";
    titleLab.font = [UIFont systemFontOfSize:17];
    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(15, CGRectMT(titleView, 1), zjbWindowW-30, 1)];
    line.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    
    [titleView addSubview:dataLogoImg];
    [titleView addSubview:titleLab];
    [self.view addSubview:line];
    //照片
    UIView * picView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectMT(line, 0), zjbWindowW, 400)];
    [self.view addSubview:picView];
    
    UILabel * picLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 180, 20)];
    picLab.text = @"本人一寸照(背景须为红色)";
    picLab.font = [UIFont systemFontOfSize:15];
    
    UIImageView * picTip = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectML(picLab, 5), 12.5, 15, 15)];
    picTip.image = [UIImage imageNamed:@"tishi"];
    
    uploadPic1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectMT(picLab, 10), 62, 62)];
    uploadPic1.image = [UIImage imageNamed:@"uploadpic_def"];
    if (image1) {
        uploadPic1.image = image1;
    }
    [uploadPic1 setContentMode:UIViewContentModeScaleAspectFit];
    //imageview添加手势
    uploadPic1.tag = 1001;
    UITapGestureRecognizer * selectPic=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectPic:)];
    uploadPic1.userInteractionEnabled= YES;
    [uploadPic1 addGestureRecognizer:selectPic];
    
    UILabel * idLab = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectMT(uploadPic1, 10), 100, 20)];
    idLab.text = @"身份证复印件";
    idLab.font = [UIFont systemFontOfSize:15];
    
    UIImageView * picTip2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectML(idLab, 0), CGRectMT(uploadPic1, 12.5), 15, 15)];
    picTip2.image = [UIImage imageNamed:@"tishi"];
   
    uploadPic2 = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectMT(idLab, 10), 62, 62)];
    uploadPic2.image = [UIImage imageNamed:@"uploadpic_def"];
    if (image2) {
        uploadPic2.image = image2;
    }
    [uploadPic2 setContentMode:UIViewContentModeScaleAspectFit];
    //imageview添加手势
    uploadPic2.tag = 1002;
    UITapGestureRecognizer * selectPic2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectPic:)];
    uploadPic2.userInteractionEnabled= YES;
    [uploadPic2 addGestureRecognizer:selectPic2];
    
    [picView addSubview:picLab];
    [picView addSubview:picTip];
    [picView addSubview:uploadPic1];
    [picView addSubview:idLab];
    [picView addSubview:picTip2];
    [picView addSubview:uploadPic2];
    
    //按钮
    UIButton * nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100,CGRectMT(uploadPic2, 20),200,40)];
    nextBtn.backgroundColor = buttonColor;
    nextBtn.clipsToBounds=YES;
    nextBtn.layer.cornerRadius=5;
    nextBtn.tag = 30;
    [nextBtn setTitle:@"提交申请" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(adviceAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100, CGRectMT(nextBtn, 20), 200, 40)];
    backBtn.backgroundColor = [UIColor grayColor];
    backBtn.clipsToBounds=YES;
    backBtn.layer.cornerRadius=5;
    backBtn.tag = 31;
    [backBtn setTitle:@"上一步" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(adviceAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [picView addSubview:nextBtn];
    [picView addSubview:backBtn];
}
#pragma mark - 点击图片选择照片
-(void)selectPic:(UITapGestureRecognizer*)sender
{
    whichImg = [sender view].tag;
    _imagePicker = [[UIImagePickerController alloc]init];
    // 允许编辑
    _imagePicker.allowsEditing=NO;
    // 设置代理，检测操作
    _imagePicker.delegate= self;
    [self selectedImageForIcon];
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
    UIImage * selectImg = info[@"UIImagePickerControllerOriginalImage"];
    if (whichImg == 1001) {
        image1 = selectImg;
    }else if (whichImg == 1002){
        image2 = selectImg;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)ZJBActionBlock3:(ZJBActionBlock3)block
{
    self._block = block;
}

-(void)adviceAction:(UIButton *)sender
{
    if (sender.tag == 30) {
        NSLog(@"下一项");
        self._block(3);
    }else if (sender.tag == 31){
        NSLog(@"上一步");
        self._block(4);
    }
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
