//
//  UIColor+WJ.m
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/14.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "UIColor+WJ.h"

@implementation UIColor (WJ)

- (UIImage *)imageForSize:(CGSize)size {
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //    CGContextAddRect(context, CGRectMake(0, 0, size.width, size.height));
    CGContextSetFillColorWithColor(context, self.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    CGContextStrokePath(context);
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
