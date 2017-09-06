//
//  UIImage+base.m
//  TRGFShop
//
//  Created by 刘仰清 on 2017/9/5.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "UIImage+base.h"

@implementation UIImage (base)

+ (UIImage *)qsImageNamed:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    return image;
}

@end
