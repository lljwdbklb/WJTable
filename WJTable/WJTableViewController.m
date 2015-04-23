//
//  WJTableViewController.m
//  WJTable
//
//  Created by Maxson-001 on 15/3/30.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "WJTableViewController.h"

#import "WJTableViewCell.h"

#import "WJTableViewSection.h"

#import "UITableViewCell+WJ.h"

@interface WJTableViewController ()
@property (strong, nonatomic) NSValue *targetRect;
@end

@implementation WJTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#ifdef __IPHONE_7_0
    self.tableView.estimatedRowHeight = 44;//设置预计值 减少heightForRowAtIndexPath的使用量
#endif
    
}

- (void)setSections:(NSArray *)sections {
    _sections = sections;
    [self.tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(self.sections) {
        return self.sections.count;
    } else {
        if (self.numForSection) {
            return self.numForSection();
        } else {
            return 1;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.sections) {
        WJTableViewSection *s = [self.sections objectAtIndex:section];
        return s.rowOfDatas.count;
    } else {
        if (self.numForRow) {
            return self.numForRow(section);
        } else {
            return 0;
        }
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WJTableViewCell *cell = nil;
    if (self.sections) {
        WJTableViewSection *s = [self.sections objectAtIndex:indexPath.section];
        if (s.isStroyboard) {
            cell = [tableView dequeueReusableCellWithIdentifier:s.cellIdentifier forIndexPath:indexPath];
        } else {
            cell = [tableView dequeueReusableCellWithIdentifier:s.cellIdentifier];
            if (!cell) {
                cell = [[WJTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:s.cellIdentifier];
            }
        }
//        [cell setData:[s.rowOfDatas objectAtIndex:indexPath.row]];
        [self setupCell:cell withIndexPath:indexPath];
    } else {
        cell = self.cellForRow(tableView,indexPath);
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sections) {
        WJTableViewSection *s = [self.sections objectAtIndex:indexPath.section];
        CGFloat height =[s.cellClass cellForHeightAtData:[s.rowOfDatas objectAtIndex:indexPath.row]] + 1/*分割线*/;
        return height;
    } else if(self.cellForRowHeight) {
        return self.cellForRowHeight(tableView, indexPath) + 1/*分割线*/;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WJTableViewSection *s = nil;
    id data = nil;
    if (self.sections) {
        s = [self.sections objectAtIndex:indexPath.section];
        data = [s.rowOfDatas objectAtIndex:indexPath.row];
    }
    if (self.selectCellForRow) {
        self.selectCellForRow(tableView,s,data,indexPath);
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(WJTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[WJTableViewCell class]]) {
//        NSLog(@"show%@",indexPath);
        [cell showScreen];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(WJTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[WJTableViewCell class]]) {
//        NSLog(@"show%@",indexPath);
        [cell hideScreen];
    }
}


#pragma mark - private
- (void)loadCoreForVisibleCells
{
    if (!self.sections) return;//目前只有模块化数据能使用
    NSArray *cells = [self.tableView visibleCells];
    for (WJTableViewCell *cell in cells) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        [self setupCell:cell withIndexPath:indexPath];
    }
}

- (void)setupCell:(WJTableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    if (!self.sections) return;//目前只有模块化数据能使用
    
    WJTableViewSection *s = [self.sections objectAtIndex:indexPath.section];
    id data = [s.rowOfDatas objectAtIndex:indexPath.row];
    if (data&&[cell isLoad:data]) {
        [cell setData:[s.rowOfDatas objectAtIndex:indexPath.row]];
        
        CGRect cellFrame = [self.tableView rectForRowAtIndexPath:indexPath];
        if (self.targetRect && !CGRectIntersectsRect([self.targetRect CGRectValue], cellFrame)) {
            [cell loadCoreData];
        } else {
            [cell LoadCacheData];
        }
    }
    
}

#pragma mark - scroll delegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGRect targetRect = CGRectMake(targetContentOffset->x, targetContentOffset->y, scrollView.frame.size.width, scrollView.frame.size.height);
    self.targetRect = [NSValue valueWithCGRect:targetRect];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.targetRect = nil;
    [self loadCoreForVisibleCells];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.targetRect = nil;
    [self loadCoreForVisibleCells];
}

- (void)dealloc {
    //    [super dealloc];
    NSLog(@"WJ table dealloc");
    self.cellForRow = nil;//继承WJTableViewCell
    self.numForRow = nil;//必填
    self.numForSection = nil;//可选 默认为1
    self.cellForRowHeight = nil;//可选 默认为44
    self.selectCellForRow = nil;//通用
    self.sections = nil;
}

@end
