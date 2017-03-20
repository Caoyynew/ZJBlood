//
//  ZJBCommendView.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/20.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJBCommendView : UIView
{
    UIWindow *_window;
    
}
@property (nonatomic ,strong)NSArray * titlesArr;
@property (nonatomic , strong) UIView * contentView;
@property (nonatomic ,strong) NSString * redTitle;

@property (strong, nonatomic) UIControl *control;
@property NSInteger btnType;
/**
 初始化方法

 @param frame view尺寸
 @param type 按钮类型(左按钮0,右按钮1)
 @param titles 标题
 @return self
 */
-(instancetype)initWithFrame:(CGRect)frame nowTitle:(NSString*)title type:(NSInteger)type titleArr:(NSArray *)titles;

-(void)showView;

@end
