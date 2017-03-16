//
//  ZJBDynamicTableViewCell.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/16.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJBDynamicTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *data;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end
