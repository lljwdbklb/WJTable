//
//  UINavigationBar+WJ.m
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/13.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "UINavigationBar+WJ.h"
#import <objc/runtime.h>

@implementation UINavigationBar (WJ)

- (UIView *)bg {
    Ivar i = class_getInstanceVariable([self class],"_backgroundView");
    
    return object_getIvar(self, i);
}

- (void)setProess:(CGFloat)proess {
    self.bg.alpha = proess;
}
- (CGFloat)proess {
    return self.bg.alpha;
}
@end
