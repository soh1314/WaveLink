//
//  TYTStandardCell.m
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/7.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "TYTStandardCell.h"
#define kleftpadding 15

@implementation TYTStandardCellModel

- (id)initWithSubject:(NSString *)subject value:(NSString *)value imageUrl:(NSString *)url {
    if (self = [super init]) {
        _subject = [subject copy];
        _value = [value copy];
        _imageUrl = [url copy];
    }
    return self;
}

@end

@implementation TYTStandardCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.leftImg];
    [self addSubview:self.subjectLabel];
    [self addSubview:self.value];
    [self setUIStyle];
    [self masonLayout];
}

- (void)setModel:(TYTStandardCellModel *)model {
    if (model.imageUrl) {
        self.leftImg.hidden = NO;
        self.leftImg.image = [UIImage qsImageNamed:model.imageUrl];
    } else {
        self.leftImg.hidden = YES;
    }
    
    self.subjectLabel.text = model.subject;
    if (model.value && model.value.length > 0) {
        self.value.text = [NSString stringWithFormat:@"%@条未读",model.value];
        self.value.hidden = NO;
    } else {
        self.value.hidden = YES;
    }
}

- (void)setUIStyle {
    self.value.textColor = [UIColor lightGrayColor];
    self.value.font = [UIFont font2];
    self.subjectLabel.font = [UIFont font3];
}

- (void)masonLayout {
    [self.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self.mas_left).mas_equalTo(kleftpadding);
        
    }];
    [self.subjectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImg.mas_right).mas_offset(0.1);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.value mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(-30*KRATIO);
        make.centerY.mas_equalTo(self);
    }];
}


#pragma mark - lazy load
- (UIImageView *)leftImg {
    if (!_leftImg) {
        _leftImg = [[UIImageView alloc]init];
    }
    return _leftImg;
}

- (UILabel *)subjectLabel {
    if (!_subjectLabel) {
        _subjectLabel = [[UILabel alloc]init];
    }
    return _subjectLabel;
}

- (UILabel *)value {
    if (!_value) {
        _value = [[UILabel alloc]init];
        _value.textAlignment = NSTextAlignmentRight;
    }
    return _value;
}

@end
