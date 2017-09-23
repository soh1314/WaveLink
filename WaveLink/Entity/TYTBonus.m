//
//  TYTBonus.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "TYTBonus.h"
#import "ESDBHelper.h"
@implementation TYTBonusLink

+ (NSString *)textLinkBonusStatus:(NSInteger)status {
    NSArray *redPacketArr = @[@"待领取",@"已领取",@"已失效"];
    NSArray *raffuleTicketArr = @[@"待开奖",@"已开奖",@"已完成"];
    NSArray *couponArr = @[@"待使用",@"已使用",@"已失效"];
    NSString *statusStr = nil;
    if (status == 0) {
        statusStr = [NSString stringWithFormat:@"%@",redPacketArr[status]];
    } else if (status == 1) {
        statusStr = [NSString stringWithFormat:@"%@",raffuleTicketArr[status]];
    } else {
        statusStr = [NSString stringWithFormat:@"%@",couponArr[status]];
    }
    return statusStr;
}

+ (NSString *)textLinkBonus:(TYTBonus *)bonus {
    NSArray *redPacketArr = @[@"待领取",@"已领取",@"已失效"];
    NSArray *raffuleTicketArr = @[@"待开奖",@"已开奖",@"已完成"];
    NSArray *couponArr = @[@"待使用",@"已使用",@"已失效"];
    NSString *statusStr = nil;
    if (bonus.bonusType == 0) {
        statusStr = [NSString stringWithFormat:@"%@",redPacketArr[bonus.bonusStatus]];
    } else if (bonus.bonusType == 1) {
        statusStr = [NSString stringWithFormat:@"%@",raffuleTicketArr[bonus.bonusStatus]];
    } else {
        statusStr = [NSString stringWithFormat:@"%@",couponArr[bonus.bonusStatus]];
    }
    return statusStr;
}

+ (UIColor *)colorLinkBonus:(TYTBonus *)bonus {
    UIColor *color = nil;
    NSArray *colorArr = @[[UIColor colorWithHex:@"#829cfc"],[UIColor colorWithHex:@"#ff9481"],[UIColor colorWithHex:@"#f06b7d"]];

    if (bonus.bonusType == 0) {
        color = colorArr[bonus.bonusStatus];
    } else if (bonus.bonusType == 1) {
        color = colorArr[bonus.bonusStatus];
    } else {
        color = colorArr[bonus.bonusStatus];
    }
    return color;
}

+ (UIColor *)colorLinkBonusStatus:(NSInteger)status {
    UIColor *color = nil;
    NSArray *colorArr = @[[UIColor themeColor],[UIColor colorWithHex:@"#ff9481"],[UIColor colorWithHex:@"#f06b7d"]];
    if (status == 0) {
        color = colorArr[status];
    } else if (status == 1) {
        color = colorArr[status];
    } else {
        color = colorArr[status];
    }
    return color;
}

+ (UIImage *)imageLinkBonus:(TYTBonus *)bonus {
    UIImage *image = nil;
    NSArray *imageUrlArray = @[@"bg_one",@"bg_two",@"bg_three"];
    image = [UIImage qsImageNamed:imageUrlArray[bonus.bonusStatus]];
    return image;
    
}

@end

@implementation TYTBonus

+(NSArray *)constranString {
    return @[@",UNIQUE (bid)"];
}

@end
