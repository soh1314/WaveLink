//
//  AdvertisementController.m
//  WaveLink
//
//  Created by yangqing Liu on 2017/9/13.
//  Copyright © 2017年 HearMe. All rights reserved.
//

#import "AdvertisementController.h"
#import "AdvertiseResultController.h"
#import "GetRedPacketController.h"
#import "TYTAnswerCell.h"

@interface AdvertisementController ()<UIWebViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)UILabel *questionLabel;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation AdvertisementController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed=YES;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
    [self initUI];
    [self loadNewData];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadNewData {
    TYTAdvertisementAnswer *answer1 = [TYTAdvertisementAnswer new];
    answer1.answer = @"贾宝玉";
    answer1.fuhao = @"A";
    TYTAdvertisementAnswer *answer2 = [TYTAdvertisementAnswer new];
    answer2.answer = @"李表演";
    answer2.fuhao = @"B";
    TYTAdvertisementAnswer *answer3 = [TYTAdvertisementAnswer new];
    answer3.answer = @"王大胖";
    answer3.fuhao = @"C";
    TYTAdvertisementAnswer *answer4 = [TYTAdvertisementAnswer new];
    answer4.answer = @"习老爷";
    answer4.fuhao = @"D";
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:@[answer1,answer2,answer3,answer4]];
    [self.collectionView reloadData];
}

#pragma mark - webview delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

#pragma mark - collection delegate datasource

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选择了哪个答案:%ld",indexPath.row);
    AdvertiseResultController *resultController = [AdvertiseResultController new];
    kNavPushController(resultController, self);

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TYTAnswerCell *answerCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TYTAnswerCellID" forIndexPath:indexPath];
    TYTAdvertisementAnswer *answer = self.dataArray[indexPath.row];
    [answerCell setAnswer:answer];
    __weak typeof(self)weakself = self;
    [answerCell setDotAction:^(NSString *index){

        
    }];
    
    return answerCell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(KSCREENW/2.0-10, 30*KRATIO);
    
}

//调节每个item的edgeInsets代理方法
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)initUI {
    self.navbarStyle = TYTBlackNavBarStyle;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.questionBgView addSubview:self.collectionView];
    [self.questionBgView addSubview:self.questionLabel];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self massonLayout];
    [self setUIStyle];
}

- (void)massonLayout {
    self.webviewHeight.constant *= KRATIO;
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.mas_equalTo(self.questionBgView);
       
//        make.height.mas_equalTo(120*KRATIO);
    }];
    [self.questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.questionBgView);
        make.left.mas_equalTo(self.questionBgView).mas_offset(KCELLLEFTPADDING);
        make.top.mas_equalTo(self.questionBgView).mas_offset(10);
        make.bottom.mas_equalTo(self.collectionView.mas_top);
    }];
}

- (void)setUIStyle {
    self.webView.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.title = @"广告页";
    self.questionLabel.text = @"问题:请问你最喜欢的人是谁?";
    self.questionLabel.font = [UIFont font2];
}

#pragma mark - lazy load

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_collectionView registerClass:[TYTAnswerCell class] forCellWithReuseIdentifier:@"TYTAnswerCellID"];
        
    }
    return _collectionView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UILabel *)questionLabel {
    if (!_questionLabel) {
        _questionLabel = [UILabel new];
    }
    return _questionLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
