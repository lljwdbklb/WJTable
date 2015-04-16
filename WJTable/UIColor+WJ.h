//
//  UIColor+WJ.h
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/14.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import <UIKit/UIKit.h>


#define RGBA(r,g,b,a) [UIColor colorWithRed:((r)/255.0) green:((g)/255.0) blue:((b)/255.0) alpha:(a)]
#define ColorValueA(value,a) RGBA(((0x##value & 0x00ff0000) >> 16) , ((0x##value & 0x0000ff00) >> 8) , (0x##value & 0xff), (a))

@interface UIColor (WJ)

//生成一张图片
- (UIImage *)imageForSize:(CGSize)size;
@end
