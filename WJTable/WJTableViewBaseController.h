//
//  WJTableViewBaseController.h
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/10.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WJTableViewController.h"

@interface WJTableViewBaseController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


#pragma mark 模块化设置
@property (copy, nonatomic)NSArray *sections;
//@property (copy, nonatomic)CellForRow row;//继承WJTableViewCell


#pragma mark 自定义化
@property (copy, nonatomic) CellForRow cellForRow;//继承WJTableViewCell
@property (copy, nonatomic) NumForRow numForRow;//必填
@property (copy, nonatomic) NumForSection numForSection;//可选 默认为1
@property (copy, nonatomic) CellForRowHeight cellForRowHeight;//可选 默认为44



@property (copy, nonatomic) SelectCellForRow selectCellForRow;//通用
@end
