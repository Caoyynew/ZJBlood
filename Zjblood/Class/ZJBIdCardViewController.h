//
//  ZJBIdCardViewController.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/9.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZJBIdCardBlock)(NSString * str);

@interface ZJBIdCardViewController : UIViewController

@property (nonatomic, copy)ZJBIdCardBlock _block;
@property (nonatomic, strong) NSString *zjbIdCard;

-(void)ZJBIdCardBlock:(ZJBIdCardBlock)block;

@end
