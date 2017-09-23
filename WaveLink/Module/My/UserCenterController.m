//
//  UserCenterController.m
//  TRGFShop
//
//  Created by 刘仰清 on 2017/9/4.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "UserCenterController.h"
#import "TYTStandardCell.h"
#import "TYTHeaderCell.h"

#import "RedPacketController.h"
#import "RaffleTicketController.h"
#import "CouponController.h"
#import "FootPrintController.h"
#import "MessageController.h"
#import "WalletController.h"
#import "SettingController.h"
#import "GetCouponController.h"
#import "GetRedPacketController.h"


#import "GroupShadowTableView.h"

@interface UserCenterController ()<UITableViewDelegate,UITableViewDataSource,GroupShadowTableViewDelegate, GroupShadowTableViewDataSource>

@property (nonatomic,strong)GroupShadowTableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UIImageView *headerView;
@property (nonatomic,strong)UIImageView *avartarView;
@property (nonatomic,strong)UILabel *nickNameLabel;
@property (nonatomic,assign)NSInteger unreadMsgCount;
@property (nonatomic,copy)NSDictionary *userInfo;

@end

@implementation UserCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self loadData];
    // Do any additional setup after loading the view.
}

- (void)initUI {
    self.navbarStyle = TYTWhiteNavBarStyle;
    [self addLeftMessageItem];
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.avartarView];
    [self.headerView addSubview:self.nickNameLabel];
    [self.view addSubview:self.tableView];
    
    [self masonLayout];
    [self setUIStyle];
}

- (void)setUIStyle {
    self.headerView.image = [UIImage qsAutoImageNamed:@"bg"];
    self.nickNameLabel.text = @"鱼大胖子";
    self.nickNameLabel.textColor = [UIColor whiteColor];
    self.nickNameLabel.font = [UIFont font3];
    self.avartarView.image = [UIImage imageNamed:@"me_news_ic"];
    self.avartarView.clipsToBounds  = YES;
    self.avartarView.layer.cornerRadius = 86/2.0;
    self.avartarView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.avartarView.layer.borderWidth = 4.0;
}

- (void)masonLayout {
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(0.0);
        make.height.mas_equalTo(180*KRATIO);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(0);
        make.right.mas_equalTo(self.view.mas_right).mas_equalTo(0);
        make.top.mas_equalTo(self.headerView.mas_bottom);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    [self.avartarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerView).mas_offset(45*KRATIO);
        make.centerX.mas_equalTo(self.headerView);
        make.width.height.mas_equalTo(86);
    }];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.avartarView.mas_bottom).mas_offset(10.0);
        make.centerX.mas_equalTo(self.headerView);
    }];
}

- (void)loadData {
    
    [NSString stringWithFormat:@"%ld",self.unreadMsgCount];
    
    TYTStandardCellModel *model1 = [[TYTStandardCellModel alloc]initWithSubject:@"我的钱包" value:@"" imageUrl:@"me_mybag_icon"];
    TYTStandardCellModel *model2 = [[TYTStandardCellModel alloc]initWithSubject:@"我的足迹" value:KINT2STR(self.unreadMsgCount) imageUrl:@"me_foot_ic"];
    TYTStandardCellModel *model3 = [[TYTStandardCellModel alloc]initWithSubject:@"我的消息" value:@"" imageUrl:@"me_news_ic"];
    NSArray *section1 = @[model1,model2,model3];
    
    TYTStandardCellModel *model4 = [[TYTStandardCellModel alloc]initWithSubject:@"我的红包" value:@"" imageUrl:@"me_redbag_ic"];
    TYTStandardCellModel *model5 = [[TYTStandardCellModel alloc]initWithSubject:@"我的抽奖券" value:@"" imageUrl:@"me_quan_ic"];
    TYTStandardCellModel *model6 = [[TYTStandardCellModel alloc]initWithSubject:@"我的优惠券" value:@"" imageUrl:@"me_youhui_ic"];
    NSArray *section2 = @[model4,model5,model6];
    
    TYTStandardCellModel *model7 = [[TYTStandardCellModel alloc]initWithSubject:@"设置" value:@"" imageUrl:@"me_setup_ic"];
    NSArray *section3 = @[model7];
    [self.dataArray addObject:section1];
    [self.dataArray addObject:section2];
    [self.dataArray addObject:section3];
}

#pragma mark - lazy load
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UIImageView *)headerView {
    if (!_headerView) {
        _headerView = [UIImageView new];
    }
    return _headerView;
}

- (UIImageView *)avartarView {
    if (!_avartarView) {
        _avartarView = [UIImageView new];
    }
    return _avartarView;
}

- (UILabel *)nickNameLabel {
    if (!_nickNameLabel) {
        _nickNameLabel = [UILabel new];
    }
    return _nickNameLabel;
}

- (GroupShadowTableView *)tableView {
    if (!_tableView) {
        self.tableView = [[GroupShadowTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        self.tableView.groupShadowDelegate = self;
        _tableView.groupShadowDataSource = self;
        _tableView.showSeparator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        self.tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[TYTStandardCell class] forCellReuseIdentifier:[TYTStandardCell uniqueID]];
    }
    return _tableView;
}

#pragma mark delegate datasource
- (NSInteger)numberOfSectionsInGroupShadowTableView:(GroupShadowTableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)groupShadowTableView:(GroupShadowTableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count];
}

- (UITableViewCell *)groupShadowTableView:(GroupShadowTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYTStandardCell *cell = [tableView dequeueReusableCellWithIdentifier:[TYTStandardCell uniqueID]];
    TYTStandardCellModel *model = self.dataArray[indexPath.section][indexPath.row];
    [cell setModel:model];
    return cell;
}

- (CGFloat)groupShadowTableView:(GroupShadowTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)groupShadowTableView:(GroupShadowTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        WalletController *wallet = [WalletController new];
        wallet.jz_navigationBarTintColor = [UIColor whiteColor];
        wallet.jz_wantsNavigationBarVisible = YES;
        wallet.jz_navigationBarBackgroundAlpha = 1.0;
        kNavPushController(wallet,self);
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        FootPrintController *footprint = [FootPrintController new];
        kNavPushController(footprint,self);
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        MessageController *message = [MessageController new];
        kNavPushController(message,self);
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        RedPacketController *redPacket = [RedPacketController new];
        kNavPushController(redPacket,self);
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        RaffleTicketController *ruffleTicket = [RaffleTicketController new];
        kNavPushController(ruffleTicket,self);
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        CouponController *coupon = [CouponController new];
        kNavPushController(coupon,self);
    } else if (indexPath.section == 2 )
    {
        SettingController *setting = [SettingController new];
        kNavPushController(setting,self);
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
