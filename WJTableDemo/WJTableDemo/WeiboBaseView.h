//
//  WeiboBaseView.h
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/9.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeiboBaseView : UIView
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (strong, nonatomic) id data;

+ (CGRect)viewRectForBounds:(CGRect)bounds data:(id)data;
@end
