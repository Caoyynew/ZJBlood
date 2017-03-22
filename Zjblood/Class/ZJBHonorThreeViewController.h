//
//  ZJBHonorThreeViewController.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZJBActionBlock3)(NSInteger number);

@interface ZJBHonorThreeViewController : UIViewController

@property (nonatomic, copy) ZJBActionBlock3 _block;

-(void)ZJBActionBlock3:(ZJBActionBlock3)block;
@end
