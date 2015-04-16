//
//  UIView+WJ.m
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/9.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "UIView+WJ.h"

@implementation UIView (WJ)
- (NSLayoutConstraint *)c_Width {
    __block NSLayoutConstraint *w = nil;
    [self.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *obj, NSUInteger idx, BOOL *stop) {
//        NSLog(@"\n========================\n label %@\n ========================",obj.firstItem);
        if (obj.firstItem == self) {
            if(obj.firstAttribute == NSLayoutAttributeWidth) {
                w = obj;
            }
        }
    }];
    return w;
}

- (NSLayoutConstraint *)c_Height {
    __block NSLayoutConstraint *h = nil;
    [self.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *obj, NSUInteger idx, BOOL *stop) {
//        NSLog(@"\n========================\n label %@\n ========================",obj.firstItem);
        if (obj.firstItem == self) {
            if(obj.firstAttribute == NSLayoutAttributeHeight) {
                h = obj;
            }
        }
    }];
    return h;
}
@end
