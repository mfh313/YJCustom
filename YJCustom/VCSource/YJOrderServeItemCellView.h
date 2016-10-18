//
//  YJOrderServeItemCellView.h
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MMUIBridgeView.h"

@class YJOrderServeListItem;

@protocol YJOrderServeItemCellViewDelegate <NSObject>

@optional
-(void)onClickAddServeDetail;
-(void)onClickUpdateServeDetail:(YJOrderServeListItem *)dataItem;

@end

@interface YJOrderServeItemCellView : MMUIBridgeView

@property (nonatomic,weak) id<YJOrderServeItemCellViewDelegate> m_delegate;

-(void)setServeItemName:(NSString *)itemName;
-(void)setServeContent:(NSString *)content;
-(void)setServeContentColor:(UIColor *)textColor;
-(void)setOrderServeListItem:(YJOrderServeListItem *)dataItem;
-(void)setOrderServeListItem:(YJOrderServeListItem *)dataItem hasOrderServeInfo:(BOOL)hasInfo;

@end
