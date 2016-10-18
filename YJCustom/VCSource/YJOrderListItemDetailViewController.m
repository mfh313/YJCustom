//
//  YJOrderListItemDetailViewController.m
//  YJCustom
//
//  Created by EEKA on 16/9/23.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderListItemDetailViewController.h"
#import "YJOrderListDetailApi.h"
#import "YJOrderListDataItem.h"
#import "YJOrderServeListItem.h"
#import "YJGetOrderServerApi.h"
#import "YJOrderServeItemCellView.h"
#import "YJOrderServeItemHeaderView.h"
#import "YJAddOrderServeViewController.h"
#import "YJAddOrderServeApi.h"
#import "YJUpdateOrderServeApi.h"
#import "YJOrderServeItemInputView.h"


#define OrderServeSection 0

@interface YJOrderListItemDetailViewController ()<UITableViewDelegate,UITableViewDataSource,YJOrderServeItemCellViewDelegate,YJAddOrderServeViewControllerDelegate,YJOrderServeItemInputViewDelegate>
{
    BOOL _navigationBarHidden;
    
    YJOrderListDetailApi *_detailApi;
    YJGetOrderServerApi *_getOrderServerApi;
    YJOrderDetailItem *_orderDetailItem;
    NSMutableArray *_orderServeList;
    
    __weak IBOutlet UITableView *_tableView;
    YJOrderServeItemInputView *_inputView;
    
    BOOL _hasOrderServeInfo;
    
}

@end

@implementation YJOrderListItemDetailViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _navigationBarHidden = [self.navigationController isNavigationBarHidden];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:_navigationBarHidden animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *title = [NSString stringWithFormat:@"订单详情(%@)",self.dataItem.orderNum];
    self.title = title;
    [self MF_wantsFullScreenLayout:NO];
    
    _detailApi = [YJOrderListDetailApi new];
    _detailApi.orderNum = self.dataItem.orderNum;
    
    [_detailApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        NSMutableDictionary *response = request.responseJSONObject;
        _orderDetailItem = [YJOrderDetailItem MM_modelWithDictionary:response[@"obj"]];
        
        [_tableView reloadData];
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
    
    _orderServeList = [NSMutableArray array];
    
    _getOrderServerApi = [YJGetOrderServerApi new];
    [self getOrderServer];
    
    [self initInputView];
    
}

-(void)initInputView
{
    _inputView = [YJOrderServeItemInputView viewWithNibName:@"YJOrderServeItemInputView"];
    _inputView.m_delegate = self;
    _inputView.frame = self.view.bounds;
    [self.view addSubview:_inputView];
    
    [_inputView setHidden:YES];
}

