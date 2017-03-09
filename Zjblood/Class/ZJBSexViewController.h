//
//  ZJBSexViewController.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/9.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZJBSexBlock)(NSString * sexName);

@interface ZJBSexViewController : UIViewController


@property (nonatomic, copy)ZJBSexBlock _block;
@property (nonatomic , strong) NSString * sexStr;

-(void)ZJBSexBlock:(ZJBSexBlock)block;
@end
