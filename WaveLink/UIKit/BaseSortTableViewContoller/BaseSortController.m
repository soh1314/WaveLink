//
//  BaseSortController.m
//  TRGFShop
//
//  Created by yangqing Liu on 2017/9/6.
//  Copyright © 2017年 trgf. All rights reserved.
//

#import "BaseSortController.h"
#import "NormalDataCell.h"
#import "CellModel.h"
#import "WMMenuView.h"
#import "UIView+borderLine.h"

@interface BaseSortController ()<UITableViewDelegate,UITableViewDataSource,WMMenuViewDelegate,WMMenuViewDataSource>

@property (nonatomic,strong)WMMenuView *topMenu;
@property (nonatomic,assign)NSInteger curIndex;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation BaseSortController

- (id)init {
    if (self = [super init]) {
        if (self.coloumCount == 0) {
            self.coloumCount = 2;
            self.navbarStyle = TYTBlackNavBarStyle;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self loadNewData];
    // Do any additional setup after loading the view.
}

- (void)initUI {
    [self.view addSubview:self.topMenu];
//    [self.topMenu mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.left.top.mas_equalTo(self.view);
//        make.height.mas_equalTo(60);
//    }];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.topMenu.mas_bottom);
    }];

    [self testUI];
    
}

- (void)testUI {
//    self.topMenu.backgroundColor = [UIColor redColor];

}

// 导入数据
- (void)loadNewData {

}

// 分类方法
- (void)sort:(NSInteger)type {
    if (self.sortDelegate && [self.sortDelegate respondsToSelector:@selector(sort:)]) {
        [self.sortDelegate sort:type];
    }
    [self.tableView reloadData];
}

#pragma mark -lazy

- (EaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[EaseTableView alloc]init];
    }
    return _tableView;
}

- (WMMenuView *)topMenu {
    if (!_topMenu) {
        _topMenu = [[WMMenuView alloc]initWithFrame:CGRectMake(0, KNAVBARHEIGHT, KSCREENW, 45*KRATIO)];
        _topMenu.style = WMMenuViewStyleLine;
        _topMenu.fontName = [UIFont font6].fontName;
        _topMenu.progressViewBottomSpace = 0.5;
        _topMenu.lineColor = [UIColor colorWithHex:@"#829cfc"];
        _topMenu.delegate = self;
        _topMenu.dataSource = self;
        _topMenu.progressViewCornerRadius = 2;
        _topMenu.progressHeight = 2;
        _topMenu.layoutMode = WMMenuViewLayoutModeCenter;
        [_topMenu borderForColor:[UIColor lightGrayColor] borderWidth:1 borderType:UIBorderSideTypeBottom];

    }
    return _topMenu;
}


#pragma mark - menu delegate and source

- (UIColor *)menuView:(WMMenuView *)menu titleColorForState:(WMMenuItemState)state atIndex:(NSInteger)index {
    if (state == WMMenuItemStateSelected) {
        return [UIColor themeColor];
    } else {
        return [UIColor themeTextBlackColor];
    }
    
}

- (void)menuView:(WMMenuView *)menu didSelesctedIndex:(NSInteger)index currentIndex:(NSInteger)currentIndex {
    self.curIndex = index;
    [self sort:index];
}

- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    return KSCREENW/self.coloumCount;
}

- (NSInteger)numbersOfTitlesInMenuView:(WMMenuView *)menu {
    return self.coloumCount;
}

- (NSString *)menuView:(WMMenuView *)menu titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGFloat)menuView:(WMMenuView *)menu titleSizeForState:(WMMenuItemState)state atIndex:(NSInteger)index {
    return 14;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
