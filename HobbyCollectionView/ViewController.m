//
//  ViewController.m
//  HobbyCollectionView
//
//  Created by CSX on 2017/3/13.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic , strong)NSMutableDictionary *dataDic;

@end
@implementation ViewController


- (NSMutableDictionary *)dataDic{
    if (!_dataDic) {
      NSMutableArray *oneArr = [NSMutableArray arrayWithObjects:@"娇小",@"甜美",@"街头",@"闺蜜",@"运动", nil];
        NSMutableArray *secondArr = [NSMutableArray arrayWithObjects:@"本土",@"逛街",@"OL",@"休闲",@"高挑",@"优选",@"欧美",@"摩登",@"约会",@"轻熟",@"清新",@"丰满",@"典礼",@"热门",@"复古",@"型男",@"混搭",@"派对",@"出游",@"日韩", nil];
        _dataDic = @{@"已选":oneArr,@"添加更多":secondArr}.mutableCopy;
    }
    return _dataDic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createCollectionView];

}
- (void)createCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) collectionViewLayout:layout];
    collection.backgroundColor = [UIColor lightGrayColor];
    collection.delegate = self;
    collection.dataSource = self;
    [self.view addSubview:collection];
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellContent"];
    [collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [[self.dataDic allKeys] count];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        NSMutableArray *tempDic = self.dataDic[@"已选"];
        return  tempDic.count;
    }
    //
    NSMutableArray *tempDic = self.dataDic[@"添加更多"];
    return tempDic.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(0, 50);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(50, 25);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellContent" forIndexPath:indexPath];
    UIButton *myCreateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myCreateButton.frame = CGRectMake(0, 0, 50, 25);
    [myCreateButton setBackgroundColor:[UIColor grayColor]];
    NSMutableArray *tempArr;
    if (indexPath.section == 0) {
        tempArr = self.dataDic[@"已选"];
    }else{
        tempArr = self.dataDic[@"添加更多"];
    }
    [myCreateButton setTitle:tempArr[indexPath.row] forState:UIControlStateNormal];
    myCreateButton.userInteractionEnabled = NO;
    [myCreateButton addTarget:self action:@selector(buttonChoose:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:myCreateButton];
    return cell;
}

- (void)buttonChoose:(UIButton *)sender{
    //选择处理做移除
//    [self.oneContentArray removeObject:sender.currentTitle];
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
//    UILabel *label = [[UILabel alloc]init];
//    label.frame = CGRectMake(0, 10, view.frame.size.width-20, view.frame.size.height);
//    [view addSubview:label];
    NSString *str;
    if (indexPath.section == 0) {
        str = @"已选";
    }else{
        str = @"添加更多";
    }
    [str drawInRect:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height) withAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]}];
    return view;
}

-  (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        NSMutableArray *tempArr = self.dataDic[@"添加更多"];
        NSMutableArray *temArr = self.dataDic[@"已选"];
        NSString *str = tempArr[indexPath.row];
        [tempArr removeObject:str];
        [temArr addObject:str];
        [self.dataDic setValue:tempArr forKey:@"添加更多"];
        [self.dataDic setValue:temArr forKey:@"已选"];
    }
   
    [collectionView reloadData];
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
