//
//  RedPacketController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/8.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "RedPacketController.h"
#import "BaseSortController.h"
#import "TYTBonusDataCell.h"
#import "TYTBonus.h"

#import "AdvertisementController.h"
#import "RaffleTicketController.h"
@interface RedPacketController ()<BaseSortControllerProtocal,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)BaseSortController *sortController;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,assign)NSInteger page;
@property (nonatomic,assign)NSInteger countPerPage;

@end

@implementation RedPacketController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self loadNewData];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)initUI {
    self.navbarStyle = TYTBlackNavBarStyle;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.sortController = [[BaseSortController alloc]init];
    self.sortController.titleArray = @[@"全部",@"待领取",@"已领取",@"已失效"];
    self.sortController.coloumCount = 4;
    [self addChildViewController:self.sortController];
    [self.sortController willMoveToParentViewController:self];
    [self.view addSubview:self.sortController.view];
    [self.sortController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(0.0);
    }];
    
}

- (void)loadNewData {
    self.sortController.tableView.delegate = self;
    self.sortController.tableView.dataSource = self;
    self.sortController.sortDelegate = self;
    [self.sortController.tableView registerClass:[TYTBonusDataCell class] forCellReuseIdentifier:[TYTBonusDataCell uniqueID]];
    NSLog(@"模拟数据");
    for (int i  = 20; i < 40; i++) {
        TYTBonus *bonus = [TYTBonus new];
        bonus.bid = i +1;
        bonus.content = [NSString stringWithFormat:@"%d+%@",i,@"36000运动红包"];
        bonus.createdate = @"2017.08.15";
        bonus.bonusType = 0;
        bonus.bonusStatus = i%3;
        [self.dataArray addObject:bonus];
    }
    [self localSave];
    [self.sortController.tableView reloadData];
}

- (void)localSave {
    [TYTBonus clearTable];
    [TYTBonus saveObjects:self.dataArray];
}

- (void)sort:(NSInteger)type {
    NSString *criteria = nil;
    NSArray *sortArray = nil;
    if (type == 0) {
        criteria = [NSString stringWithFormat:@"order by %@ limit %ld offset %d",@"pk",(self.page+1)*10,0];
        sortArray = [TYTBonus findByCriteria:criteria];
        
    } else {
        criteria = [NSString stringWithFormat:@"where bonusStatus = %ld order by %@ desc limit %ld offset %d",type-1,@"pk",(self.page+1)*10,0];
        sortArray = [TYTBonus findByCriteria:criteria];
        
    }
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:sortArray];
    [self.sortController.tableView reloadData];
}

#pragma mark - lazy load

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYTBonusDataCell *cell = [tableView dequeueReusableCellWithIdentifier:[TYTBonusDataCell uniqueID] forIndexPath:indexPath];
    return cell;
}

#pragma mark - tableview delegate and source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60*KRATIO;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    TYTBonus *bonus = self.dataArray[indexPath.row];
    TYTBonusDataCell *bonusCell = (TYTBonusDataCell *)cell;
    [bonusCell setBonus:bonus];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    AdvertisementController *advertise = [AdvertisementController new];
    kNavPushController(advertise, self);

}

#pragma mark - lazy load


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
