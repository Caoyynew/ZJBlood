//
//  ZJBComShowTableViewCell.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/20.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBComShowTableViewCell.h"

@implementation ZJBComShowTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createCell];
    }
    return self;
}

-(void)createCell
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGRect rect = CGRectMake(0, 0, width, 105);
    UIView * backView = [[UIView alloc]initWithFrame:rect];
    backView.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
//    backView.backgroundColor = [UIColor clearColor];
    [self addSubview:backView];
    
    UIImageView *contentView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 0, width-30, 90)];
    [backView addSubview:contentView];
    contentView.image = [UIImage imageNamed:@"bg_hong"];
    
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 250, 20)];
    title.text = @"浙江省无偿献血特表奉献奖";
    title.font = [UIFont systemFontOfSize:16];
    [contentView addSubview:title];
    
    UIView * line1 = [[UIView alloc]initWithFrame:CGRectMake(15, CGRectMT(title, 10), 1, 10)];
    line1.backgroundColor = [UIColor redColor];
    UILabel * timeLab = [[UILabel alloc]init];
    timeLab.text = @"2014-2015年度";
    timeLab.font = [UIFont systemFontOfSize:13];
    CGSize timeSize = [self setLabelSize:timeLab];
    timeLab.frame = CGRectMake(CGRectML(line1, 5), CGRectMT(title, 5), timeSize.width, 20);
    timeLab.textColor = [UIColor grayColor];
    UIView * line2 = [[UIView alloc]initWithFrame:CGRectMake(CGRectML(timeLab, 5), CGRectMT(title, 10), 1, 10)];
    line2.backgroundColor = [UIColor redColor];
    [contentView addSubview:line1];
    [contentView addSubview:line2];
    [contentView addSubview:timeLab];
    
    UIImageView * logoImg = [[UIImageView alloc]initWithFrame:CGRectMake(width-30-50, 40, 50, 65)];
    logoImg.image = [UIImage imageNamed:@"fengxian"];
    [logoImg setContentMode:UIViewContentModeScaleAspectFill];
    [backView addSubview:logoImg];
    
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
