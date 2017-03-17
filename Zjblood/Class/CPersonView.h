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
@protocol ZJBPushViewControllerDelegate<NSObject>

-(void)ZJBPushViewControllerWithTitle:(NSInteger)VCTag;

@end
@interface CPersonView : UIView
{
    CAShapeLayer * CurvedLineLayer;
    UIBezierPath * path;
    UIView * recordBtn;
    UIView * honroBtn;
    UIView * recognitionBtn;
}

@property (nonatomic ,weak)id <ZJBPushViewControllerDelegate>delegate;

//用户基本信息
@property (nonatomic, strong) NSDictionary * userDic;

-(id)initWithFrame:(CGRect)frame withDic:(NSDictionary *)dic;
@end
