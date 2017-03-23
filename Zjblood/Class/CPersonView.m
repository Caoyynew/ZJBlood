//
//  CPersonView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/7.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "CPersonView.h"

#import "ZJBMyHonorViewController.h"
#import "ZJBMyRecordViewController.h"
#import "ZJBMyCommendViewController.h"

#define cpviewW self.frame.size.width
#define cpviewH self.frame.size.height

@implementation CPersonView

-(id)initWithFrame:(CGRect)frame withDic:(NSDictionary *)dic
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userDic = [[NSDictionary alloc]initWithDictionary:dic];
    }
    return self;
}
//画界面
-(void)createView
{
//    NSLog(@"path is null");
    //头像
    CGRect rect = CGRectMake(cpviewW/2-36,50, 72, 72);
    _iconImageView = [[UIImageView alloc]initWithFrame:rect];
    _iconImageView.tag = 52;
    
    CALayer * layer = [_iconImageView layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:36.0];
    
    UIView * shadow = [[UIView alloc] initWithFrame: rect];
    _iconImageView.frame = CGRectMake(0,0,rect.size.width, rect.size.height);

    shadow.layer.shadowColor = [UIColor blackColor].CGColor;
    shadow.layer.shadowOffset = CGSizeMake(1,1);
    //不透明度
    shadow.layer.shadowOpacity = 0.5;
    shadow.layer.shadowRadius = 2.0;
//    shadow.layer.cornerRadius = 36.0;
//    shadow.clipsToBounds = NO;
    [shadow addSubview: _iconImageView];
//    _iconImageView.backgroundColor = [UIColor orangeColor];
    _iconImageView.image = [UIImage imageNamed:@"icondefault"];
    if (headImg != nil) {
        _iconImageView.image = headImg;
        _iconImageView.contentMode =  UIViewContentModeScaleAspectFit;
    }
    UITapGestureRecognizer * gotoMyData=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoAction:)];
    shadow.tag = 52;
    shadow.userInteractionEnabled= YES;
    [shadow addGestureRecognizer:gotoMyData];
    [self addSubview:shadow];
    
    //名字+性别
    UILabel * nameLab = [[UILabel alloc]init];
    nameLab.text = @"丁丁订";
    nameLab.font = [UIFont systemFontOfSize:16];
    CGSize expectSize1 = [self setLabelSize:nameLab];
    nameLab.frame = CGRectMake(cpviewW/2-expectSize1.width/2, CGRectMT(shadow, 15), expectSize1.width, expectSize1.height);
    [self addSubview:nameLab];
    
    UIImageView *nameIconView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectML(nameLab, 5), CGRectMT(shadow, 13), 13, 13)];
    nameIconView.image = [UIImage imageNamed:@"manlogo"];
    [self addSubview:nameIconView];
    
    //献血次数和总量
    UILabel *bloodCountLabel = [[UILabel alloc]init];
    bloodCountLabel.text  = @"累计献血 2次";
    bloodCountLabel.font = [UIFont systemFontOfSize:14];
    bloodCountLabel.attributedText = [self setLabelColor:bloodCountLabel];
    CGSize expectSize2 = [self setLabelSize:bloodCountLabel];
    bloodCountLabel.frame = CGRectMake(0.2*cpviewW, CGRectMT(nameLab, 10), expectSize2.width, expectSize2.height);
    
    [self addSubview:bloodCountLabel];
    
    UILabel *bloodCapacityLabel = [[UILabel alloc]init];
    bloodCapacityLabel.text = @"献血总量 800ml";
    bloodCapacityLabel.font = [UIFont systemFontOfSize:14];
    bloodCapacityLabel.attributedText = [self setLabelColor:bloodCapacityLabel];
    CGSize expectSize3 = [self setLabelSize:bloodCapacityLabel];
    bloodCapacityLabel.frame = CGRectMake(0.5*cpviewW, CGRectMT(nameLab,10), expectSize3.width, expectSize3.height);
    
    [self addSubview:bloodCapacityLabel];
    
    
    //献血记录按钮
    recordBtn = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectMT(bloodCapacityLabel, 15), (cpviewW-60)/3, 60)];
    UIView *view1 = [self drawViewOnButtonWithFrame:recordBtn.bounds buttonName:@"还血记录" imageName:@"bloodcount"];
    [recordBtn addSubview:view1];
    [self addSubview:recordBtn];
    recordBtn.tag = 49;
    UITapGestureRecognizer *tapCallPhone1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoAction:)];
    recordBtn.userInteractionEnabled= YES;
    [recordBtn addGestureRecognizer:tapCallPhone1];
    //我的荣誉按钮
    honroBtn = [[UIView alloc]initWithFrame:CGRectMake(CGRectML(recordBtn, 20), CGRectMT(bloodCapacityLabel, 15), (cpviewW-60)/3, 60)];
    UIView *view2 = [self drawViewOnButtonWithFrame:honroBtn.bounds buttonName:@"我的荣誉证" imageName:@"bloodhonor"];
    [honroBtn addSubview:view2];
    [self addSubview:honroBtn];
    honroBtn.tag = 50;
    UITapGestureRecognizer *tapCallPhone2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoAction:)];
    honroBtn.userInteractionEnabled= YES;
    [honroBtn addGestureRecognizer:tapCallPhone2];
    //我的表彰按钮
    recognitionBtn = [[UIView alloc]initWithFrame:CGRectMake(CGRectML(honroBtn, 20), CGRectMT(bloodCapacityLabel, 15), (cpviewW-60)/3, 60)];
    UIView *view3 = [self drawViewOnButtonWithFrame:recognitionBtn.bounds buttonName:@"我的表彰" imageName:@"bloodrecognition"];
    [recognitionBtn addSubview:view3];
    [self addSubview:recognitionBtn];
    recognitionBtn.tag = 51;
    UITapGestureRecognizer *tapCallPhone3=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoAction:)];
    recognitionBtn.userInteractionEnabled= YES;
    [recognitionBtn addGestureRecognizer:tapCallPhone3];
    
}
#pragma mark - 给按钮上加图片和文字
-(UIView *)drawViewOnButtonWithFrame:(CGRect)rect buttonName:(NSString *)btnname imageName:(NSString *)imageName
{
    UIView * btnView = [[UIView alloc]initWithFrame:rect];
    UIImageView *btnImageView = [[UIImageView alloc]initWithFrame:CGRectMake(((cpviewW-60)/3-25)/2, 0, 20, 25)];
    btnImageView.image = [UIImage imageNamed:imageName];
    [btnView addSubview:btnImageView];
    
    UILabel *btnNameLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, btnView.frame.size.width, 30)];
    btnNameLab.text = btnname;
    btnNameLab.font = [UIFont systemFontOfSize:16];
    btnNameLab.textAlignment = NSTextAlignmentCenter;
    [btnView addSubview:btnNameLab];
    return btnView;
}
#pragma mark - Label自适应宽高
-(CGSize)setLabelSize:(UILabel *)label
{
    label.numberOfLines = 1;//根据最大行数需求来设置
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize = CGSizeMake(100, 9999);//labelsize的最大值
    CGSize expectSize = [label sizeThatFits:maximumLabelSize];
    return expectSize;
}
#pragma mark - 设置label颜色
-(NSAttributedString *)setLabelColor:(UILabel *)lab
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:lab.text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, lab.text.length-5)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 4)];
    NSAttributedString * mString = attributedString;
    return mString;
}
#pragma mark - 按钮点击事件处理
-(void)gotoAction:(UITapGestureRecognizer*)sender
{
    NSInteger VCTag = [sender view].tag;
    if (VCTag ==49) {
        ZJBMyRecordViewController * myrecord = [[ZJBMyRecordViewController alloc]init];
        myrecord.title = @"还血记录";
        myrecord.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:myrecord animated:YES];
    }else if (VCTag ==50){
        ZJBMyHonorViewController * myhonor = [[ZJBMyHonorViewController alloc]init];
        myhonor.title = @"我的荣誉证";
        myhonor.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:myhonor animated:YES];
    }else if (VCTag ==51){
        ZJBMyCommendViewController * mycommend = [[ZJBMyCommendViewController alloc]init];
        mycommend.title = @"表彰查询";
        mycommend.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:mycommend animated:YES];
    }else if(VCTag == 52){
        
        [self.delegate ZJBPushViewControllerWithTitle1];
        
//        ZJBMyDataTableViewController * mydata = [[ZJBMyDataTableViewController alloc]init];
//        [mydata ZJBHeadImgBlock:^(UIImage *img) {
//            headImg = img;
//            _iconImageView.image = headImg;
//        }];
//        mydata.title = @"我的资料";
//        mydata.hidesBottomBarWhenPushed = YES;
//        [[self viewController].navigationController pushViewController:mydata animated:YES];
    }else{
        NSLog(@"cucuole!!!");
    }
}

#pragma mark - 获取当前视图的视图控制器
- (UIViewController *)viewController {
    for (UIView *next = [self superview]; next != nil; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIColor *color = [UIColor whiteColor];
    [color set];
    path = [[UIBezierPath alloc] init];
    CGFloat radius = self.frame.size.width*0.8;
    CGFloat y = 360;
    CGFloat width = self.frame.size.width;
    if (width>400) {
        y = 445;
    }else if (width<414 && width > 374){
        y = 410;
    }
    [path addArcWithCenter:CGPointMake(self.frame.size.width/2, y)
                    radius:radius
                startAngle:0
                  endAngle:M_PI*2
                 clockwise:YES];
    [path fill];
    [self createView];
}

@end
