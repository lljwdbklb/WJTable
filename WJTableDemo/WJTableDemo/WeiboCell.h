//
//  WeiboCell.h
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/2.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "WJTableViewCell.h"
#import "WeiboContentView.h"

@interface WeiboCell : WJTableViewCell
@property (weak, nonatomic) IBOutlet WeiboContentView *cView;
//@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
//@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@end
