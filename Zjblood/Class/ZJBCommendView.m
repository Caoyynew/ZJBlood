//
//  ZJBCommendView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/20.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBCommendView.h"
#define  kWidth [UIScreen mainScreen].bounds.size.width
#define  kHeight [UIScreen mainScreen].bounds.size.width
@implementation ZJBCommendView

-(instancetype)initWithFrame:(CGRect)frame nowTitle:(NSString *)title type:(NSInteger)type titleArr:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titlesArr = [NSArray arrayWithArray:titles];
        self.btnType = type;
        self.redTitle = title;

        _window = [UIApplication sharedApplication].keyWindow;

        [_window addSubview:self];
        [self control];

        self.backgroundColor = [UIColor whiteColor];
        self.alpha = 0.0f;
        [self createUIView];
    }
    return self;
}

-(void)createUIView
{
    self.contentView = [[UIView alloc]initWithFrame:self.frame];
    [self addSubview:self.contentView];
    
    for (int i = 0; i <self.titlesArr.count; i++) {
        UILabel * lineLab = [[UILabel alloc]initWithFrame:CGRectMake(15, i*45, self.frame.size.width-30, 1)];
        lineLab.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:lineLab];
        
        UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(15, i*45, self.frame.size.width, 45)];
        titleLab.text = self.titlesArr[i];
        if (self.btnType == 0) {
            titleLab.textAlignment = NSTextAlignmentLeft;
        }else{
            titleLab.textAlignment = NSTextAlignmentRight;
        }
        if ([titleLab.text isEqualToString:self.redTitle]) {
            titleLab.textColor = [UIColor redColor];
        }
        [self.contentView addSubview:titleLab];
    }
}
#pragma mark - 显示动画
-(void)showView
{
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 1.0f;
        self.control.alpha = 0.3f;
        self.contentView.alpha = 1.0f;
    }];
}
- (UIControl *)control
{
    if (!_control) {
        _control = [UIControl new];
        _control.backgroundColor = [UIColor clearColor];
        _control.alpha = 0.0f;
        [self addSubview:_control];
        
        _control.frame = _window.frame;
        [_control addTarget:self action:@selector(clickControl:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _control;
}
-(void)clickControl:(UIControl *)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.frame = CGRectMake(0,0,self.frame.size.width, 0);
        self.control.alpha = 0.0f;
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.contentView removeFromSuperview];
        self.contentView = nil;
    }];

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
////    CGContextRef context = UIGraphicsGetCurrentContext();
////    CGFloat kWidth =  [UIScreen mainScreen].bounds.size.width;
////    CGContextMoveToPoint(context, kWidth-10-20, 40);
////    
////    CGContextAddLineToPoint(context, kWidth-10-20-5, 80);
////    
////    CGContextAddLineToPoint(context, kWidth-10-20+5, 80);
////    
////    CGContextClosePath(context);
////    
////    [[UIColor blackColor] setStroke];
////    
////    [[UIColor blackColor] setFill];
////    
////    CGContextDrawPath(context, kCGPathFillStroke);
//}

@end
