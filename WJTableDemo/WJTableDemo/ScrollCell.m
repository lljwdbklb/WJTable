//
//  ScrollCell.m
//  WJTable
//
//  Created by Maxson-001 on 15/3/30.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "ScrollCell.h"

@implementation ScrollCell
- (void)setData:(id)data {
    [super setData:data];
    NSArray *images = [data objectForKey:@"images"];
    if (images) {
        if (![self.scrollView viewWithTag:100]) {
            [images enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:(CGRect){{idx * self.frame.size.width,0},self.frame.size}];
                [imageView setTag:100+idx];
                [imageView setContentMode:UIViewContentModeScaleToFill];
                [self.scrollView addSubview:imageView];
            }];
        }
        
        [images enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UIImageView *imageView = (UIImageView *)[self.scrollView viewWithTag:100+idx];
//            [imageView setTag:100+idx];
//            [self.scrollView addSubview:imageView];
            [imageView setImage:[UIImage imageNamed:obj]];
        }];
        [self.scrollView setContentSize:CGSizeMake(images.count * [UIScreen mainScreen].applicationFrame.size.width, 0)];
    }
}

+ (CGFloat)cellForHeightAtData:(id)data {
    return 200;
}
@end
