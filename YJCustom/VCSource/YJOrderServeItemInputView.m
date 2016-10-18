//
//  YJOrderServeItemInputView.m
//  YJCustom
//
//  Created by EEKA on 16/9/28.
//  Copyright © 2016年 EEKA. All rights reserved.
//

#import "YJOrderServeItemInputView.h"
#import "YJOrderServeListItem.h"

@interface YJOrderServeItemInputView ()<UITextViewDelegate>
{
    __weak IBOutlet UIView *_inputView;
    
    __weak IBOutlet UILabel *_serveItemNameLabel;
    
    __weak IBOutlet UITextView *_textView;
    
    YJOrderServeListItem *_dataItem;
}

@end

@implementation YJOrderServeItemInputView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBg:)];
    [self addGestureRecognizer:tapGes];
}

-(void)onTapBg:(UITapGestureRecognizer *)ges
{
    [self resignFirstResponder];
    
    [self setHidden:YES];
}

-(void)setServeDetail:(YJOrderServeListItem *)dataItem
{
    _dataItem = dataItem;
    
    _serveItemNameLabel.text = dataItem.serveItemName;
    _textView.text = dataItem.serveContent;
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    CGRect keyboardBounds;
    [[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    keyboardBounds = [self convertRect:keyboardBounds toView:nil];
    CGRect inputViewFrame = _inputView.frame;
    inputViewFrame.origin.y = CGRectGetHeight(self.bounds) - (keyboardBounds.size.height + inputViewFrame.size.height);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    _inputView.frame = inputViewFrame;
    
    [UIView commitAnimations];
    
    
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    CGRect keyboardBounds;
    [[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    
    CGRect inputViewFrame = _inputView.frame;
    inputViewFrame.origin.y = CGRectGetHeight(self.bounds) - inputViewFrame.size.height;
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
    _inputView.frame = inputViewFrame;
    
    [UIView commitAnimations];
}


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        
        NSString *serveContent = _textView.text;
        _dataItem.serveContent = serveContent;
        
        if ([self.m_delegate respondsToSelector:@selector(onDidModifyServeDetail:)]) {
            [self.m_delegate onDidModifyServeDetail:_dataItem];
        }
        
        return NO;
    }
    
    return YES;
}


-(BOOL)becomeFirstResponder
{
    return [_textView becomeFirstResponder];
}

-(BOOL)resignFirstResponder
{
    return [_textView resignFirstResponder];
}

@end
