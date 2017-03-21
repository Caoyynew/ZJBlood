//
//  ZJBHonorOneViewController.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 同意按钮点击回调

 @param number 按钮的标识符
 */
typedef void (^ZJBActionBlock1)(NSInteger number);

@interface ZJBHonorOneViewController : UIViewController

@property (nonatomic ,copy)ZJBActionBlock1 _block;

-(void)ZJBActionBlock1:(ZJBActionBlock1)block;
@end
