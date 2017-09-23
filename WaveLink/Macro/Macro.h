//
//  Macro.h
//  TRGFShop
//
//  Created by 刘仰清 on 2017/9/4.
//  Copyright © 2017年 trgf. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

// 常用宏
#ifdef DEBUG
# define DLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif

//ui
#define KWINDOW [UIApplication sharedApplication].delegate.window
#define KSCREENW [UIScreen mainScreen].bounds.size.width
#define KSCREENH [UIScreen mainScreen].bounds.size.height
#define KRATIO   KSCREENW/360.0
#define KSCREENSCALE [UIScreen mainScreen].scale
#define KNAVBARHEIGHT 64
/**  *  1 判断是否为3.5inch      320*480  */
#define ONESCREEN ([UIScreen mainScreen].bounds.size.height == 480)
/**  *  2 判断是否为4inch        640*1136  */
#define TWOSCREEN ([UIScreen mainScreen].bounds.size.height == 568)
/**  *  3 判断是否为4.7inch   375*667   750*1334  */
#define THREESCREEN ([UIScreen mainScreen].bounds.size.height == 667)
/**  *  4 判断是否为5.5inch   414*1104   1242*2208  */
#define FOURSCREEN ([UIScreen mainScreen].bounds.size.height == 1104)

#define IPHONE4OR4S ONESCREEN
#define IPHONE5OR5S TWOSCREEN
#define IPHONE6OR6S FOURSCREEN

#import "UIFont+Util.h"
#import "UIViewController+EasyUtil.h"

#define KCELLLEFTPADDING 15

//util
#define kAppUrl(host,path) [NSString stringWithFormat:@"%@%@",host,path]
#define KINT2STR(a)  [NSString stringWithFormat:@"%ld",a]
#define kHomeDir NSHomeDirectory()
#define kDocDir  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//sys
#import "SysMacro.h"

#endif /* Macro_h */
