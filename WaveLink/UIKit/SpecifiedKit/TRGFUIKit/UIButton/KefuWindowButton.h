//
//  KefuWindowButton.h
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KefuBtnActionBlock)();

@interface KefuWindowButton : UIButton

@property (nonatomic,copy)NSString *imageUrl;
@property (nonatomic,weak)UIViewController *sourceController;
@property (nonatomic,copy)KefuBtnActionBlock action;

- (instancetype)initWithImage:(NSString *)imageUrl frame:(CGRect )frame action:(KefuBtnActionBlock)action;

@end
