//
//  ZJBHonorAlertView.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZJBHonorCellBackData)(NSString * selectStr);


@interface ZJBHonorAlertView : UIView

@property (nonatomic, copy)ZJBHonorCellBackData _block;

@property (nonatomic, strong) NSArray * titlesArr;

-(instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)arr;

-(void)ZJBHonorCellBackData:(ZJBHonorCellBackData)block;

-(void)showView;

@end
