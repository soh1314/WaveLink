//
//  NSData+EasyDB.m
//  EasyDb
//
//  Created by 刘仰清 on 2017/8/18.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "NSData+EasyDB.h"

@implementation NSData (EasyDB)

+ (NSData *)easyDB_jsonData:(id )object {
    NSData *data = nil;
    data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    return data;
}

@end
