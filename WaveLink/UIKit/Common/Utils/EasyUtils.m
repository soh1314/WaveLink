//
//  EasyUtils.m
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/12.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "EasyUtils.h"

@implementation EasyUtils

+ (BOOL)noDuplicateCreateFile:(NSString *)fileName {
    if ([[NSFileManager defaultManager]fileExistsAtPath:fileName]) {
        BOOL res = [[NSFileManager defaultManager]removeItemAtPath:fileName error:nil];
        return res;
    } else {
        BOOL res = [[NSFileManager defaultManager]createFileAtPath:fileName contents:nil attributes:nil];
        return res;
    }
}

@end
