//
//  UITableViewCell+WJ.h
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/1.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (WJ)

- (void)loadCoreData;//核心数据
- (void)LoadCacheData;//缓存数据
- (BOOL)isLoad:(id)data;//是否要读取
@end
