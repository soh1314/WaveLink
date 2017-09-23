//
//  Message.h
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ESDBModel.h"

@interface Message : ESDBModel

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *createdate;
@property (nonatomic,copy)NSString *expiredate;
@property (nonatomic,copy)NSString *body;
@property (nonatomic,assign)NSInteger type;
@property (nonatomic,copy)NSString *detailMsg;

@end
