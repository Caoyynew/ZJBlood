//
//  CPersonView.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/7.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 子视图通知控制器操作代理
 */
@protocol ZJBPushViewControllerDelegate1<NSObject>

-(void)ZJBPushViewControllerWithTitle1;

@end
@interface CPersonView : UIView
{
    CAShapeLayer * CurvedLineLayer;
    UIBezierPath * path;
    UIView * recordBtn;
    UIView * honroBtn;
    UIView * recognitionBtn;
    
//    UIImageView *iconImageView;
    UIImage * headImg;
}

@property (nonatomic ,weak)id <ZJBPushViewControllerDelegate1>delegate;

//用户基本信息
@property (nonatomic, strong) NSDictionary * userDic;
@property (nonatomic, strong) UIImageView * iconImageView;


-(id)initWithFrame:(CGRect)frame withDic:(NSDictionary *)dic;
@end
