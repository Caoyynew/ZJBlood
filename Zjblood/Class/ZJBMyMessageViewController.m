//
//  ZJBMyMessageViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/8.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBMyMessageViewController.h"
#import "ZJBDynamicTableViewCell.h"
#import "ZJBDynamic2TableViewCell.h"
@interface ZJBMyMessageViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * dynamicTableView;
    NSInteger type;
}
@end

@implementation ZJBMyMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dynamicTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:dynamicTableView];
    dynamicTableView.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    dynamicTableView.delegate = self;
    dynamicTableView.dataSource = self;
    dynamicTableView.tableFooterView = [[UIView alloc]init];
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==1) {
        return 2;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 190.0f;
    }else{
        return 90.0f;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else{
        return 15.0f;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = @"adada";
    if (indexPath.section == 0) {
        UIImageView * logo = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 20, 20)];
        logo.image = [UIImage imageNamed:@"huodong"];
        
        UILabel * title = [[UILabel alloc]init];
        title.text = @"无偿献血,有奖竞答";
        UIFont *fnt = [UIFont fontWithName:@"HelveticaNeue" size:17.0f];
        title.font = fnt;
        CGFloat nameW = [self configUISizeWithStr:title.text font:title.font];
        title.frame = CGRectMake(CGRectML(logo, 15), 10, nameW, 20);
        
        UILabel * new = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(title, 10), 10, 60, 20)];
        new.text = @"NEW~";
        new.font = [UIFont systemFontOfSize:15];
        new.textColor = [UIColor redColor];
        UIImageView * picIV = [[UIImageView alloc]initWithFrame:CGRectMake(15, 45, zjbWindowW-30, 130)];
        picIV.image = [UIImage imageNamed:@"picmessage"];
        
        [cell addSubview:logo];
        [cell addSubview:title];
        [cell addSubview:new];
        [cell addSubview:picIV];
    }
    
    if (indexPath.section ==1) {
        type = indexPath.row;
        if (type == 0) {
            UINib * nib;
            static NSString *identy = @"ZJBDynamicTableViewCell";
            if (!nib) {
                nib = [UINib nibWithNibName:@"ZJBDynamicTableViewCell" bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:identy];
            }
            ZJBDynamicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identy];
            return cell;
        }else{
            UINib * nib;
            static NSString *identy = @"ZJBDynamic2TableViewCell";
            if (!nib) {
                nib = [UINib nibWithNibName:@"ZJBDynamic2TableViewCell" bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:identy];
            }
            ZJBDynamic2TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identy];
            return cell;
        }
    }
    return cell;
}
#pragma mark - 根据标题计算控件大小
- (CGFloat)configUISizeWithStr:(NSString *)str font:(UIFont *)fnt
{
     CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil]];
    CGFloat w = size.width;
    return w;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
