//
//  ZJBApplicationContent.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/16.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBApplicationContent.h"

@implementation ZJBApplicationContent

-(instancetype)initWithFrame:(CGRect)frame type:(NSInteger)ty
{
    self = [super initWithFrame:frame];
    if (self) {
        self.type = ty;
        if (self.type ==1) {
            [self createSucUI];
        }else{
            [self createFailUI];
        }
        
    }
    return self;
}
#pragma mark - 申请失败页面
-(void)createFailUI
{
    CGFloat w = self.frame.size.width;
    
    UIView * failView = [[UIView alloc]initWithFrame:CGRectMake(0, 15, w, 110)];
    failView.backgroundColor = [UIColor whiteColor];
    [self addSubview:failView];
    UIImageView * logo = [[UIImageView alloc]initWithFrame:CGRectMake(15, 17.5, 20, 15)];
    logo.image = [UIImage imageNamed:@"yuanyin"];
    [logo setContentMode:UIViewContentModeScaleAspectFill];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(logo, 15), 15, 100, 20)];
    title.text = @"原因说明";
    title.font = [UIFont systemFontOfSize:17];
    UILabel *lineLab = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectMT(title, 10), self.frame.size.width-30, 1)];
    lineLab.backgroundColor = [UIColor grayColor];
    lineLab.alpha = 0.3;
    
    UILabel * failReason = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectMT(lineLab, 0), w, 55)];
    failReason.text = @"您当前的献血数量未达到申请荣誉证的最低标准";
    failReason.textColor = [UIColor grayColor];
    failReason.font = [UIFont systemFontOfSize:15];
    failReason.numberOfLines = 0;
    
    [failView addSubview:logo];
    [failView addSubview:title];
    [failView addSubview:lineLab];
    [failView addSubview:failReason];
}

