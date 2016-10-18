//
//  YJOrderServeItemHeaderView.m
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderServeItemHeaderView.h"

@interface YJOrderServeItemHeaderView ()
{
    __weak IBOutlet UILabel *_prodNameLabel;
}

@end

@implementation YJOrderServeItemHeaderView

-(void)setProdName:(NSString *)prodName
{
    _prodNameLabel.text = prodName;
}


@end
