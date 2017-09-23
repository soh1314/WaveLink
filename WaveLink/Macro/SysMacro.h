//
//  SysMacro.h
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/7.
//  Copyright © 2017年 trgf. All rights reserved.
//

#ifndef SysMacro_h
#define SysMacro_h


#define kBundleId [[NSBundle mainBundle] bundleIdentifier]
#define kAPPVersion [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAPPBuildNO [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"]
#define kAPPDisplayName [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleDisplayName"];

#endif /* SysMacro_h */
