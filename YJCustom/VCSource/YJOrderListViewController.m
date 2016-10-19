//
//  YJOrderListViewController.m
//  YJCustom
//
//  Created by EEKA on 16/9/19.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderListViewController.h"
#import "YJOrderListAllViewController.h"
#import "YJOrderListReservedViewController.h"
#import "YJOrderListUntreatedViewController.h"
#import "YJOrderListItemDetailViewController.h"


@interface YJOrderListViewController ()<UITableViewDataSource,UITableViewDelegate,YJOrderListContentBaseViewControllerDelegate,YJOrderListMgrDelegate>
{
    UIScrollView *_headerView;
    __weak IBOutlet MMSelectButton *_btnLeft;
    __weak IBOutlet MMSelectButton *_btnMiddle;
    __weak IBOutlet MMSelectButton *_btnRight;
    
    UITableView *_tableView;  //横向tableView
    
    NSArray *_tabTitles;
    NSMutableArray *m_headTabViews;
    NSMutableDictionary *m_contentVCDic;
    
    NSInteger _currentPageIndex;
    
    YJOrderListMgr *m_orderListMgr;
    
}

@end

@implementation YJOrderListViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tabTitles = @[@"全部",@"已预约",@"未处理"];
    m_headTabViews = [NSMutableArray array];
    
    m_contentVCDic = [NSMutableDictionary dictionary];
    
    [self setHeadBtns];
    [self initTableView];
    
    m_orderListMgr = [[MMServiceCenter defaultCenter] getService:[YJOrderListMgr class]];
    m_orderListMgr.delegate = self;
    
    [self setBtnViewCurrentIndex:0];

}

-(void)setHeadBtns
{
    NSArray *normalImages = @[MFImageStretch(MFImage(@"custom1"), 10, 25),
                              MFImage(@"custom4"),
                              MFImageStretch(MFImage(@"custom2"), 2, 25)];
    NSArray *selectedImages = @[MFImageStretch(MFImage(@"custom5"), 10, 25),
                              MFImage(@"custom3"),
                              MFImageStretch(MFImage(@"custom6"), 2, 25)];
    
    [m_headTabViews addObject:_btnLeft];
    [m_headTabViews addObject:_btnMiddle];
    [m_headTabViews addObject:_btnRight];
    
    for (int i = 0; i < m_headTabViews.count; i++) {
        UIButton *itemBtn = m_headTabViews[i];
        [itemBtn setTitle:_tabTitles[i] forState:UIControlStateNormal];
        [itemBtn addTarget:self action:@selector(onClickItemBtn:) forControlEvents:UIControlEventTouchUpInside];
        [itemBtn setBackgroundImage:normalImages[i] forState:UIControlStateNormal];
        [itemBtn setBackgroundImage:selectedImages[i] forState:UIControlStateSelected];
    }

}

-(void)onClickItemBtn:(UIButton*)btn
{
    NSInteger index = [m_headTabViews indexOfObject:btn];
    
    [self setBtnViewCurrentIndex:index];
    [self setCurrentIndexVC:index];
}

-(void)setBtnViewCurrentIndex:(NSInteger)index
{
    for (int i = 0; i < m_headTabViews.count; i++) {
        UIButton *itemBtn = m_headTabViews[i];
        if (i == index) {
            [itemBtn setSelected:YES];
        }
        else
        {
            [itemBtn setSelected:NO];
        }
    }
}

-(void)initTableView
{
    CGRect tableFrame = CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.frame)-64);
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.pagingEnabled = YES;
    _tableView.scrollsToTop = YES;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    _tableView.frame = tableFrame;
    [_tableView setTransform:CGAffineTransformMake(0, -1, 1, 0, 0, 0)];
    _tableView.bounds = CGRectMake(0, 0, tableFrame.size.height, tableFrame.size.width);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tabTitles.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _tableView.bounds.size.height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"YJOrderListViewController";
    MMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[MMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
        
        [cell.contentView setTransform:CGAffineTransformMakeRotation(M_PI/2)]; 
    }
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    UIViewController *cellVC = [self viewControlWithIndex:indexPath.row];
    [cell setM_subContentView:cellVC.view];
    
    return cell;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // Calculate current page
    if (scrollView == _tableView)
    {
        CGRect visibleBounds = scrollView.bounds;
        NSInteger index = (NSInteger)(floorf(CGRectGetMidY(visibleBounds) / CGRectGetHeight(visibleBounds)));
        if (index < 0)
        {
           index = 0;
        }
        if (index > _tabTitles.count - 1)
        {
            index = _tabTitles.count - 1;
        }
        
        NSUInteger previousCurrentPage = _currentPageIndex;
        _currentPageIndex = index;
        if (_currentPageIndex != previousCurrentPage) {
            
            [self setBtnViewCurrentIndex:index];
        }
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}


-(UIViewController *)viewControlWithIndex:(NSInteger)index
{
    NSString *key = [NSString stringWithFormat:@"%ld",index];
    
    id currentObj = m_contentVCDic[key];
    YJOrderListContentBaseViewController *viewController = nil;
    if ([currentObj isKindOfClass:[YJOrderListContentBaseViewController class]]) {
        
        viewController = (YJOrderListContentBaseViewController *)currentObj;
        
    }
    else
    {
//        NSArray *VCIdentifiers = @[@"YJOrderListAllViewController",
//                                   @"YJOrderListReservedViewController",
//                                   @"YJOrderListUntreatedViewController"];
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"OrderList" bundle:nil];
//        viewController = [storyboard instantiateViewControllerWithIdentifier:VCIdentifiers[index]];
//        viewController.m_delegate = self;
//        m_contentVCDic[key] = viewController;
//        
//        [self addChildViewController:viewController];
//        
//        [viewController didMoveToParentViewController:self];
        
        NSArray *VCIdentifiers = @[@"YJOrderListAllViewController",
                                   @"YJOrderListReservedViewController",
                                   @"YJOrderListUntreatedViewController"];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"OrderList" bundle:nil];
        viewController = [storyboard instantiateViewControllerWithIdentifier:VCIdentifiers[0]];
        viewController.m_delegate = self;
        
        if (index == 1) {
            ((YJOrderListAllViewController *)viewController).progress = @"AS";
        }
        else if (index == 2)
        {
            ((YJOrderListAllViewController *)viewController).progress = @"IS";
        }
        
        m_contentVCDic[key] = viewController;
        
        [self addChildViewController:viewController];
        
        [viewController didMoveToParentViewController:self];
    }
    
    return viewController;
}


-(void)setCurrentIndexVC:(NSInteger)index
{
    [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]
                      atScrollPosition:UITableViewScrollPositionMiddle animated:NO];

}

#pragma mark - YJOrderListMgrDelegate


#pragma mark - YJOrderListContentBaseViewControllerDelegate
-(void)onClickOrderListAllIndex:(NSInteger)index
{
    NSMutableArray *_allOrderListArray = [m_orderListMgr allOrderListArray];
    
    if (_allOrderListArray.count - 1 < index) {
        return;
    }
    
    YJOrderListDataItem *dataItem = _allOrderListArray[index];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"OrderList" bundle:nil];
    YJOrderListItemDetailViewController *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"YJOrderListItemDetailViewController"];
    detailVC.dataItem = dataItem;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//    [self addChildViewController:viewController];
//    viewController.view.frame = _contentView.bounds;
//    [viewController.view setAutoresizingMask:(UIViewAutoresizingFlexibleWidth|
//                                              UIViewAutoresizingFlexibleHeight)];
//    [_contentView addSubview:viewController.view];
//    [viewController didMoveToParentViewController:self];


@end
