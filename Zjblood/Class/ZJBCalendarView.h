//
//  ZJBCalendarView.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/22.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJBCalendarView : UIView

- (void)createCalendarViewWith:(NSDate *)date;
- (NSDate *)nextMonth:(NSDate *)date;
- (NSDate *)lastMonth:(NSDate *)date;

@property (nonatomic, strong) NSDate *date;
@end
