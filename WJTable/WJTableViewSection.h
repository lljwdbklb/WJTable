//
//  WJTableViewSection.h
//  WJTable
//
//  Created by Maxson-001 on 15/3/30.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//
//  模块化

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class WJTableViewSection;
@class WJTableViewCell;

//typedef CGFloat(^WJRowHeight)(NSIndexPath *indexPath);

typedef void(^CellForRowOpeation)(UITableView *tableView
                                  , WJTableViewSection *section
                                  , WJTableViewCell *cell
                                  , NSIndexPath *indexPath);

@interface WJTableViewSection : NSObject
//height for row

- (instancetype)initWithCellClass:(Class)cellClass stroyboard:(BOOL)stroyboard;


@property (assign, nonatomic) Class noDataCellClass;
@property (strong, nonatomic) NSString *noDataCellIdentifier;

@property (assign, nonatomic) Class cellClass;//默认WJTableViewCell
@property (strong, nonatomic, readonly) NSString *cellIdentifier;//NSStringFromClass(cellClass)
@property (strong, nonatomic) NSArray *rowOfDatas;//自动setData:

@property (assign, nonatomic, getter=isStroyboard) BOOL stroyboard;//默认YES

@property (copy, nonatomic) CellForRowOpeation cellForRowOpeation;

@end
