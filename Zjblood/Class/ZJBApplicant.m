//
//  ZJBApplicant.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/16.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBApplicant.h"

@implementation ZJBApplicant

-(instancetype)initWithFrame:(CGRect)frame type:(NSInteger)ty
{
    self = [super initWithFrame:frame];
    if (self) {
        self.type = ty;
        [self createView];
    }
    return self;
}

-(void)createView
{
    UIView * apliView = [[UIView alloc]initWithFrame:self.frame];
    apliView.backgroundColor = [UIColor whiteColor];
    [self addSubview:apliView];
    
    UILabel * timeLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 10)];
    timeLab.text = @"2016.10.12";
    timeLab.textColor = [UIColor grayColor];
    timeLab.font = [UIFont systemFontOfSize:12];
    [apliView addSubview:timeLab];
    
    UIImageView * honorLogo = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectMT(timeLab, 18), 20, 25)];
    honorLogo.image = [UIImage imageNamed:@"myhonorLogo"];
    [honorLogo setContentMode:UIViewContentModeScaleAspectFill];
    [apliView addSubview:honorLogo];
    
    UILabel * honorApliLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(honorLogo, 15), CGRectMT(timeLab, 20), 100, 20)];
    honorApliLab.text = @"荣誉证申请";
//    honorApliLab.textColor = [UIColor grayColor];
    honorApliLab.font = [UIFont systemFontOfSize:17];
    [apliView addSubview:honorApliLab];
    
    UIImageView * isPassIV = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-70, 0, 70, 80)];
    if (self.type == 1) {
        isPassIV.image = [UIImage imageNamed:@"passPic"];
    }else {
        isPassIV.image = [UIImage imageNamed:@"unpassPic"];
    }
    [isPassIV setContentMode:UIViewContentModeScaleAspectFill];
    [apliView addSubview:isPassIV];
    
    UILabel * apliName = [[UILabel alloc]init];
    apliName.text = @"申请人: 胡斐斐";
    apliName.font = [UIFont systemFontOfSize:14];
    apliName.textColor = [UIColor grayColor];
    CGFloat x = [self configUISizeWithStr:apliName.text font:apliName.font];
    apliName.frame = CGRectMake(self.frame.size.width-x-20, 48, x, 20);
    [apliView addSubview:apliName];
    
    UILabel *lineLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 82, self.frame.size.width-30, 1)];
    lineLab.backgroundColor = [UIColor grayColor];
    lineLab.alpha = 0.3;
    [apliView addSubview:lineLab];
    
    UILabel * apliResult = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2-50, CGRectMT(lineLab, 10), 100, 20)];
    apliResult.textAlignment = NSTextAlignmentCenter;
    if (self.type == 1) {
        apliResult.text = @"审核通过";
        apliResult.textColor = RGB_COLOR(44, 221, 155, 1.0);
    }else{
        apliResult.text = @"重新申请";
        apliResult.textColor = [UIColor redColor];
        UITapGestureRecognizer * click = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reapply)];
        apliResult.userInteractionEnabled= YES;
        [apliResult addGestureRecognizer:click];
    }
    [apliView addSubview:apliResult];

}

#pragma mark - 根据标题计算控件大小
- (CGFloat)configUISizeWithStr:(NSString *)str font:(UIFont *)fnt
{
    CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil]];
    CGFloat w = size.width;
    return w;
}


-(void)reapply
{
    NSLog(@"重新申请!!");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
