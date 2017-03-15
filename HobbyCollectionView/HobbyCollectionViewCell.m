//
//  HobbyCollectionViewCell.m
//  HobbyCollectionView
//
//  Created by CSX on 2017/3/15.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "HobbyCollectionViewCell.h"

@interface HobbyCollectionViewCell ()
{
    UILabel *label;
}
@end

@implementation HobbyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self createViewWithFrame:frame];
    }
    return self;
}

- (void)createViewWithFrame:(CGRect)frame{
    
    label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    label.textAlignment = 1;
    [self addSubview:label];
}

- (void)setTitleStr:(NSString *)titleStr{
    if (![_titleStr isEqualToString:titleStr]) {
        _titleStr = titleStr;
    }
     label.text = _titleStr;
}

- (void)setIsEdit:(BOOL)isEdit{
    if (_isEdit != isEdit) {
        _isEdit = isEdit;
    }
    
    if (_isEdit) {
        label.backgroundColor = [UIColor orangeColor];
        [self setBgColor:[UIColor orangeColor]];
    }else{
        label.backgroundColor = [UIColor grayColor];
        [self setBgColor:[UIColor grayColor]];
    }
}



@end
