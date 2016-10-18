//
//  YJOrderServeItemInputView.h
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MMUIBridgeView.h"

@class YJOrderServeListItem;
@protocol YJOrderServeItemInputViewDelegate <NSObject>

@optional
-(void)onDidModifyServeDetail:(YJOrderServeListItem *)dataItem;

@end

@interface YJOrderServeItemInputView : MMUIBridgeView

@property (nonatomic,weak) id<YJOrderServeItemInputViewDelegate> m_delegate;

-(BOOL)becomeFirstResponder;
-(void)setServeDetail:(YJOrderServeListItem *)dataItem;

@end
