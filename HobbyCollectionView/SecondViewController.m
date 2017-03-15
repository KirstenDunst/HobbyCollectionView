//
//  SecondViewController.m
//  HobbyCollectionView
//
//  Created by CSX on 2017/3/15.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "SecondViewController.h"
#import "ICHobbyView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"频道设置";
    
    NSMutableArray *oneArr = [NSMutableArray arrayWithObjects:@"必选",@"甜美",@"街头",@"闺蜜",@"运动", nil];
    NSMutableArray *secondArr = [NSMutableArray arrayWithObjects:@"本土",@"逛街",@"OL",@"休闲",@"高挑",@"优选",@"欧美",@"摩登",@"约会",@"轻熟",@"清新",@"丰满",@"典礼",@"热门",@"复古",@"型男",@"混搭",@"派对",@"出游",@"日韩", nil];
    
    
    ICHobbyView *hobbyView = [[ICHobbyView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andInstilizeTitleArr:@[@[@"已选类型",@"编辑喜好"].copy,@"点击添加更多"].copy andEditTitleArr:@[@[@"已选",@"完成"].copy,@"待选类型"].copy andHobbyArr:@[oneArr,secondArr].mutableCopy AndbackForNewKinds:^(NSString *kinds) {
        self.kind(kinds);
        [self.navigationController popViewControllerAnimated:YES];
    }];
     
    [self.view addSubview:hobbyView];
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
