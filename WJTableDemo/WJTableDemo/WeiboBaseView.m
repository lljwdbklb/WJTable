//
//  WeiboBaseView.m
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/9.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "WeiboBaseView.h"

#include "UILabel+WJ.h"

#import "UIView+WJ.h"

@implementation WeiboBaseView
- (void)setData:(id)data {
    _data = data;
    [self.userNameLabel setText:data[@"t"]];
    CGFloat wx = [UIScreen mainScreen].applicationFrame.size.width - 10 - 40 - 10 - 10 - 22 - 10;
    [self.userNameLabel sizeToLayoutFits:CGSizeMake(wx, 0) type:WJLabelLayoutWidth];
    [self.contentLabel setText:data[@"c"]];
    CGFloat w = [UIScreen mainScreen].applicationFrame.size.width - 20;
    [self.contentLabel sizeToLayoutFits:CGSizeMake(w, CGFLOAT_MAX) type:WJLabelLayoutHeight];
    
    NSLayoutConstraint *height = [self c_Height];
    if (height) {
        CGRect frame = [[self class] viewRectForBounds:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, CGFLOAT_MAX) data:data];
        height.constant = frame.size.height;
    }
    
}


+ (CGRect)viewRectForBounds:(CGRect)bounds data:(id)data {
    CGRect frame = CGRectZero;
    if (data) {        
        //10    顶部间距
        //21    name高度
        //10    内容顶部间距
        //h     内容高度
        //10    内容底部间距
        frame.origin = CGPointZero;
        frame.size.width = bounds.size.width;
        
        CGFloat w = bounds.size.width - 20;
        
        CGSize size = [UILabel sizeToLayoutFits:CGSizeMake(w, CGFLOAT_MAX) text:data[@"c"] attrs:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
        frame.size.height = 10 + 21 + 10 + size.height + 10;
        if (frame.size.height > bounds.size.height) {//不能超过
            frame.size.height = bounds.size.height;
        }
    }
    
    return frame;
}

@end
