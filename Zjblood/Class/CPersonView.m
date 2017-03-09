//
//  CPersonView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/7.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "CPersonView.h"
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
    NSLog(@"path is null");
    //头像
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(cpviewW/2-60, cpviewH-0.68*cpviewW, 120, 120)];
    iconImageView.clipsToBounds = YES;
    iconImageView.layer.cornerRadius = 60;
    iconImageView.image = [UIImage imageNamed:@"icondefault"];
    iconImageView.contentMode =  UIViewContentModeScaleAspectFit;
    [self addSubview:iconImageView];
    
    //名字+性别
    UILabel * nameLab = [[UILabel alloc]init];
    nameLab.text = @"丁丁订";
    CGSize expectSize1 = [self setLabelSize:nameLab];
    nameLab.frame = CGRectMake(cpviewW/2-expectSize1.width/2, CGRectMT(iconImageView, 0), expectSize1.width, expectSize1.height);
    [self addSubview:nameLab];
    
    UIImageView *nameIconView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectML(nameLab, 10), CGRectMT(iconImageView, 0), 17, 17)];
    nameIconView.image = [UIImage imageNamed:@"man"];
    [self addSubview:nameIconView];
    
    //献血次数和总量
    UILabel *bloodCountLabel = [[UILabel alloc]init];
    bloodCountLabel.text  = @"累计献血 2次";
    bloodCountLabel.attributedText = [self setLabelColor:bloodCountLabel];
    CGSize expectSize2 = [self setLabelSize:bloodCountLabel];
    bloodCountLabel.frame = CGRectMake(0.2*cpviewW, CGRectMT(nameLab, 10), expectSize2.width, expectSize2.height);
    
    [self addSubview:bloodCountLabel];
    
    UILabel *bloodCapacityLabel = [[UILabel alloc]init];
    bloodCapacityLabel.text = @"献血总量 800ml";
    bloodCapacityLabel.attributedText = [self setLabelColor:bloodCapacityLabel];
    CGSize expectSize3 = [self setLabelSize:bloodCapacityLabel];
    bloodCapacityLabel.frame = CGRectMake(0.5*cpviewW, CGRectMT(nameLab,10), expectSize3.width, expectSize3.height);
    
    [self addSubview:bloodCapacityLabel];
    
    
    //献血记录按钮
    recordBtn = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectMT(bloodCapacityLabel, 10), (cpviewW-60)/3, 60)];
    UIView *view1 = [self drawViewOnButtonWithFrame:recordBtn.bounds buttonName:@"献血记录" imageName:@"bloodcount"];
    [recordBtn addSubview:view1];
    [self addSubview:recordBtn];
    UITapGestureRecognizer *tapCallPhone1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoRecort)];
    recordBtn.userInteractionEnabled= YES;
    [recordBtn addGestureRecognizer:tapCallPhone1];
    //我的荣誉按钮
    honroBtn = [[UIView alloc]initWithFrame:CGRectMake(CGRectML(recordBtn, 20), CGRectMT(bloodCapacityLabel, 10), (cpviewW-60)/3, 60)];
    UIView *view2 = [self drawViewOnButtonWithFrame:honroBtn.bounds buttonName:@"我的荣誉" imageName:@"bloodhonor"];
    [honroBtn addSubview:view2];
    [self addSubview:honroBtn];
    UITapGestureRecognizer *tapCallPhone2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoHonro)];
    honroBtn.userInteractionEnabled= YES;
    [honroBtn addGestureRecognizer:tapCallPhone2];
    //我的表彰按钮
    recognitionBtn = [[UIView alloc]initWithFrame:CGRectMake(CGRectML(honroBtn, 20), CGRectMT(bloodCapacityLabel, 10), (cpviewW-60)/3, 60)];
    UIView *view3 = [self drawViewOnButtonWithFrame:recognitionBtn.bounds buttonName:@"我的表彰" imageName:@"bloodrecognition"];
    [recognitionBtn addSubview:view3];
    [self addSubview:recognitionBtn];
    UITapGestureRecognizer *tapCallPhone3=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoRecognition)];
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
    NSAttributedString * mString = attributedString;
    return mString;
}
#pragma mark - 按钮点击事件处理
-(void)gotoRecort
{
    NSLog(@"献血记录");
}
-(void)gotoHonro
{
    NSLog(@"我的荣誉");
}
-(void)gotoRecognition
{
    NSLog(@"我的表彰");
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIColor *color = [UIColor whiteColor];
    [color set];
    path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(self.frame.size.width/2, 400)
                    radius:self.frame.size.width*0.7
                startAngle:0
                  endAngle:M_PI*2
                 clockwise:YES];
    [path fill];
    [self createView];
}

@end
