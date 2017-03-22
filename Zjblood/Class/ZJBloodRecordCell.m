//
//  ZJBloodRecordCell.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/19.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBloodRecordCell.h"

@implementation ZJBloodRecordCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//    [self setStates];
//    
//}
-(instancetype)initWithData:(NSString *)st
{
    [super awakeFromNib];
    if (self) {
//        self.states = st;
//        [self setStates];
    }
    return self;
}

-(void)setBloodStatesWith:(NSString *)state
{
    self.states = state;
    if ([self.states isEqualToString:@"3"]) {
        self.stateLab.text = @"报销成功";
        self.stateLab.textColor = [UIColor grayColor];
        self.stateImg.image = [UIImage imageNamed:@"yibaoxiao"];
    }else if ([self.states isEqualToString:@"1"]){
        self.stateLab.text = @"重新申请";
        self.stateLab.textColor = [UIColor redColor];
        self.stateImg.image = [UIImage imageNamed:@"unpassPic"];
        
    }else if ([self.states isEqualToString:@"0"]){
        self.stateLab.text = @"审核中";
        self.stateLab.textColor = [UIColor redColor];
        self.stateImg.image = [UIImage imageNamed:@""];
        
    }else if ([self.states isEqualToString:@"2"]){
        self.stateLab.text = @"审核通过";
        self.stateLab.textColor = RGB_COLOR(44, 221, 155, 1.0);
        self.stateImg.image = [UIImage imageNamed:@"passPic"];
        
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
