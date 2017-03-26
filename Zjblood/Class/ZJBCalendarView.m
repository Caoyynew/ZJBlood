//
//  ZJBCalendarView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/22.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBCalendarView.h"

@implementation ZJBCalendarView
{
    NSMutableArray *_daysArray;
    //今天的红色圆形半径
    CGFloat btnRadius;
    CGRect rootRect;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    rootRect = frame;
    if (self) {
        _daysArray = [NSMutableArray arrayWithCapacity:42];
        self.backgroundColor = [UIColor whiteColor];
        for (int i = 0; i < 42; i++) {
            UILabel *label = [[UILabel alloc] init];
            [self addSubview:label];
            [_daysArray addObject:label];
        }
    }
    return self;
}
#pragma mark - create View
- (void)setDate:(NSDate *)date{
    
    _date = date;
    
    [self createCalendarViewWith:date];
}
#pragma mark - UI
- (void)createCalendarViewWith:(NSDate *)date{
    
    CGFloat itemWMin     = (self.frame.size.width-20) / 7;
    CGFloat itemH     = self.frame.size.width / 7;
    btnRadius = itemWMin/2;
    
    // 1.year month
    UILabel *headlabel = [[UILabel alloc] init];
    headlabel.text     = [NSString stringWithFormat:@"%li年%li月",[self year:date],[self month:date]];
    headlabel.font     = [UIFont systemFontOfSize:14];
    headlabel.frame           = CGRectMake(30,0,80, itemH);
    headlabel.textAlignment   = NSTextAlignmentCenter;
    [self addSubview:headlabel];
    
    UIButton * rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, itemH)];
    [rightBtn setImage:[UIImage imageNamed:@"xiangzuo"] forState:UIControlStateNormal];
    rightBtn.tag = 102;
    [rightBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightBtn];
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(110, 0, 30, itemH)];
    [leftBtn setImage:[UIImage imageNamed:@"xiangyou"] forState:UIControlStateNormal];
    leftBtn.tag = 103;
    [leftBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    
    // 2.weekday
    NSArray *array = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    UIView *weekBg = [[UIView alloc] init];
    weekBg.backgroundColor = [UIColor whiteColor];
    weekBg.frame = CGRectMake(0, CGRectGetMaxY(headlabel.frame), self.frame.size.width, itemH);
    
    //上边框
    CALayer * topBorder = [CALayer layer];
    topBorder.frame = CGRectMake(0.0f, 0.0f, weekBg.bounds.size.width, 0.5f);
    topBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
    [weekBg.layer addSublayer:topBorder];
    //下边框
    CALayer * bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, (weekBg.bounds.size.height - 0.5), weekBg.bounds.size.width, 0.5);
    bottomBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
    [weekBg.layer addSublayer:bottomBorder];

    [self addSubview:weekBg];
    
    for (int i = 0; i < 7; i++) {
        UILabel *week = [[UILabel alloc] init];
        week.text     = array[i];
        week.font     = [UIFont systemFontOfSize:14];
        week.frame    = CGRectMake(itemWMin * i + 10, 0, itemWMin, itemH);
        week.textAlignment   = NSTextAlignmentCenter;
        week.backgroundColor = [UIColor clearColor];
        week.textColor       = [UIColor blackColor];
        [weekBg addSubview:week];
    }
    
    //  3.days (1-31)
    for (int i = 0; i < 42; i++) {
        
        int x = (i % 7) * itemWMin + 10 ;
        int y = (i / 7) * itemWMin + CGRectGetMaxY(weekBg.frame);
        
        UILabel *dayButton = _daysArray[i];
        dayButton.frame = CGRectMake(x, y, itemWMin, itemWMin);
        dayButton.font = [UIFont systemFontOfSize:14.0];
        dayButton.textAlignment = NSTextAlignmentCenter;
        NSInteger daysInLastMonth = [self totaldaysInMonth:[self lastMonth:date]];
        NSInteger daysInThisMonth = [self totaldaysInMonth:date];
        NSInteger firstWeekday    = [self firstWeekdayInThisMonth:date];
        
        NSInteger day = 0;
        
        NSInteger year = [self year:date];
        NSInteger month;
        
        if (i < firstWeekday) {
            day = daysInLastMonth - firstWeekday + i + 1;
            [self setStyle_BeyondThisMonth:dayButton];
            month = [self month:date]-1;
            if (month<1) {
                month = 12;
            }
        }else if (i > firstWeekday + daysInThisMonth - 1){
            day = i + 1 - firstWeekday - daysInThisMonth;
            [self setStyle_BeyondThisMonth:dayButton];
            month = [self month:date]+1;
            if (month > 12) {
                month = 1;
            }
        }else{
            day = i - firstWeekday + 1;
            [self setStyle_AfterToday:dayButton];
            month = [self month:date];
        }
        dayButton.text = [NSString stringWithFormat:@"%li", day];
        
        // 如果是本月
        if ([self month:date] == [self month:[NSDate date]] && [self year:date] == [self year:[NSDate date]]) {
            
            NSInteger todayIndex = [self day:date] + firstWeekday - 1;
            
            if (i < todayIndex && i >= firstWeekday) {
                [self setStyle_BeforeToday:dayButton];
                
            }else if(i ==  todayIndex){
                [self setStyle_Today:dayButton];
            }
        }
        //TODO:标记的日期
        NSArray * selectArr = [[NSArray alloc]initWithObjects:@"2017-2-4",@"2017-3-6",@"2017-3-7",@"2017-3-8",@"2017-3-9",@"2017-3-11",@"2017-3-12",@"2017-3-14",@"2017-3-15",@"2017-3-16",@"2017-3-20", nil];
//        NSLog(@"日期===%ld-%ld-%ld",(long)year,(long)month,(long)day);
        NSString * configDate = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)year,(long)month,(long)day];
        for (NSString *date in selectArr) {
            if ([configDate isEqualToString:date]) {
                [self setSelectDay:dayButton];
            }
        }
    }
}


