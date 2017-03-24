//
//  ZJBAboutOursViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/24.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBAboutOursViewController.h"

@interface ZJBAboutOursViewController ()

@end

@implementation ZJBAboutOursViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * logo = [[UIImageView alloc]initWithFrame:CGRectMake(zjbWindowW/2-30, 40, 60, 60)];
    logo.layer.cornerRadius = 3.0f;
    logo.clipsToBounds = YES;
    logo.image = [UIImage imageNamed:@"version"];
    [self.view addSubview:logo];
    
    UITextView * textView = [[UITextView alloc]initWithFrame:CGRectMake(20, CGRectMT(logo, 20), zjbWindowW-40, zjbWindowH - 150)];
    
    NSString * content = @"浙江省献血管理中心为浙江省卫生计生委所属承担行政职能的事业单位，主要工作职责是根据上级对献血工作的要求，协助有关部门制定献血工作的有关政策、法规和行政规章等；\n负责制订全省公民献血规划和计划；\n负责无偿献血的宣传、发动、组织和实施等工作；\n具体指导各市、县的无偿献血工作，负责公民用血和还血的管理及全省血源的调配；\n负责全省无偿献血证的征订、发放和管理；\n负责供血（浆）员、供血（浆）证的监督管理；\n完成省卫生计生委交办的其他事项等。";

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;    //行间距
//    paragraphStyle.maximumLineHeight = 60;   /**最大行高*/
    paragraphStyle.firstLineHeadIndent = 33.f;    /**首行缩进宽度*/
    paragraphStyle.alignment = NSTextAlignmentJustified;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:16],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    textView.attributedText = [[NSAttributedString alloc] initWithString:content attributes:attributes];
    textView.textColor = [UIColor grayColor];
    textView.backgroundColor = backColor;
    [self.view addSubview:textView];
    textView.editable = NO;
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
