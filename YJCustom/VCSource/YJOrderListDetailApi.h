//
//  YJOrderListDetailApi.h
//  YJCustom
//
//  Created by EEKA on 16/9/27.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MFNetworkRequest.h"

@interface YJOrderListDetailApi : MFNetworkRequest
{
    NSString *_orderNum;
}

@property (nonatomic,strong) NSString *orderNum;

@end
