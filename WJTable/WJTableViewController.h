//
//  WJTableViewController.h
//  WJTable
//
//  Created by Maxson-001 on 15/3/30.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJTableViewCell;
@class WJTableViewSection;
typedef NSInteger(^NumForRow)(NSInteger section);
typedef NSInteger(^NumForSection)();
typedef WJTableViewCell *(^CellForRow)(UITableView* tableView, NSIndexPath *indexPath);
typedef CGFloat (^CellForRowHeight)(UITableView* tableView, NSIndexPath *indexPath);
typedef void(^SelectCellForRow)(UITableView* tableView, WJTableViewSection *section, id data, NSIndexPath *indexPath);


@interface WJTableViewController : UITableViewController

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
