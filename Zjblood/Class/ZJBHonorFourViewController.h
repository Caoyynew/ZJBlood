//
//  ZJBHonorFourViewController.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZJBActionBlock4)(NSInteger number);

@interface ZJBHonorFourViewController : UIViewController
@property (nonatomic, copy) ZJBActionBlock4 _block;

-(void)ZJBActionBlock4:(ZJBActionBlock4)block;
@end
