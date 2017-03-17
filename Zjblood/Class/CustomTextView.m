//
//  CustomTextView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/9.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "CustomTextView.h"

@implementation CustomTextView

-(instancetype)initWithFrame:(CGRect)frame withType:(NSInteger)type
{
    self = [super initWithFrame:frame];
    if (self) {
        self.strCount = type;
        [self createTextView];
    }
    return self;
}
-(void)createTextView
{
    //TextView加个背景框
    UIView *bgView = [[UIView alloc]initWithFrame:self.bounds];
    
    if (_strCount == 200) {
        bgView.layer.borderColor = [tabarColor CGColor];
        bgView.layer.borderWidth = 1.0;
        bgView.layer.cornerRadius = 5.0f;
        [bgView.layer setMasksToBounds:YES];
    }
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];
    
    _zjbTextView = [[UITextView alloc]initWithFrame:CGRectMake(20, 10, self.bounds.size.width-40,self.bounds.size.height-20 )];
    _zjbTextView.delegate = self;
    _zjbTextView.font = [UIFont systemFontOfSize:16];
    
    [bgView addSubview:_zjbTextView];
    
    _zjbPlaceHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(25,_zjbTextView.bounds.size.height/2-5,self.bounds.size.width-50,20)];
    _zjbPlaceHolderLabel.textAlignment = NSTextAlignmentCenter;
    _zjbPlaceHolderLabel.backgroundColor = [UIColor clearColor];
    _zjbPlaceHolderLabel.font = [UIFont systemFontOfSize:14];
    _zjbPlaceHolderLabel.textColor = RGB_COLOR(149, 149, 149, 1.0);
    if (_zjbPlaceHolderLabel.text == nil) {
        _zjbPlaceHolderLabel.text = @"如果符合您的心意,请不要吝啬您的赞美";
    }
    [bgView addSubview:_zjbPlaceHolderLabel];
    
    zjbCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.width-120,self.bounds.size.height-50,100,50)];
    zjbCountLabel.font = [UIFont systemFontOfSize:14];
    zjbCountLabel.textColor = [UIColor grayColor];
    zjbCountLabel.text = [NSString stringWithFormat:@"0/%ld",(long)_strCount];
    zjbCountLabel.textAlignment = NSTextAlignmentRight;
    [bgView addSubview:zjbCountLabel];
}


#pragma mark - UITextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSString * new = [textView.text stringByReplacingCharactersInRange:range withString:text];
    NSInteger res = _strCount - [new length];
    if ([new length] != 0) {
        _zjbPlaceHolderLabel.hidden = YES;
    }else{
        _zjbPlaceHolderLabel.hidden = NO;
    }
    if (res>=0) {
        zjbCountLabel.text = [NSString stringWithFormat:@"%ld/%ld",[new length],(long)_strCount];
        return YES;
    }else{
        return NO;
    }
}
-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length>_strCount) {
        textView.text = [textView.text substringToIndex:_strCount];
    }
}

-(void)textViewDidChangeSelection:(UITextView *)textView
{
    if ([textView.text length] == 0) {
        _zjbPlaceHolderLabel.hidden = NO;
    }else{
        _zjbPlaceHolderLabel.hidden = YES;
    }
    //    NSInteger res = strCount - [textView.text length];
    zjbCountLabel.text = [NSString stringWithFormat:@"%ld/%ld",[textView.text length],(long)_strCount];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
