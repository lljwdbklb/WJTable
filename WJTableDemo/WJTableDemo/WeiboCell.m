//
//  WeiboCell.m
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/2.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "WeiboCell.h"
#import "UILabel+WJ.h"


/**
 *  t
 *  c
 */
@implementation WeiboCell


- (void)awakeFromNib {
    [super awakeFromNib];
//    [self.layer setShadowOffset:CGSizeMake(0, 1)];
//    [self.layer setShadowRadius:0.5];
//    [self.layer setShadowOpacity:0.2];
//    [self.layer setShadowColor:[UIColor blackColor].CGColor];
//    [self.toolView.layer setShadowOffset:CGSizeMake(0, 2)]
    [self.toolView.layer setShadowRadius:0.5];
    [self.toolView.layer setShadowOpacity:0.5];
    [self.toolView.layer setShadowOffset:CGSizeMake(0, 0.1)];
    
}

- (void)setData:(id)data {
    [super setData:data];
    [self.cView setData:data];
//    [self.userNameLabel setText:data[@"t"]];
//    CGFloat wx = [UIScreen mainScreen].applicationFrame.size.width - 10 - 40 - 10 - 10 - 22 - 10;
//    [self.userNameLabel sizeToLayoutFits:CGSizeMake(wx, 0) type:WJLabelLayoutWidth];
//    [self.contentLabel setText:data[@"c"]];
//    CGFloat w = [UIScreen mainScreen].applicationFrame.size.width - 20;
//    [self.contentLabel sizeToLayoutFits:CGSizeMake(w, CGFLOAT_MAX) type:WJLabelLayoutHeight];
}


+ (CGFloat)cellForHeightAtData:(id)data {
    //10                高度间距
    //10                头像间距
    //iPhone6p?40:30    头像高度
    //10                内容间距
    //x                 文本高度
    //10                底部与内容间距
    //44                底部按钮
    
//    CGFloat w = [UIScreen mainScreen].applicationFrame.size.width - 20;
//    CGSize size = [UILabel sizeToLayoutFits:CGSizeMake(w, CGFLOAT_MAX) text:data[@"c"] attrs:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
//    return 114 + size.height;
    CGRect frame = [WeiboContentView viewRectForBounds:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, CGFLOAT_MAX) data:data];
    return frame.size.height + 44;
}
@end