#pragma mark - 申请成功页面
-(void)createSucUI
{
    CGFloat w = self.frame.size.width;
    self.backgroundColor = [UIColor whiteColor];
    UIView * lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, w, 15)];
    lineView1.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    [self addSubview:lineView1];
    
    UIView * honorV1 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectMT(lineView1, 0), w, 185)];
    [self addSubview:honorV1];
    UIImageView * logo1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 17.5, 20, 15)];
    logo1.image = [UIImage imageNamed:@"honorImg"];
    [logo1 setContentMode:UIViewContentModeScaleAspectFill];
    UILabel *title1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(logo1, 15), 15, 100, 20)];
    title1.text = @"荣誉证图片";
    title1.font = [UIFont systemFontOfSize:17];
    CGFloat minW = (w-345)/2.0;
    UIImageView * honorImg1 = [[UIImageView alloc]initWithFrame:CGRectMake(minW, CGRectMT(title1, 15), 165, 100)];
    [honorImg1 setContentMode:UIViewContentModeScaleAspectFill];
    honorImg1.image = [UIImage imageNamed:@"zhengmian"];
    
    UILabel * zhengmian = [[UILabel alloc]initWithFrame:CGRectMake(32.5+minW, CGRectMT(honorImg1, 5), 100, 20)];
    zhengmian.text = @"封面展开图";
    zhengmian.font = [UIFont systemFontOfSize:14];
    zhengmian.textColor = [UIColor grayColor];
    zhengmian.textAlignment = NSTextAlignmentCenter;
    
    UIImageView * honorImg2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectML(honorImg1, 15), CGRectMT(title1, 15), 165, 100)];
    [honorImg2 setContentMode:UIViewContentModeScaleAspectFill];
    honorImg2.image = [UIImage imageNamed:@"fanmian"];
    
    UILabel * fanmian = [[UILabel alloc]initWithFrame:CGRectMake(212.5+minW, CGRectMT(honorImg1, 5), 100, 20)];
    fanmian.text = @"内部展开图";
    fanmian.font = [UIFont systemFontOfSize:14];
    fanmian.textColor = [UIColor grayColor];
    fanmian.textAlignment = NSTextAlignmentCenter;
    
    [honorV1 addSubview:logo1];
    [honorV1 addSubview:title1];
    [honorV1 addSubview:honorImg1];
    [honorV1 addSubview:zhengmian];
    [honorV1 addSubview:honorImg2];
    [honorV1 addSubview:fanmian];
    
    
    UIView * lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectMT(honorV1, 0), w, 15)];
    lineView2.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    [self addSubview:lineView2];
    
    UIView * honorV2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectMT(lineView2, 0), w, 140)];
    [self addSubview:honorV2];
    UIImageView * logo2 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 17.5, 20, 15)];
    logo2.image = [UIImage imageNamed:@"wuliuxinxi"];
    [logo2 setContentMode:UIViewContentModeScaleAspectFill];
    UILabel *title2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(logo2, 15), 15, 100, 20)];
    title2.text = @"物流信息";
    title2.font = [UIFont systemFontOfSize:17];
    
    UILabel *lineLab = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectMT(title2, 10), self.frame.size.width-30, 1)];
    lineLab.backgroundColor = [UIColor grayColor];
    lineLab.alpha = 0.3;
    
    UILabel * expressComLab = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectMT(lineLab, 15), 80, 15)];
    expressComLab.text = @"快递公司:";
    expressComLab.font = [UIFont systemFontOfSize:15];
    expressComLab.textColor = [UIColor grayColor];
    UILabel * expressCom = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(expressComLab, 0), CGRectMT(lineLab, 15), 100, 15)];
    expressCom.text = @"韵达快递";
    expressCom.textColor = [UIColor grayColor];
    expressCom.font = [UIFont systemFontOfSize:15];
    UILabel * expressNoLab = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectMT(expressComLab, 10), 80, 15)];
    expressNoLab.text = @"快递单号:";
    expressNoLab.font = [UIFont systemFontOfSize:15];
    expressNoLab.textColor = [UIColor grayColor];
    UILabel * expressNo = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(expressNoLab, 0), CGRectMT(expressCom, 10), 200, 15)];
    expressNo.text = @"30303030391223313382";
    expressNo.textColor = [UIColor grayColor];
    expressNo.font = [UIFont systemFontOfSize:15];
    UILabel * expressPhoneLab = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectMT(expressNo, 10), 80, 15)];
    expressPhoneLab.text = @"服务电话:";
    expressPhoneLab.font = [UIFont systemFontOfSize:15];
    expressPhoneLab.textColor = [UIColor grayColor];
    UILabel * expressPhone = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(expressNoLab, 0), CGRectMT(expressNo, 10), 100, 15)];
    expressPhone.text = @"95546";
    // 下划线
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:expressPhone.text attributes:attribtDic];
    //赋值
    expressPhone.attributedText = attribtStr;
    expressPhone.textColor = [UIColor redColor];
    expressPhone.font = [UIFont systemFontOfSize:15];
    expressPhone.tag = 200;
    UITapGestureRecognizer * click = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(callPhone:)];
    expressPhone.userInteractionEnabled= YES;
    [expressPhone addGestureRecognizer:click];
    
    [honorV2 addSubview:lineLab];
    [honorV2 addSubview:logo2];
    [honorV2 addSubview:title2];
    [honorV2 addSubview:expressComLab];
    [honorV2 addSubview:expressCom];
    [honorV2 addSubview:expressNoLab];
    [honorV2 addSubview:expressNo];
    [honorV2 addSubview:expressPhone];
    [honorV2 addSubview:expressPhoneLab];
    
    UIView * lineView3 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectMT(honorV2, 0), w, 15)];
    lineView3.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    [self addSubview:lineView3];
    
    UIView * honorV3 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectMT(lineView3, 0), w, 140)];
    [self addSubview:honorV3];
    UIImageView * logo3 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 17.5, 20, 15)];
    logo3.image = [UIImage imageNamed:@"zhandian"];
    [logo3 setContentMode:UIViewContentModeScaleAspectFill];
    UILabel *title3 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(logo3, 10), 15, 100, 20)];
    title3.text = @"自取站点";
    title3.font = [UIFont systemFontOfSize:17];
    
    UILabel *lineLab2 = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectMT(title3, 10), self.frame.size.width-30, 1)];
    lineLab2.backgroundColor = [UIColor grayColor];
    lineLab2.alpha = 0.3;
    
    UILabel * location = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectMT(lineLab2, 15), 200, 15)];
    location.text = @"杭州市献血管理中心";
    location.font = [UIFont systemFontOfSize:15];
    location.textColor = [UIColor grayColor];
    
    UILabel * location2 = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectMT(location, 10), 200, 15)];
    location2.text = @"杭州市下城区武林路345号";
    location2.font = [UIFont systemFontOfSize:15];
    location2.textColor = [UIColor grayColor];
    
    UILabel * location3 = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectMT(location2, 10), 80, 15)];
    location3.text = @"服务电话:";
    location3.font = [UIFont systemFontOfSize:15];
    location3.textColor = [UIColor grayColor];
    
    UILabel * servicePhone = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(location3, 0), CGRectMT(location2, 10), 200, 15)];
    servicePhone.text = @"0571-85167819";
    NSDictionary *attribtDic2 = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr2 = [[NSMutableAttributedString alloc]initWithString:servicePhone.text attributes:attribtDic2];
    //赋值
    servicePhone.attributedText = attribtStr2;
    servicePhone.textColor = [UIColor redColor];
    servicePhone.tag = 201;
    servicePhone.font = [UIFont systemFontOfSize:15];
    UITapGestureRecognizer * click2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(callPhone:)];
    servicePhone.userInteractionEnabled= YES;
    [servicePhone addGestureRecognizer:click2];
    
    [honorV3 addSubview:logo3];
    [honorV3 addSubview:title3];
    [honorV3 addSubview:lineLab2];
    [honorV3 addSubview:location];
    [honorV3 addSubview:location2];
    [honorV3 addSubview:location3];
    [honorV3 addSubview:servicePhone];

}

-(void)callPhone:(UITapGestureRecognizer *)click
{
#if TARGET_IPHONE_SIMULATOR
        NSLog(@"run on simulator");
#define SIMULATOR_TEST
#else
        if ([click view].tag == 200) {
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://95546"]];
        }else if ([click view].tag ==201){
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://0571-82883456"]];
        }
#endif
 
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    
////    self.backgroundColor = [UIColor grayColor];
//}

@end
