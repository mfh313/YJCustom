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
    
    NSString *priceString = [NSString stringWithFormat:@"交易金额：¥%@",prodInfo.transPrice];
    NSMutableAttributedString *price = [[NSMutableAttributedString alloc] initWithString:priceString];
    [price addAttribute:NSForegroundColorAttributeName value:[UIColor hx_colorWithHexString:@"f23a47"] range:(NSRange){5,prodInfo.transPrice.length+1}];
    [price addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:19.0] range:(NSRange){5,prodInfo.transPrice.length+1}];
    
    _orderPriceLabel.attributedText = price;
    _orderNumLabel.text = [NSString stringWithFormat:@"订单号:%@",dataItem.orderNum];
    _qtyLabel.text = [NSString stringWithFormat:@"数量：%ld件",prodInfo.qty];
}

@end
