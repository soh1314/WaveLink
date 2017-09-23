//
//  BaseViewController.h
//  TRGFShop
//
//  Created by 刘仰清 on 2017/9/5.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, TYTNavBarStyle) {
    TYTWhiteNavBarStyle = 0  ,
    TYTBlackNavBarStyle
};

@interface BaseViewController : UIViewController

@property (nonatomic,assign)TYTNavBarStyle navbarStyle;

@end
