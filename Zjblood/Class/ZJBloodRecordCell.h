//
//  ZJBloodRecordCell.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/19.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJBloodRecordCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bloodData;
@property (weak, nonatomic) IBOutlet UIImageView *stateImg;
@property (weak, nonatomic) IBOutlet UILabel *stateLab;
@property (weak, nonatomic) IBOutlet UILabel *proposerName;
@property (nonatomic ,strong) NSString * states;

-(void)setBloodStatesWith:(NSString *)state;

@end
