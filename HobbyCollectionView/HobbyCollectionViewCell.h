//
//  HobbyCollectionViewCell.h
//  HobbyCollectionView
//
//  Created by CSX on 2017/3/15.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HobbyCollectionViewCell : UICollectionViewCell

@property(nonatomic , copy)NSString *titleStr;
@property(nonatomic , assign)BOOL isEdit;
@property(nonatomic , strong)UIColor *bgColor;

@end
