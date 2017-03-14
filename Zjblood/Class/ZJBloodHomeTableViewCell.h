//
//  ZJBloodHomeTableViewCell.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/14.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJBloodHomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *contentImg;
@property (weak, nonatomic) IBOutlet UILabel *contentTitle;
@property (weak, nonatomic) IBOutlet UILabel *contentText;
@property (weak, nonatomic) IBOutlet UIImageView *conpanyLogo;
@property (weak, nonatomic) IBOutlet UIImageView *conpanyLogoBig;
@property (weak, nonatomic) IBOutlet UILabel *dataTime;
@property (weak, nonatomic) IBOutlet UILabel *conpanyName;
@property (weak, nonatomic) IBOutlet UILabel *lookPeople;
@property (weak, nonatomic) IBOutlet UILabel *writerPeople;

@end
