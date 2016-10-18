//
//  YJOrderListApi.h
//  YJCustom
//
//  Created by EEKA on 16/9/27.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MFNetworkRequest.h"

@interface YJOrderListApi : MFNetworkRequest
{
    NSInteger _page;
    NSInteger _limit;
    
    NSString *_progress;
}

@property (nonatomic,assign) NSInteger page;
@property (nonatomic,assign) NSInteger limit;
@property (nonatomic,strong) NSString *progress;

@end
