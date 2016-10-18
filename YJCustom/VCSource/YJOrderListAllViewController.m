//
//  YJOrderListAllViewController.m
//  YJCustom
//
//  Created by EEKA on 16/9/20.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderListAllViewController.h"
#import "YJOrderListCellView.h"


@interface YJOrderListAllViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_allOrderListArray;
    NSInteger _orderListItemMaxCount;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation YJOrderListAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    
    _allOrderListArray = [NSMutableArray array];
    _orderListApi = [YJOrderListApi new];
    _orderListApi.limit = 5;
    if (self.progress) {
        _orderListApi.progress = self.progress;
    }
    
    [self getOrderListAll];
    
    //下拉刷新
    __weak typeof(self) weakSelf = self;
    [_tableView addPullToRefreshWithActionHandler:^{
        [weakSelf getLatestData];
    }];
    
    //上拉刷新
    [_tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf getNextData];
    }];
}


-(void)getLatestData
{
    [self getOrderListAll];
}

-(void)getNextData
{
    if (_allOrderListArray.count == _orderListItemMaxCount)
    {
        NSLog(@"下拉无数据了");
        [self.tableView.infiniteScrollingView stopAnimating];
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    _orderListApi.page++;
    [_orderListApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        NSMutableDictionary *response = request.responseJSONObject;
        
        NSMutableArray *dataArray = response[@"data"];
        for (int i = 0; i < dataArray.count; i++) {
            YJOrderListDataItem *dataItem = [YJOrderListDataItem MM_modelWithDictionary:dataArray[i]];
            
            [_allOrderListArray addObject:dataItem];
        }
        
        YJOrderListMgr* m_orderListMgr = [[MMServiceCenter defaultCenter] getService:[YJOrderListMgr class]];
        m_orderListMgr.allOrderListArray = _allOrderListArray;
        
        [weakSelf onGetOrderListAll:_allOrderListArray];
        [weakSelf.tableView.infiniteScrollingView stopAnimating];
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        
    }];
}

-(void)getOrderListAll
{
    __weak typeof(self) weakSelf = self;
    
    _orderListApi.page = 1;
    [_orderListApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        [_allOrderListArray removeAllObjects];
        

        NSMutableDictionary *response = request.responseJSONObject;
        
        if (response[@"total"]) {
            NSNumber *count = response[@"total"];
            _orderListItemMaxCount = count.integerValue;
        }
        
        NSMutableArray *dataArray = response[@"data"];
        for (int i = 0; i < dataArray.count; i++) {
            YJOrderListDataItem *dataItem = [YJOrderListDataItem MM_modelWithDictionary:dataArray[i]];
            
            [_allOrderListArray addObject:dataItem];
        }
        
        YJOrderListMgr* m_orderListMgr = [[MMServiceCenter defaultCenter] getService:[YJOrderListMgr class]];
        m_orderListMgr.allOrderListArray = _allOrderListArray;
        
        [weakSelf onGetOrderListAll:_allOrderListArray];
        [weakSelf.tableView.pullToRefreshView stopAnimating];
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _allOrderListArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"YJOrderListViewController";
    MMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[MMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        YJOrderListCellView *cellView = [YJOrderListCellView viewWithNibName:@"YJOrderListCellView"];
        cell.m_subContentView = cellView;
    }
    
    YJOrderListDataItem *dataItem = _allOrderListArray[indexPath.row];
    YJOrderListCellView *cellView = (YJOrderListCellView *)cell.m_subContentView;
    [cellView setOrderDataItem:dataItem];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.m_delegate respondsToSelector:@selector(onClickOrderListAllIndex:)]) {
        [self.m_delegate onClickOrderListAllIndex:indexPath.row];
    }
}

-(void)onGetOrderListAll:(NSMutableArray *)allArray
{
    _allOrderListArray = allArray;
    [_tableView reloadData];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
