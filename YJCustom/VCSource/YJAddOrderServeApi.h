//
//  YJAddOrderServeApi.h
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MFNetworkRequest.h"

@interface YJAddOrderServeApi : MFNetworkRequest
{
    NSInteger _orderId;
}

@property (nonatomic,assign) NSInteger orderId;
@property (nonatomic,assign) NSInteger prodId;
@property (nonatomic,strong) NSString *serveItem;
@property (nonatomic,strong) NSString *serveContent;

@end
