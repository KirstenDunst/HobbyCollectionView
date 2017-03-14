//
//  ViewController.m
//  HobbyCollectionView
//
//  Created by CSX on 2017/3/13.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    BOOL isEidt;
    UICollectionView *collection;
}
@property(nonatomic , strong)NSMutableArray *dataArr;
@property(nonatomic , strong)NSArray *titleArrOne;
@property(nonatomic , strong)NSArray *titleArrSecond;

@end
@implementation ViewController

typedef enum :NSInteger{
    labelTag = 10,
    buttonTag = 20,
}tags;

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
      NSMutableArray *oneArr = [NSMutableArray arrayWithObjects:@"娇小",@"甜美",@"街头",@"闺蜜",@"运动", nil];
        NSMutableArray *secondArr = [NSMutableArray arrayWithObjects:@"本土",@"逛街",@"OL",@"休闲",@"高挑",@"优选",@"欧美",@"摩登",@"约会",@"轻熟",@"清新",@"丰满",@"典礼",@"热门",@"复古",@"型男",@"混搭",@"派对",@"出游",@"日韩", nil];
        _dataArr = @[oneArr,secondArr].mutableCopy;
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.titleArrOne = @[@[@"已选类型",@"编辑"].copy,@"点击添加更多"].copy;
    self.titleArrSecond = @[@[@"已选",@"完成"].copy,@"待选类型"].copy;
    isEidt = NO;
    
    [self createCollectionView];

}
- (void)createCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) collectionViewLayout:layout];
    collection.backgroundColor = [UIColor lightGrayColor];
    collection.delegate = self;
    collection.dataSource = self;
    [self.view addSubview:collection];
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellContent"];
    [collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArr.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  [self.dataArr[section] count];
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
    [myCreateButton setTitle: self.dataArr[indexPath.section][indexPath.row] forState:UIControlStateNormal];
    myCreateButton.userInteractionEnabled = NO;
    if (!isEidt) {
        [myCreateButton setBackgroundColor:[UIColor grayColor]];
    }else{
        if (indexPath.section == 0) {
            [myCreateButton setBackgroundColor:[UIColor orangeColor]];
        }else{
            [myCreateButton setBackgroundColor:[UIColor grayColor]];
        }
    }
    [cell.contentView addSubview:myCreateButton];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
    UILabel *label = [view viewWithTag:labelTag];
    if (!label) {
        label = [[UILabel alloc]init];
        label.frame = CGRectMake(0, 0, view.frame.size.width/2, view.frame.size.height);
        label.textColor = [UIColor grayColor];
        label.tag = labelTag;
        [view addSubview:label];
    }
    //头显示
    if (indexPath.section == 0) {
        label.text = isEidt? [self.titleArrSecond[0] firstObject]:[self.titleArrOne[0] firstObject];
    }else{
        label.text = isEidt? [self.titleArrSecond lastObject]:[self.titleArrOne lastObject];
    }
    
    
    UIButton *myCreateButton = [view viewWithTag:buttonTag];
    if (!myCreateButton) {
        myCreateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        myCreateButton.frame = CGRectMake(view.frame.size.width/2, 0, view.frame.size.width/2, view.frame.size.height);
        [myCreateButton addTarget:self action:@selector(buttonCh:) forControlEvents:UIControlEventTouchUpInside];
        myCreateButton.tag = buttonTag;
        [view addSubview:myCreateButton];
    }
    //添加编辑按钮
    if (indexPath.section == 0) {
        NSString *str = isEidt? [self.titleArrSecond[0] lastObject]:[self.titleArrOne[0] lastObject];
        [myCreateButton setTitle:str forState:UIControlStateNormal];
        [myCreateButton setBackgroundColor:[UIColor grayColor]];
    }else{
        [myCreateButton setTitle:@"" forState:UIControlStateNormal];
        [myCreateButton setBackgroundColor:[UIColor clearColor]];
    }
    
    return view;
}

-  (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        [self.dataArr[0] addObject:self.dataArr[1][indexPath.row]];
         [self.dataArr[1] removeObject:self.dataArr[1][indexPath.row]];
        [collectionView moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:[self.dataArr[0] count]-1 inSection:0]];
    }else{
        if (isEidt) {
            [self.dataArr[1] addObject:self.dataArr[0][indexPath.row]];
            [self.dataArr[0] removeObject:self.dataArr[0][indexPath.row]];
            [collectionView moveItemAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:[self.dataArr[1] count]-1 inSection:1]];
        }
    }
}
- (void)buttonCh:(UIButton *)sender{
    isEidt = !isEidt;
    [collection reloadData];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
