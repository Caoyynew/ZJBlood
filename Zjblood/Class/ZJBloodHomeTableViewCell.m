//
//  ZJBloodHomeTableViewCell.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/14.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBloodHomeTableViewCell.h"

@implementation ZJBloodHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.conpanyLogoBig.layer.cornerRadius = 12.5f;
    self.conpanyLogoBig.clipsToBounds = YES;
    if ([_cellType isEqualToString:@"one"]) {
        self.headView.frame = CGRectMake(0, 0, self.bounds.size.width, 0);
    }
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
