//
//  UILabel+WJ.m
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/7.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "UILabel+WJ.h"

#import "UIView+WJ.h"

@implementation UILabel (WJ)

- (void)sizeToLayoutFits:(CGSize)size type:(WJLabelLayout)type {
    if (self.constraints) {
        __block NSLayoutConstraint *height = [self c_Height];
        __block NSLayoutConstraint *width = [self c_Width];
//        if (!height) {
//            [self.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *obj, NSUInteger idx, BOOL *stop) {
//                NSLog(@"\n========================\n label %@\n ========================",obj.firstItem);
//                if (obj.firstItem == self) {
//                    if (obj.firstAttribute == NSLayoutAttributeHeight) {
//                        height = obj;
////                        *stop = YES;
//                    } else if(obj.firstAttribute == NSLayoutAttributeWidth) {
//                        width = obj;
//                    }
//                }
//            }];
//        }
        [self.text sizeWithFont:nil];
//        CGSize size = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
        CGSize s = [[self class] sizeToLayoutFits:size text:self.text attrs:@{NSFontAttributeName:self.font}];
//#ifdef __IPHONE_7_0
//        frame = [self.text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font} context:nil];
//#else
//        frame = (CGRect){CGPointZero,[self.text sizeWithFont:self.font constrainedToSize:size]};
//#endif
        if (type == WJLabelLayoutWidth) {
            if (width) {
                width.constant = s.width;
            }
        } else if (type == WJLabelLayoutHeight) {
            if (height) {
                height.constant = s.height;
            }
        } else {
            if (width) {
                width.constant = s.width;
            }
            if (height) {
                height.constant = s.height;
            }
        }
    } else {
        NSLog(@"No constraint");
    }
}

+ (CGSize)sizeToLayoutFits:(CGSize)size text:(NSString *)text attrs:(NSDictionary *)attrs  {
    UILabel *label = [[self alloc]init];
    [label setText:text];
    [label setFont: [attrs objectForKey:NSFontAttributeName]];
    [label setNumberOfLines:NSIntegerMax];
    CGRect frame = [label textRectForBounds:(CGRect){CGPointZero,size} limitedToNumberOfLines:NSIntegerMax];
    label = nil;
    
//#ifdef __IPHONE_7_0
//    frame = [text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
//#else
//    frame = (CGRect){CGPointZero,[text sizeWithFont:[attrs objectForKey:NSFontAttributeName] constrainedToSize:size]};
//#endif
    return frame.size;
}


@end
