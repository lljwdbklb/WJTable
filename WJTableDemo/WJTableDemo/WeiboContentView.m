//
//  WeiboContentView.m
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/9.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "WeiboContentView.h"

@implementation WeiboContentView
- (void)setData:(id)data {
    [super setData:data];
    if ([data objectForKey:@"s"]) {
        [self.sourceView setData:data[@"s"]];
        [self.sourceView setHidden:NO];
    } else {
        [self.sourceView setHidden:YES];
    }
}

+ (CGRect)viewRectForBounds:(CGRect)bounds data:(id)data {
    CGRect frame = [super viewRectForBounds:bounds data:data];
    frame.size.height -= 21;//label
    frame.size.height += 30;//头像
    if ([data objectForKey:@"s"]) {
        CGRect sFrame = [WeiboBaseView viewRectForBounds:bounds data:data[@"s"]];
        frame.size.height += sFrame.size.height;
    }
    return frame;
}

@end
