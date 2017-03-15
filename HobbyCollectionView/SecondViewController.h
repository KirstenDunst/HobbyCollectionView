//
//  SecondViewController.h
//  HobbyCollectionView
//
//  Created by CSX on 2017/3/15.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LovelyKinds)(NSString *kinds);

@interface SecondViewController : UIViewController

@property(nonatomic , copy)LovelyKinds kind;

@end
