//
//  VoiceLinkingController.m
//  WaveLink
//
//  Created by 刘仰清 on 2017/8/31.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "VoiceLinkingController.h"
#import "RadarAnimationView.h"

typedef void(^VoiceLinkCallBack)(NSString *url);

@interface VoiceLinkingController ()
@property (nonatomic,strong)RadarAnimationView *radarView;
@end

@implementation VoiceLinkingController


- (id)init {
    if (self = [super init]) {
        self.navbarStyle = TYTWhiteNavBarStyle;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)linking {
    // 启动雷达动画

    // 开启声波链接功能
    [self voiceLinking:^(NSString *url) {
        if (url) {
            VoiceLockedController *lockedController = [VoiceLockedController new];
            [self.navigationController pushViewController:lockedController animated:NO];
        }
    }];
}

- (void)voiceLinking:(VoiceLinkCallBack)callback {
    NSString *url = @"非常";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        callback(url);
    });
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)initUI {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(findNearVoiceAds:)];
    [self.logonImageView addGestureRecognizer:tap];
    self.logonImageView.userInteractionEnabled = YES;
    [self setUIStyle];
    [self massonLayout];
    self.radarView = [[RadarAnimationView alloc]initWithFrame:CGRectMake(0, 118-64, KSCREENW, 200)];
    [self.view addSubview:self.radarView];
    [self.radarView setImage:[UIImage qsImageNamed:@"logo.png"]];
    __weak typeof(self)weakself = self;
    [self.radarView setSelectBlock:^(){
        [weakself.radarView startAnimation];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakself linking];
            [weakself.radarView stopAnimation];
        });
    }];
}

- (void)findNearVoiceAds:(UIGestureRecognizer *)tap {
    [self linking];
}

- (void)setUIStyle {
    self.adsLabel.textColor = [UIColor colorWithHex:@"#54feff"];
    self.ticketLabel.textColor = [UIColor colorWithHex:@"#54feff"];
    self.withDrawLabel.textColor = [UIColor colorWithHex:@"#54feff"];
    self.adsLabel.font = [UIFont systemFontOfSize:24];
    self.ticketLabel.font = [UIFont systemFontOfSize:24];
    self.withDrawLabel.font = [UIFont systemFontOfSize:24];
    
    self.adsNotiLabel.font = [UIFont systemFontOfSize:14];
    self.voucherNotiLabel.font = [UIFont systemFontOfSize:14];
    self.withDrawNotiLabel.font = [UIFont systemFontOfSize:14];
    
}

- (void)massonLayout {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
