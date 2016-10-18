//
//  YJOrderListDataItem.m
//  YJCustom
//
//  Created by EEKA on 16/9/23.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderListDataItem.h"

@implementation YJOrderListProductInfo
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"orderId" : @"b2C_ORDER_ID",
             @"groupId" : @"group_ID",
             @"prodId" : @"prod_ID",
             @"skuId" : @"sku_ID",
             @"prodMadeSkuId" : @"prod_MADE_SKU_ID",
             @"orderNum" : @"b2C_ORDER_NUM",
             @"imageSmall" : @"image_SMALL",
             @"productDesc" : @"made_SKU_DESC",
             @"prodCode" : @"prod_CODE",
             @"prodName" : @"prod_NAME",
             @"standPrice" : @"std_PRICE",
             @"salePrice" : @"sale_PRICE",
             @"saleVal" : @"sale_VAL",
             @"transDisc" : @"trans_DISC",
             @"transPrice" : @"trans_PRICE",
             @"transVal" : @"trans_VAL"
             };
}


@end


#pragma mark - YJOrderListDataItem
@implementation YJOrderListDataItem

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"orderId" : @"b2C_ORDER_ID",
             @"orderNum" : @"b2C_ORDER_NUM",
             @"isMade" : @"is_MADE",
             @"prsnlId" : @"prsnl_ID",
             @"prsnlName" : @"prsnl_NAME",
             @"prodArray" : @"prods"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"prodArray" : [YJOrderListProductInfo class]};
}

@end