#pragma mark - 显示日期的格式

- (void)setStyle_BeyondThisMonth:(UILabel *)btn
{
    btn.textColor = [UIColor lightGrayColor];
}

- (void)setStyle_BeforeToday:(UILabel *)btn
{
    btn.textColor = [UIColor blackColor];
}

- (void)setStyle_Today:(UILabel *)btn
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:btn.text];
    NSRange titleRange = {0,[title length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    btn.attributedText = title;
    btn.textColor = [UIColor whiteColor];
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = btnRadius;
    btn.clipsToBounds = YES;
    btn.transform = CGAffineTransformMakeScale(0.8, 0.8);
    btn.font = [UIFont systemFontOfSize:16];
}

- (void)setStyle_AfterToday:(UILabel *)btn
{
    btn.textColor = [UIColor blackColor];
}
-(void)setSelectDay:(UILabel *)btn
{
    btn.textColor = [UIColor redColor];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:btn.text];
    NSRange titleRange = {0,[title length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    btn.attributedText = title;
//    btn.transform = CGAffineTransformMakeScale(0.8, 0.8);

}

#pragma mark - 日期

- (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}


- (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

- (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}


- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

- (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInOfMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInOfMonth.length;
}

- (NSDate *)lastMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

- (NSDate*)nextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}
#pragma makr - 选择月份
-(void)selectAction:(UIButton *)btn
{
    //清空view数据
    for (UILabel * label in self.subviews) {
        [label removeFromSuperview];
    }
    _daysArray = [NSMutableArray arrayWithCapacity:42];
    for (int i = 0; i < 42; i++) {
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        [_daysArray addObject:label];
    }
    if (btn.tag == 102) {
        NSDate * lastDate =  [self lastMonth:_date];
        self.date = lastDate;
    }
    if (btn.tag == 103) {
        NSDate * nextDate =  [self nextMonth:_date];
        self.date = nextDate;
    }
}

-(void)configDateisSelect:(NSInteger)time
{
    time = 1489035591;
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy/M/d"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSString *confromTimespStr = [formatter stringFromDate:date];
    NSLog(@"date1:%@",confromTimespStr);

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
