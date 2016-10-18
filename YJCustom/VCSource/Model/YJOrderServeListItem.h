//
//  YJOrderServeListItem.h
//  YJCustom
//
//  Created by EEKA on 16/9/27.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJOrderDetailItem : NSObject

@property (nonatomic,strong) NSString *orderNum;
@property (nonatomic,strong) NSArray *orderServeArray;
@property (nonatomic,strong) NSArray *orderProdArray;

@end


#pragma mark - YJOrderServeListItem
@interface YJOrderServeListItem : NSObject

@property (nonatomic,assign) NSInteger orderId;
@property (nonatomic,assign) NSInteger lineId;
@property (nonatomic,strong) NSString *prodName;
@property (nonatomic,strong) NSString *serveItem;
@property (nonatomic,strong) NSString *serveContent;
@property (nonatomic,strong) NSString *serveItemName;
@property (nonatomic,strong) NSString *prodImageUrl;
@property (nonatomic,assign) NSInteger prodId;
@property (nonatomic,assign) NSInteger oprId;

@end

#pragma mark - YJOrderProdModel
@interface YJOrderProdModel : NSObject

@property (nonatomic,assign) NSInteger orderId;
@property (nonatomic,strong) NSString *prodName;
@property (nonatomic,assign) NSInteger lineId;
@property (nonatomic,strong) NSString *serveItem;
@property (nonatomic,strong) NSString *serveContent;
@property (nonatomic,strong) NSString *serveItemName;
@property (nonatomic,strong) NSString *prodImageUrl;
@property (nonatomic,assign) NSInteger prodId;
@property (nonatomic,assign) NSInteger oprId;

@end


#pragma mark - YJAllServeItemListModel
@interface YJAllServeItemListModel : NSObject

@property (nonatomic,assign) NSInteger seqNum;
@property (nonatomic,strong) NSString *code;
@property (nonatomic,strong) NSString *value;
@property (nonatomic,assign) NSInteger oprId;
@property (nonatomic,strong) NSString *codeType;
@property (nonatomic,strong) NSString *codeTypeName;

@end
