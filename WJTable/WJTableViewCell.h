//
//  WJTableViewCell.h
//  WJTable
//
//  Created by Maxson-001 on 15/3/30.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//
//  模块化

#import "UITableViewCell+WJ.h"

@interface WJTableViewCell : UITableViewCell
@property (strong,nonatomic) id data;//基本数据 {image:"",title:"",detail:"",bgcolor:UIColor}
+ (CGFloat)cellForHeightAtData:(id)data;//默认44
- (void)showScreen;//显示在屏幕
- (void)hideScreen;//消失在屏幕
//- (void)display;
@end
