//
//  VoiceLockedController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/15.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "VoiceLockedController.h"
#import "GroupShadowTableView.h"
#import "TYTStandardCell.h"
#import "TYTBonus.h"


@interface VoiceLockedController ()<GroupShadowTableViewDelegate,GroupShadowTableViewDataSource>

@property (nonatomic,strong)GroupShadowTableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;


@end

@implementation VoiceLockedController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self loadNewData];
    // Do any additional setup after loading the view from its nib.
}

- (void)initUI {
    
    [self.reLock mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100*KRATIO);
        make.height.mas_equalTo(32*KRATIO);
    }];
    self.reLock.layer.cornerRadius = 16*KRATIO;

}

- (void)loadNewData {
    
    NSMutableArray *redPacketArray = [NSMutableArray array];
    for (int i  = 0; i < 4; i++) {
        TYTBonus *bonus = [TYTBonus new];
        bonus.bid = i +1;
        bonus.content = [NSString stringWithFormat:@"%d+%@",i,@"36000运动红包"];
        bonus.createdate = @"2017.08.15";
        bonus.bonusType = 0;
        bonus.bonusStatus = i%3;
        TYTStandardCellModel *cellModel = [self changeBonusToCellModel:bonus];
        [redPacketArray addObject:cellModel];
    }
    
    NSMutableArray *raffleArray = [NSMutableArray array];
    for (int i  = 0; i < 3; i++) {
        TYTBonus *bonus = [TYTBonus new];
        bonus.bid = i +1;
        bonus.content = [NSString stringWithFormat:@"%d+%@",i,@"36000运动红包"];
        bonus.createdate = @"2017.08.15";
        bonus.bonusType = 0;
        bonus.bonusStatus = i%3;
        TYTStandardCellModel *cellModel = [self changeBonusToCellModel:bonus];
        [redPacketArray addObject:cellModel];
    }
    [self.dataArray addObject:redPacketArray];
    [self.dataArray addObject:raffleArray];

    [self.tableView reloadData];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgTopImageView.mas_bottom).mas_offset(20);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
}


#pragma mark - lazy load

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
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
    return 2;
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
                                       
- (TYTStandardCellModel *)changeBonusToCellModel:(TYTBonus *)bonus {
    TYTStandardCellModel * model = [TYTStandardCellModel new];
    model.subject = bonus.content;
    model.value = @"剩余有效期xxx";
    return model;
}

- (CGFloat)groupShadowTableView:(GroupShadowTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)groupShadowTableView:(GroupShadowTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)relock:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
