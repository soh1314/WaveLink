//
//  TYTAnswerCell.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/14.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "TYTAnswerCell.h"

@implementation TYTAdvertisementAnswer



@end

@implementation TYTAnswerCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)setAnswer:(TYTAdvertisementAnswer *)answer {
    _answer = answer;
    self.answerLabel.text = [_answer.answer copy];
    self.fuhaoLabel.text = [_answer.fuhao copy];
}

- (void)initUI {
    [self addSubview:self.dotBtn];
    [self addSubview:self.answerLabel];
    [self addSubview:self.fuhaoLabel];
    [self setUIStyle];
    [self massonLayout];
}

- (void)setUIStyle {
    self.answerLabel.numberOfLines = 0; //多行显示。
    self.answerLabel.font = [UIFont font2];
    self.fuhaoLabel.font = [UIFont font2];
    [self.dotBtn setBackgroundImage:[UIImage qsImageNamed:@"problem_choice_ic"] forState:UIControlStateNormal];
    [self.dotBtn setBackgroundImage:[UIImage qsImageNamed:@"problem_choice_ic_p"] forState:UIControlStateSelected];
    [self.dotBtn addTarget:self action:@selector(selectAnswer:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)massonLayout {
    [self.dotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self).mas_offset(KCELLLEFTPADDING);
        make.width.height.mas_equalTo(15);
    }];
    [self.answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self.fuhaoLabel.mas_right).mas_offset(KCELLLEFTPADDING);
    }];
    [self.fuhaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self.dotBtn.mas_right).mas_offset(KCELLLEFTPADDING);
    }];
    
}

- (void)selectAnswer:(id)sender {
    self.dotBtn.selected = !self.dotBtn.selected;
    if (self.dotAction) {
        self.dotAction(self.answer.fuhao);
    }
}

#pragma mark - lazy load

- (UIButton *)dotBtn {
    if (!_dotBtn) {
        _dotBtn = [UIButton new];
    }
    return _dotBtn;
}

- (UILabel *)fuhaoLabel{
    if (!_fuhaoLabel) {
        _fuhaoLabel = [UILabel new];
    }
    return _fuhaoLabel;
}

- (UILabel *)answerLabel {
    if (!_answerLabel) {
        _answerLabel = [UILabel new];
    }
    return _answerLabel;
}

@end
