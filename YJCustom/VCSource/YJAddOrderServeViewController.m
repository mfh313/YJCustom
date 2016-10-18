//
//  YJAddOrderServeViewController.m
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJAddOrderServeViewController.h"
#import "YJOrderListMgr.h"
#import "YJOrderServeItemCellView.h"
#import "YJOrderServeListItem.h"
#import "YJOrderServeItemInputView.h"

@interface YJAddOrderServeViewController ()<UITableViewDelegate,UITableViewDataSource,YJOrderServeItemCellViewDelegate,YJOrderServeItemInputViewDelegate>
{
    NSMutableArray *_orderServeItemList;
    __weak IBOutlet UITableView *_addOrderServeTableView;
    YJOrderServeItemInputView *_inputView;

}

@end

@implementation YJAddOrderServeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新增量体信息";
    [self setLeftNaviButtonWithTitle:@"返回" action:@selector(onClickNavBackBtn)];
    [self setRightNaviButtonWithTitle:@"确定" action:@selector(onClickDoneBtn)];
    
    [self MF_wantsFullScreenLayout:NO];
    
    YJOrderListMgr *orderMgr = [[MMServiceCenter defaultCenter] getService:[YJOrderListMgr class]];
    NSMutableArray *allServeItemList = [orderMgr allServeItemList];
    
    _orderServeItemList = [NSMutableArray array];
    for (int i = 0; i < allServeItemList.count; i++) {
        
        YJAllServeItemListModel *serveItemListModel = allServeItemList[i];
        
        YJOrderServeListItem *listItem = [YJOrderServeListItem new];
        listItem.orderId = self.orderProdModel.orderId;
        listItem.prodId = self.orderProdModel.prodId;
        listItem.serveItem = serveItemListModel.code;
        listItem.serveItemName = serveItemListModel.value;
        
        [_orderServeItemList addObject:listItem];

    }
    
    _inputView = [YJOrderServeItemInputView viewWithNibName:@"YJOrderServeItemInputView"];
    _inputView.m_delegate = self;
    _inputView.frame = self.view.bounds;
    [self.view addSubview:_inputView];
    
    [_inputView setHidden:YES];
}

-(void)onClickNavBackBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)onClickDoneBtn
{
    [self.view endEditing:YES];
    [_inputView setHidden:YES];
    
    NSMutableArray *addOrderServeItemList = [NSMutableArray array];
    for (int i = 0;i < _orderServeItemList.count;i++)
    {
        YJOrderServeListItem *listItem = _orderServeItemList[i];
        if (listItem.serveContent) {
            [addOrderServeItemList addObject:listItem];
        }
    }
    
    if ([self.m_delegate respondsToSelector:@selector(onAddOrderServes:)]) {
        [self.m_delegate onAddOrderServes:addOrderServeItemList];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _orderServeItemList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
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
    YJOrderServeListItem *dataItem = _orderServeItemList[indexPath.row];
    [cellView setOrderServeListItem:dataItem];
    [cellView setServeItemName:dataItem.serveItemName];
    
    if (dataItem.serveContent == nil) {
        [cellView setServeContent:@"未输入量体数据"];
        [cellView setServeContentColor:[UIColor lightGrayColor]];
    }
    else
    {
        [cellView setServeContent:dataItem.serveContent];
        [cellView setServeContentColor:[UIColor blackColor]];
    }
    
    return cell;
}

#pragma mark - YJOrderServeItemCellViewDelegate
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
    
    [_addOrderServeTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
