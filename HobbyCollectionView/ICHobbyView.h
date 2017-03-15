//
//  ICHobbyView.h
//  HobbyCollectionView
//
//  Created by CSX on 2017/3/14.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KindsChooseBlock)(NSString *kinds);

@interface ICHobbyView : UIView

@property(nonatomic , copy)KindsChooseBlock kindsBlock;

/*  初始化方法        返回点击选中的类型
 @param  frame                坐标尺寸大小
 @param  instailze_titleArr   初始显示标题数组
 @param  edit_titleArr        编辑状态显示的标题数组
 @param  hobbyArr             所有的可选类型数组组合  二级数组形式
 */


- (instancetype)initWithFrame:(CGRect)frame andInstilizeTitleArr:(NSMutableArray *)instailze_titleArr andEditTitleArr:(NSMutableArray *)edit_titleArr andHobbyArr:(NSMutableArray *)hobbyArr AndbackForNewKinds:(KindsChooseBlock)block;


@end
