//
//  UIView+WJ.h
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/9.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WJ)
/**
 *  获取约束
 *
 *  @return 没有 nil
 */
- (NSLayoutConstraint *)c_Width;
- (NSLayoutConstraint *)c_Height;
@end
