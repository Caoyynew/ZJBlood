//
//  CustomTextView.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/9.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTextView : UIView<UITextViewDelegate>
{
    UILabel * zjbCountLabel;
}
@property (nonatomic, strong) UITextView * zjbTextView;
@property (nonatomic, strong) UILabel * zjbPlaceHolderLabel;
@property NSInteger strCount;
@end
