//
//  TYTStandardCell.h
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/7.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "ShadowCell.h"

@interface TYTStandardCellModel : NSObject

@property (nonatomic,copy)NSString *subject;
@property (nonatomic,copy)NSString *value;
@property (nonatomic,copy)NSString *imageUrl;
@property (nonatomic,assign)BOOL hideArrow;

- (id)initWithSubject:(NSString *)subject value:(NSString *)value imageUrl:(NSString *)url;

@end

@interface TYTStandardCell : ShadowCell

@property (nonatomic,strong)UIImageView *leftImg;
@property (nonatomic,strong)UILabel *subjectLabel;
@property (nonatomic,strong)UILabel *value;
@property (nonatomic,strong)TYTStandardCellModel *model;

- (void)setModel:(TYTStandardCellModel *)model;

@end
