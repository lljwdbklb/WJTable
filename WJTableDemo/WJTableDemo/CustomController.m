//
//  CustomController.m
//  WJTable
//
//  Created by Maxson-001 on 15/3/31.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "CustomController.h"

#import "WJTable.h"

@implementation CustomController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    static BOOL flags[8];
//    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    self.numForSection = ^NSInteger(){
        return 8;
    };
    self.numForRow =^NSInteger(NSInteger section) {
        if (flags[section]) {
            return 2;
        } else {
            return 1;
        }
    };
    self.cellForRow = ^WJTableViewCell *(UITableView* tableView, NSIndexPath *indexPath) {
        WJTableViewCell *cell = nil;
        if (indexPath.row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell" forIndexPath:indexPath];
        } else {
            cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
        }
        return cell;
    };
    
    self.cellForRowHeight = ^CGFloat(UITableView* tableView, NSIndexPath *indexPath){
        if (indexPath.row == 0) {
            return 80.f;
        } else {
            return 170.f;
        }
    };
    
    self.selectCellForRow = ^(UITableView* tableView,WJTableViewSection *section, id data, NSIndexPath *indexPath) {
        if (indexPath.row == 0) {
            flags[indexPath.section] = !flags[indexPath.section];
            if (flags[indexPath.section]) {
                [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationTop];
            } else {
                [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationTop];
            }
            [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        }
    };
    
}
@end
