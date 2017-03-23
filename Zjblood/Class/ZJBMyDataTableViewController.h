//
//  ZJBMyDataTableViewController.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/8.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZJBHeadImgBlock)(UIImage * img);

@interface ZJBMyDataTableViewController : UITableViewController

@property (nonatomic , copy)ZJBHeadImgBlock _block;

-(void)ZJBHeadImgBlock:(ZJBHeadImgBlock)block;

@end
