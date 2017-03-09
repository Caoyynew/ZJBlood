//
//  CPersonView.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/7.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CPersonView : UIView
{
    CAShapeLayer * CurvedLineLayer;
    UIBezierPath * path;
    UIView * recordBtn;
    UIView * honroBtn;
    UIView * recognitionBtn;
}
//用户基本信息
@property (nonatomic, strong) NSDictionary * userDic;
-(id)initWithFrame:(CGRect)frame withDic:(NSDictionary *)dic;
@end
