//
//  ZJBHonorTwoViewController.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZJBActionBlock2)(NSInteger number);

@interface ZJBHonorTwoViewController : UIViewController
@property (nonatomic, copy) ZJBActionBlock2 _block;

-(void)ZJBActionBlock2:(ZJBActionBlock2)block;

@end
