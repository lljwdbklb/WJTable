//
//  AnimationCell.m
//  WJTable
//
//  Created by Maxson-001 on 15/3/31.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "AnimationCell.h"
//static BOOL isAnima = NO;

//static BOOL isHide = NO;

@interface AnimationCell ()
@property (assign,nonatomic) BOOL isAnima;

@end

@implementation AnimationCell
- (void)showScreen {
    CGRect toFrame = self.frame;
    CGRect fromFrame = self.frame;
    fromFrame.origin.x = [UIScreen mainScreen].applicationFrame.size.width;
    self.frame = fromFrame;
    self.alpha = 0.0f;
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = toFrame;
        self.alpha = 1.0f;
    } completion:^(BOOL finished) {
    }];
}
- (void)hideScreen {
    CGRect toFrame = self.frame;
    CGRect fromFrame = self.frame;
    toFrame.origin.x = [UIScreen mainScreen].applicationFrame.size.width;
    self.frame = fromFrame;
    
    self.alpha = 1.0f;
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = toFrame;
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
    }];
    
}
@end
