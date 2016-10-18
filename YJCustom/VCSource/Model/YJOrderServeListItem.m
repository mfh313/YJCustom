//
//  YJOrderServeListItem.m
//  YJCustom
//
//  Created by EEKA on 16/9/27.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderServeListItem.h"

@implementation YJOrderDetailItem

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"orderNum" : @"order_num",
             @"orderServeArray" : @"orderServeList",
             @"orderProdArray" : @"orderProdList"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"orderServeArray" : [YJOrderServeListItem class],
             @"orderProdArray" : [YJOrderProdModel class]};
}

@end

#pragma mark - YJOrderServeListItem
@implementation YJOrderServeListItem

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"orderId" : @"b2C_ORDER_ID",
             @"prodName" : @"prod_NAME",
             @"lineId" : @"line_ID",
             @"serveItem" : @"serve_ITEM",
             @"serveContent" : @"serve_CONTENT",
             @"serveItemName" : @"serve_ITEM_NAME",
             @"prodImageUrl" : @"prod_IMAGE_URL",
             @"oprId" : @"opr_ID",
             @"oprTime" : @"opr_TIME",
             @"prodId" : @"prod_ID"
             };
}

@end

#pragma mark - YJOrderProdModel
@implementation YJOrderProdModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"orderId" : @"b2C_ORDER_ID",
             @"orderNum" : @"b2C_ORDER_NUM",
             @"prodName" : @"prod_NAME",
             @"lineId" : @"line_ID",
             @"imageSmall" : @"image_SMALL",
             @"oprId" : @"opr_ID",
             @"oprTime" : @"opr_TIME",
             @"prodId" : @"prod_ID"
             };
}

@end

#pragma mark - YJAllServeItemListModel
@implementation YJAllServeItemListModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"seqNum" : @"seq_NUM",
             @"oprId" : @"opr_ID",
             @"codeType" : @"code_TYPE",
             @"codeTypeName" : @"code_TYPE_NAME"
             };
}

@end
