//
//  RadarAnimationView.m
//  颜色渐变Demo
//
//  Created by 时双齐 on 16/5/13.
//  Copyright © 2016年 亿信互联. All rights reserved.
//

static const float timeinterval = 0.5;

#import <QuartzCore/QuartzCore.h>
#import "RadarAnimationView.h"

@interface RadarAnimationView ()
//按钮图片
@property (nonatomic,strong)UIButton *iamgeBtn;
@property (nonatomic,strong)CAAnimationGroup *group;
@property (nonatomic,strong)CAShapeLayer *shapeLayer;

@end

@implementation RadarAnimationView

- (void)drawRect:(CGRect)rect {

    self.alpha = 1;
    //
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _iamgeBtn = [[UIButton alloc]initWithFrame:self.bounds];
        [_iamgeBtn addTarget:self action:@selector(imageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_iamgeBtn];
        self.backgroundColor = [UIColor clearColor];
        //设置默认波纹颜色
        self.raderColor = [UIColor themeRedColor];
    }
    return self;
}

- (void)startAnimation {
    _isAnimation = YES;
    for (int i = 0; i < 3; i++) {
        [self addAnimationDelay:i];
    }
}

- (void)stopAnimation {
    _isAnimation = NO;
    [self.layer removeAllAnimations];
}

//按钮点击事件
-(void)imageBtnClick:(UIButton *)btn
{
    if (_isAnimation) {
        return;
    }
    self.selectBlock();
}

//重写setter方法
-(void)setImage:(UIImage *)image
{
    _image = image;
    [self.iamgeBtn setImage:image forState:0];
}

-(void)setSelectImage:(UIImage *)selectImage
{
    _selectImage = selectImage;
    [self.iamgeBtn setImage:selectImage forState:1];
}

-(void)setRaderColor:(UIColor *)raderColor
{
    _raderColor = raderColor;
}


//画雷达圆圈图
-(void)addAnimationDelay:(int)time
{
    CGPoint centerPoint = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    //使用贝塞尔画圆
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:30 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = self.bounds;
    self.shapeLayer.fillColor = self.raderColor.CGColor;
    self.shapeLayer.opacity = 0.2;
//    self.shapeLayer.path = path.CGPath;
    
    [self.layer insertSublayer:self.shapeLayer below:self.iamgeBtn.layer];
    
    //雷达圈圈大小的动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"path";
    CGPoint center = CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2 );
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:50 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center radius:200 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    basicAnimation.fromValue = (__bridge id _Nullable)(path1.CGPath);
    basicAnimation.toValue = (__bridge id _Nullable)(path2.CGPath);
    basicAnimation.fillMode = kCAFillModeForwards;
    
    
    //雷达圈圈的透明度
    CABasicAnimation *opacityAnimation = [CABasicAnimation animation];
    opacityAnimation.keyPath = @"opacity";
    
    opacityAnimation.fromValue = @(0.1);
    opacityAnimation.toValue = @(0);
    opacityAnimation.fillMode = kCAFillModeForwards;
    
    self.group = [CAAnimationGroup animation];
    self.group.animations = @[basicAnimation,opacityAnimation];
    
    //动画间隔时间  这里的值和创建的动画个数需要计算好，避免最后一轮动画结束了，第一个动画好没有结束，出现效果差
    self.group.duration = 2;
    //动画开始时间
    self.group.beginTime = CACurrentMediaTime() + (double)time/2;
    
    //循环次数最大（无尽）  HUGE
    self.group.repeatCount = HUGE;
    
    self.group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    //指定的时间段完成后,动画就自动的从层上移除
    self.group.removedOnCompletion = YES;
    //添加动画到layer
    [self.shapeLayer addAnimation:self.group forKey:nil];
    
}



@end
