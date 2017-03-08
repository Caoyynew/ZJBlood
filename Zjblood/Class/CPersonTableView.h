//
//  CPersonTableView.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/8.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPersonTableView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property(nonatomic,strong)UITableView *CPersontableView;
@property(nonatomic,strong) NSMutableArray *CPersonDataArray;
//-(instancetype)initWithFrame:(CGRect)frame withDate:(NSDictionary*)dic;

@end
