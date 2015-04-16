//
//  WJLabel.h
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/10.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//
//
//
//  依赖RegexKitLite 库 可以用cocospods pod 'RegexKitLite'
//  该库需要导入libicucore.dylib
#import "RegexKitLite.h"

#import "UILabel+WJ.h"

@interface WJLabel : UILabel

@property (assign, nonatomic) BOOL touchSelect;
@property (copy, nonatomic) UIColor *selectColor;
@property (copy, nonatomic) UIColor *selectTextColor;
@end
