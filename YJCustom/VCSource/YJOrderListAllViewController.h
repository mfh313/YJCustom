//
//  YJOrderListAllViewController.h
//  YJCustom
//
//  Created by EEKA on 16/9/20.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderListContentBaseViewController.h"

@interface YJOrderListAllViewController : YJOrderListContentBaseViewController
{
    YJOrderListApi *_orderListApi;
}

@property (nonatomic,strong) NSString *progress;

-(void)onGetOrderListAll:(NSMutableArray *)allArray;


@end
