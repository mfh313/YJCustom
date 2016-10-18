//
//  YJAddOrderServeViewController.h
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MMViewController.h"

@protocol YJAddOrderServeViewControllerDelegate <NSObject>

@optional
-(void)onAddOrderServe:(NSInteger)orderId
                prodID:(NSInteger)prodId
             serveItem:(NSString *)serveItem
          serveContent:(NSString *)serveContent;

-(void)onAddOrderServes:(NSMutableArray *)orderServes;


@end

@class YJOrderProdModel;
@interface YJAddOrderServeViewController : MMViewController

@property (nonatomic,weak) id<YJAddOrderServeViewControllerDelegate> m_delegate;
@property (nonatomic,strong)YJOrderProdModel *orderProdModel;

@end
