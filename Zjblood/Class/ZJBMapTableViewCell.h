//
//  ZJBMapTableViewCell.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/23.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJBMapTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bloodTitle;
@property (weak, nonatomic) IBOutlet UILabel *bloodDetail;
@property (weak, nonatomic) IBOutlet UILabel *bloodDistance;
@property (weak, nonatomic) IBOutlet UIImageView *goLogo;
@property (weak, nonatomic) IBOutlet UILabel *goTitle;

@end
