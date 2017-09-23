//
//  UIViewController+EasyUtil.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZNavigationExtension.h"
#define   kNavPushController(target,source)    target.hidesBottomBarWhenPushed=YES;\
[source.navigationController pushViewController:target animated:YES];\


@interface UIViewController (EasyUtil)

- (NSString *)easyTittle:(NSString *)project;

- (void)addLeftMessageItem;

- (void)setWhiteTrasluntNavBar;

- (void)setBlackNavBar;

- (void)addBackNavItem;

@end
