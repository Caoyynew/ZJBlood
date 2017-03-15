//
//  ZJBloodLoveTableViewCell.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/15.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBloodLoveTableViewCell.h"

@implementation ZJBloodLoveTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.conpanyLogoBig.layer.cornerRadius = 12.5f;
    self.conpanyLogoBig.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
