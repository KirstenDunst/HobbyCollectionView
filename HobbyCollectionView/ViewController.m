//
//  ViewController.m
//  HobbyCollectionView
//
//  Created by CSX on 2017/3/13.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ViewController.h"
#import "ICHobbyView.h"

@interface ViewController ()

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"个性定制";
    
    ICHobbyView *hobbyView = [[ICHobbyView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:hobbyView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
