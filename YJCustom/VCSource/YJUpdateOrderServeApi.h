//
//  YJUpdateOrderServeApi.h
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MFNetworkRequest.h"

@interface YJUpdateOrderServeApi : MFNetworkRequest
{
    NSString *_serveContent;
    NSInteger _lineId;
}

@property (nonatomic,assign) NSInteger lineId;
@property (nonatomic,strong) NSString *serveContent;

@end
