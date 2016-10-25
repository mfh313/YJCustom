//
//  YJOrderListContentBaseViewController.h
//  YJCustom
//
//  Created by EEKA on 16/9/20.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MMViewController.h"
#import "YJOrderListDataItem.h"
#import "MMServiceCenter.h"
#import "YJOrderListMgr.h"
#import "YJOrderListApi.h"

@protocol YJOrderListContentBaseViewControllerDelegate <NSObject>

@optional

-(void)onClickOrderListAllIndex:(NSInteger)index;
-(void)onClickOrderListAllIndex:(NSInteger)index progress:(NSString *)progress;

@end

@interface YJOrderListContentBaseViewController : MMViewController

@property (nonatomic,weak) id<YJOrderListContentBaseViewControllerDelegate> m_delegate;

-(void)setTabBarBadgeValue;

@end
