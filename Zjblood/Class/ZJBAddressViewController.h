//
//  ZJBAddressViewController.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/9.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZJBAddressBlock)(NSString * loc,NSString * input);

@interface ZJBAddressViewController : UIViewController

@property (nonatomic, copy)ZJBAddressBlock _block;
@property (nonatomic, strong) NSString *zjbAddress;

-(void)ZJBAddressBlock:(ZJBAddressBlock)block;

@end
