//
//  YJOrderServeItemCellView.m
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderServeItemCellView.h"
#import "YJOrderServeListItem.h"

@interface YJOrderServeItemCellView ()
{
    __weak IBOutlet UILabel *_serveItemNameLabel;
    
    __weak IBOutlet UILabel *_serveContentLabel;
    
    __weak IBOutlet UIView *_serveDetailView;
    
    __weak IBOutlet UIView *_addServeDetailView;
    
    YJOrderServeListItem *_dataItem;
    
}

@end

@implementation YJOrderServeItemCellView

-(void)awakeFromNib
{
    [super awakeFromNib];
    [_addServeDetailView setHidden:YES];
}

-(void)setServeContent:(NSString *)content
{
    _serveContentLabel.text = content;
}

-(void)setServeItemName:(NSString *)itemName
{
    _serveItemNameLabel.text = itemName;
}

-(void)setServeContentColor:(UIColor *)textColor
{
    _serveContentLabel.textColor = textColor;
}

-(void)setOrderServeListItem:(YJOrderServeListItem *)dataItem
{
    _dataItem = dataItem;
}

-(void)setOrderServeListItem:(YJOrderServeListItem *)dataItem hasOrderServeInfo:(BOOL)hasInfo
{
    if (hasInfo)
    {
        [_addServeDetailView setHidden:YES];
        [self setOrderServeListItem:dataItem];
        
        [_serveDetailView setHidden:NO];
        _serveItemNameLabel.text = dataItem.serveItemName;
        _serveContentLabel.text = dataItem.serveContent;
    }
    else
    {
        [_addServeDetailView setHidden:NO];
        [_serveDetailView setHidden:YES];
    }
}

- (IBAction)onClickAddServeDetail:(id)sender {
    
    if ([self.m_delegate respondsToSelector:@selector(onClickAddServeDetail)]) {
        [self.m_delegate onClickAddServeDetail];
    }
}

- (IBAction)onClickUpdateServeDetail:(id)sender {
    if ([self.m_delegate respondsToSelector:@selector(onClickUpdateServeDetail:)]) {
        [self.m_delegate onClickUpdateServeDetail:_dataItem];
    }
}


@end
