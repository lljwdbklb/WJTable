//
//  UILabel+WJ.h
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/7.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WJLabelLayout) {
    WJLabelLayoutWidth,//只修改宽
    WJLabelLayoutHeight,//只修改高
    WJLabelLayoutHave,//都要修改
};

@interface UILabel (WJ)
/**
 *  自动布局的自动排
 */
- (void)sizeToLayoutFits:(CGSize)size type:(WJLabelLayout)type;
//- (void)sizeToFitLayout:(WJLabelLayout)type;
+ (CGSize)sizeToLayoutFits:(CGSize)size text:(NSString *)text attrs:(NSDictionary *)attrs;
@end
