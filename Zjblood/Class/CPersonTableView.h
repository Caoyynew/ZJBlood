//
//  CPersonTableView.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/8.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 子视图通知控制器操作代理
 */
@protocol ZJBPushViewControllerDelegate2<NSObject>

-(void)ZJBPushViewControllerWithTitle2;

@end
@interface CPersonTableView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property(nonatomic,strong)UITableView *CPersontableView;
@property(nonatomic,strong) NSMutableArray *CPersonDataArray;

@property (nonatomic ,weak)id <ZJBPushViewControllerDelegate2>delegate;

//-(instancetype)initWithFrame:(CGRect)frame withDate:(NSDictionary*)dic;

@end
