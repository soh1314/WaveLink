//
//  TYTBonus.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ESDBModel.h"

@class TYTBonus;
@interface TYTBonusLink : NSObject

+ (NSString *)textLinkBonusStatus:(NSInteger)status;
+ (NSString *)textLinkBonus:(TYTBonus *)bonus;

+ (UIColor *)colorLinkBonus:(TYTBonus *)bonus;
+ (UIColor *)colorLinkBonusStatus:(NSInteger)status;

+ (UIImage *)imageLinkBonus:(TYTBonus *)bonus;

@end

@interface TYTBonus : ESDBModel

@property (nonatomic,assign)NSInteger bid;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)NSInteger bonusType;
@property (nonatomic,assign)NSInteger bonusStatus;
@property (nonatomic,copy)NSString *createdate;
@property (nonatomic,copy)NSString *expiredate;
@property (nonatomic,copy)NSString *content;


@end
