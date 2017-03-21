//
//  ZJBHonorOneViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBHonorOneViewController.h"

@interface ZJBHonorOneViewController ()

@end

@implementation ZJBHonorOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = 400;
    if (w<=320) {
        height = 300;
    }else if (w>=414){
        height = 470;
    }
    UITextView * textView = [[UITextView alloc]initWithFrame:CGRectMake(5, 0, zjbWindowW-10, height)];
    textView.font = [UIFont systemFontOfSize:16];
    textView.text = @"[环球网军事3月21日报道 环球时报特约记者 魏云峰 环球时报记者 马俊]美国国务卿蒂勒森18日在结束对韩国的访问后，对媒体讲了一段令人吃惊的言论——“在朝鲜核武器成为迫在眉睫威胁的情况下，美国也许会允许韩日核武装”。众所周知，防止核武器及相关技术扩散是全球共识，美国对朝鲜保持高度警惕的重要原因，就是因为朝鲜的核计划。蒂勒森并没有详细阐述他的这番言论，外界也不知道，他是指美国考虑重新在韩日部署核武器？还是允许这两个亚洲盟友自行拥有核武器？制造核武器，日韩都不难韩国《东亚日报》20日称，蒂勒森在结束对韩国的访问后，在18日前往中国的专机内接受《独立评论》杂志采访时表示，“虽然我们政策的目标是朝鲜半岛无核化，但我们无法预测（朝鲜半岛周边的）未来”，“在朝鲜核武器成为迫在眉睫的威胁的情况下，美国将根据（朝鲜核武器）发展情况，也许会不得不考虑允许韩国与日本的核武装化。”报道认为，这一发言意味着为从军事上遏制朝鲜，美国可能会限制性允许韩国开发核武器。美国总统特朗普去年竞选期间也曾表示“允许韩日拥核”。中国核战略专家杨承军20日告诉《环球时报》记者，凭借先进的技术储备和发达的工业基础，日本和韩国在研制核武器方面并没有太大的阻碍。韩国早在上世纪50年代就曾进行过核武器的研制，尽管后来在美国的压力下被迫叫停，但相关的技术资料仍得以保留。在核材料储备上，韩国拥有十余座核电站，每年都会产生大量的乏燃料。据韩国媒体报道，2000年初，韩国原子能研究所曾暗中进行3次铀浓缩试验，获取的浓缩铀纯度最高达77%。杨承军介绍说，武器级核材料的浓度通常在85%以上，韩国能够自行制造离心机等设备，也掌握了核材料的提纯工艺。有专家认为，一旦放开限制，韩国可在一年内完成核武器的研制。韩联社曾报道，根据美国方面的评估报告，韩国拥有可制造数百枚核弹的钚、核弹头设计技术和高端运载系统构筑能力，5年内就可制造数十枚核弹头。不过相对而言，韩国核材料的储备较少.";
   
    textView.editable = NO;
    [self.view addSubview:textView];
    UIButton * agreenBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100, CGRectMT(textView, 30), 200, 40)];
    agreenBtn.backgroundColor = buttonColor;
    agreenBtn.clipsToBounds=YES;
    agreenBtn.layer.cornerRadius=5;
    [agreenBtn setTitle:@"我同意" forState:UIControlStateNormal];
    [agreenBtn addTarget:self action:@selector(adviceAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:agreenBtn];
}


-(void)ZJBActionBlock1:(ZJBActionBlock1)block
{
    self._block = block;
}

-(void)adviceAction
{
//    NSLog(@"我同意");
    self._block(0);
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