-(void)getOrderServer
{
    [_orderServeList removeAllObjects];

    _getOrderServerApi.orderNum = self.dataItem.orderNum;
    [_getOrderServerApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        NSMutableDictionary *response = request.responseJSONObject;
        NSMutableDictionary *orderServeListDic = response[@"obj"];
        NSMutableArray *orderServeList = orderServeListDic[@"orderServeList"];
        for (int i = 0; i < orderServeList.count; i++) {
            YJOrderServeListItem *serveItem = [YJOrderServeListItem MM_modelWithDictionary:orderServeList[i]];
            [_orderServeList addObject:serveItem];
        }
        
        if (_orderServeList.count == 0) {
            _hasOrderServeInfo = NO;
        }
        else
        {
            _hasOrderServeInfo = YES;
        }
        
        [self reloadOrderServeSection];
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

-(void)reloadOrderServeSection
{
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == OrderServeSection)
    {
        if (_hasOrderServeInfo) {
            return _orderServeList.count;
        }
        else
        {
            return 1;
        }
    }
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == OrderServeSection) {
        return [self tableView:tableView serveItemCellForRowAtIndexPath:indexPath];
    }
    
    static NSString *identifier = @"YJOrderListItemDetailViewController";
    MMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[MMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == OrderServeSection) {
        YJOrderServeItemHeaderView *headerView = [YJOrderServeItemHeaderView viewWithNibName:@"YJOrderServeItemHeaderView"];
        NSString *prodName = ((YJOrderProdModel *)_orderDetailItem.orderProdArray.firstObject).prodName;
        [headerView setProdName:[NSString stringWithFormat:@"产品名：%@",prodName]];
        return headerView;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 90;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == OrderServeSection) {
        return 96;
    }
    
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView serveItemCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"serveItemCell";
    MMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[MMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        YJOrderServeItemCellView *cellView = [YJOrderServeItemCellView viewWithNibName:@"YJOrderServeItemCellView"];
        cellView.m_delegate = self;
        cell.m_subContentView = cellView;
    }
    
    YJOrderServeItemCellView *cellView = (YJOrderServeItemCellView *)cell.m_subContentView;
    if (_hasOrderServeInfo) {
        YJOrderServeListItem *dataItem = _orderServeList[indexPath.row];
        [cellView setOrderServeListItem:dataItem hasOrderServeInfo:_hasOrderServeInfo];
    }
    else
    {
        [cellView setOrderServeListItem:nil hasOrderServeInfo:_hasOrderServeInfo];
    }
    
    return cell;
}

#pragma mark - YJOrderServeItemCellViewDelegate
-(void)onClickAddServeDetail
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"OrderList" bundle:nil];
    YJAddOrderServeViewController *addServeVC = [storyboard instantiateViewControllerWithIdentifier:@"YJAddOrderServeViewController"];
    addServeVC.m_delegate = self;
    addServeVC.orderProdModel = (YJOrderProdModel *)_orderDetailItem.orderProdArray.firstObject;
    MMNavigationController *nav = [[MMNavigationController alloc] initWithRootViewController:addServeVC];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

-(void)onClickUpdateServeDetail:(YJOrderServeListItem *)dataItem
{
    [_inputView setServeDetail:dataItem];
    
    [_inputView setHidden:NO];
    [_inputView becomeFirstResponder];
}

#pragma mark - YJOrderServeItemInputViewDelegate
-(void)onDidModifyServeDetail:(YJOrderServeListItem *)dataItem
{
    [_inputView resignFirstResponder];
    [_inputView setHidden:YES];
    
    [self updateServeDetail:dataItem];
}

-(void)updateServeDetail:(YJOrderServeListItem *)dataItem
{
    YJUpdateOrderServeApi *updateServeApi = [YJUpdateOrderServeApi new];
    updateServeApi.lineId = dataItem.lineId;
    updateServeApi.serveContent = dataItem.serveContent;
    [updateServeApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        [self getOrderServer];
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

#pragma mark - YJAddOrderServeViewControllerDelegate
-(void)onAddOrderServes:(NSMutableArray *)orderServes
{
    NSMutableArray *apiRequestArray = [NSMutableArray array];
    
    for (int i = 0; i < orderServes.count; i++) {
        YJOrderServeListItem *listItem = orderServes[i];
        
        YJAddOrderServeApi *addServeApi = [YJAddOrderServeApi new];
        addServeApi.orderId = listItem.orderId;
        addServeApi.prodId = listItem.prodId;
        addServeApi.serveItem = listItem.serveItem;
        addServeApi.serveContent = listItem.serveContent;
        
        [apiRequestArray addObject:addServeApi];
    }
    
    YTKBatchRequest *batchRequest = [[YTKBatchRequest alloc] initWithRequestArray:apiRequestArray];
    [batchRequest startWithCompletionBlockWithSuccess:^(YTKBatchRequest *batchRequest) {
        NSLog(@"succeed");
//        NSArray *requests = batchRequest.requestArray;
        [self getOrderServer];
        
    } failure:^(YTKBatchRequest *batchRequest) {
        NSLog(@"failed");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
