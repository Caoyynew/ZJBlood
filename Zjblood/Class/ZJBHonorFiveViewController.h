//
//  ZJBHonorFiveViewController.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZJBActionBlock5)(NSInteger number);

@interface ZJBHonorFiveViewController : UIViewController

@property (nonatomic, copy) ZJBActionBlock5 _block;

-(void)ZJBActionBlock5:(ZJBActionBlock5)block;
@end
