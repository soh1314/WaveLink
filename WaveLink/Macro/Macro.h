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

#define kAppUrl(host,path) [NSString stringWithFormat:@"%@%@",host,path]
#define KWINDOW [UIApplication sharedApplication].delegate.window
#define KSCREENW [UIScreen mainScreen].nativeBounds.size.width/2.0
#define KSCREENH [UIScreen mainScreen].nativeBounds.size.height/2.0
#define KRATIO   KSCREENW/320.0

#define kHomeDir NSHomeDirectory()
#define kDocDir  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#endif /* Macro_h */
