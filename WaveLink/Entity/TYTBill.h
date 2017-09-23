//
//  TYTBill.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/11.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface TYTBill : JSONModel

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *createdate;
@property (nonatomic,copy)NSString *expiredate;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *money;

@end
