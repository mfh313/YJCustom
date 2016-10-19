//
//  MFUICommonUtil.h
//  YJCustom
//
//  Created by EEKA on 16/9/23.
//  Copyright © 2016年 EEKA. All rights reserved.
//


#define MFOnePixHeigtht 1/[UIScreen mainScreen].scale

#define MFKeyWindow [[UIApplication sharedApplication] keyWindow]
#define MFAppWindow [[UIApplication sharedApplication].delegate window]

#define MFRGB(r,g,b)  [UIColor colorWithRed:(double)r/255.0f green:(double)g/255.0f blue:(double)b/255.0f alpha:1.0]
#define MFRGBa(r,g,b,a)  [UIColor colorWithRed:(double)r/255.0f green:(double)g/255.0f blue:(double)b/255.0f alpha:a]

#define YJCustomDefaultColor [UIColor hx_colorWithHexString:@"e93871"]
#define YJCustomLineColor [UIColor hx_colorWithHexString:@"d4d4d4"]
