//
//  YJOrderListCellView.m
//  YJCustom
//
//  Created by EEKA on 16/9/23.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderListCellView.h"
#import "YJOrderListDataItem.h"

@interface YJOrderListCellView ()
{
    __weak IBOutlet UIImageView *_prodImageView;
    __weak IBOutlet UILabel *_productNameLabel;
    __weak IBOutlet UILabel *_orderNumLabel;
    __weak IBOutlet UILabel *_orderPriceLabel;
    __weak IBOutlet UILabel *_qtyLabel;
    
}

@end

@implementation YJOrderListCellView

-(void)setOrderDataItem:(YJOrderListDataItem *)dataItem
{
    YJOrderListProductInfo *prodInfo = dataItem.prodArray.firstObject;
    [_prodImageView sd_setImageWithURL:[NSURL URLWithString:prodInfo.imageSmall]];
    _productNameLabel.text = prodInfo.prodName;
    
    _orderPriceLabel.text = [NSString stringWithFormat:@"交易价格:¥%@",prodInfo.transPrice];;
    _orderNumLabel.text = [NSString stringWithFormat:@"订单号:%@",dataItem.orderNum];
    _qtyLabel.text = [NSString stringWithFormat:@"数量:%ld",prodInfo.qty];
}

@end
