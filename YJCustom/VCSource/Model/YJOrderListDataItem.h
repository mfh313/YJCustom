//
//  YJOrderListDataItem.h
//  YJCustom
//
//  Created by EEKA on 16/9/23.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJOrderListProductInfo : NSObject

@property (nonatomic,strong) NSNumber *orderId;
@property (nonatomic,strong) NSString *groupId;
@property (nonatomic,strong) NSString *prodId;
@property (nonatomic,strong) NSString *skuId;
@property (nonatomic,strong) NSString *prodMadeSkuId;
@property (nonatomic,strong) NSString *orderNum;
@property (nonatomic,strong) NSString *imageSmall;
@property (nonatomic,strong) NSString *productDesc;
@property (nonatomic,strong) NSString *prodCode;
@property (nonatomic,strong) NSString *prodName;
@property (nonatomic,strong) NSString *standPrice;   //挂牌价
@property (nonatomic,assign) NSInteger qty;   //数量
@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *salePrice; //销售价格
@property (nonatomic,strong) NSString *saleVal;   //销售金额
@property (nonatomic,strong) NSString *transDisc;   //交易折扣
@property (nonatomic,strong) NSString *transPrice;   //交易价格
@property (nonatomic,strong) NSString *transVal;   //交易金额

@end


#pragma mark - YJOrderListDataItem
@interface YJOrderListDataItem : NSObject

@property (nonatomic,strong) NSNumber *orderId;
@property (nonatomic,strong) NSString *orderNum;
@property (nonatomic,strong) NSString *isMade;
@property (nonatomic,strong) NSNumber *prsnlId;
@property (nonatomic,strong) NSString *prsnlName;
@property (nonatomic,strong) NSArray *prodArray;

@end
