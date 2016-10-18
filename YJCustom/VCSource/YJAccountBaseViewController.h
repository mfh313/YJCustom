//
//  YJAccountBaseViewController.h
//  YJCustom
//
//  Created by EEKA on 16/9/19.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MMViewController.h"

@protocol YJAccountBaseViewControllerDelegate <NSObject>

@optional
-(void)onUserLoginUserName:(NSString *)userName Pwd:(NSString *)password;

@end

@interface YJAccountBaseViewController : MMViewController

@property (nonatomic,weak) id<YJAccountBaseViewControllerDelegate> m_delegate;

@end
