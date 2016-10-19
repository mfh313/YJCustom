//
//  MMOnePixLayoutConstraint.m
//  YJCustom
//
//  Created by EEKA on 2016/10/19.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "MMOnePixLayoutConstraint.h"

@implementation MMOnePixLayoutConstraint

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.constant = MFOnePixHeigtht;
}

@end


#pragma mark - MMOnePixLine
@implementation MMOnePixLine

-(void)awakeFromNib
{
    [super awakeFromNib];
    if (self.constraints.count > 0) {
        for (NSLayoutConstraint *constraint in self.constraints) {
            if (constraint.constant == 1) {
                constraint.constant = MFOnePixHeigtht;
            }
        }
    }
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    [YJCustomLineColor setFill];
    UIRectFill(rect);
}

@end
