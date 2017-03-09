//
//  ZJBNameViewController.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/9.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZJBNameBlock)(NSString * str);

@interface ZJBNameViewController : UIViewController

@property (nonatomic, copy)ZJBNameBlock _block;
@property (nonatomic, strong) NSString *zjbName;

-(void)ZJBNameBlock:(ZJBNameBlock)block;

@end
