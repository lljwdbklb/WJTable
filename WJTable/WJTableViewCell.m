//
//  WJTableViewCell.m
//  WJTable
//
//  Created by Maxson-001 on 15/3/30.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "WJTableViewCell.h"

@implementation WJTableViewCell

- (void)awakeFromNib {
//    self.imageView.image = [UIImage imageNamed:@"default"];
}

- (void)setData:(id)data {
    _data = data;
    NSString *title = [data objectForKey:@"title"];
    NSString *detail = [data objectForKey:@"detail"];
    
    if (title) {
        self.textLabel.text = title;
    }
    
    if (detail) {
        self.detailTextLabel.text = detail;
    }
    
    
    UIImage *image = [_data objectForKey:@"image"];
    if (image) {
        [self.imageView setImage:image];
    } else {
        NSString *imageStr = [_data objectForKey:@"imagestr"];
        if (imageStr) {
            [self.imageView setImage:[UIImage imageNamed:imageStr]];
        }
    }
    
    UIColor *bgColor = [_data objectForKey:@"bgcolor"];
    if (bgColor && [bgColor isKindOfClass:[UIColor class]]) {
        self.backgroundColor = bgColor;
    }
    
    
}
+ (CGFloat)cellForHeightAtData:(id)data {
    return 44;
}

- (void)showScreen {
    
}

- (void)hideScreen {
    
}


- (BOOL)isLoad:(id)data {
    return ![self.data isEqual:data];
}

-(void)dealloc {
    NSLog(@"WJ cell dealloc");
    _data = nil;
}
@end
