//
//  ShadowCell.m
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/11.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "ShadowCell.h"

@implementation ShadowCell

+ (NSString *)uniqueID {
    return [NSString stringWithFormat:@"%@ID",NSStringFromClass(self)];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.layer.shadowOffset=CGSizeMake(0, 1);
//        
//        self.layer.shadowColor= [UIColor grayColor].CGColor;
//        
//        self.layer.shadowRadius= 2;
//        
//        self.layer.shadowOpacity= .5f;
//        
//        CGRect shadowFrame = self.layer.bounds;
//        
//        CGPathRef shadowPath = [UIBezierPath bezierPathWithRect:shadowFrame].CGPath;
//        self.layer.shadowPath= shadowPath;
        
    }
    return self;
}



@end
