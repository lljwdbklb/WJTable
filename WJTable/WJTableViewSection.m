//
//  WJTableViewSection.m
//  WJTable
//
//  Created by Maxson-001 on 15/3/30.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "WJTableViewSection.h"

#import "WJTableViewCell.h"

@implementation WJTableViewSection
- (instancetype)init {
    if (self = [super init]) {
        self.cellClass = [WJTableViewCell class];
        self.stroyboard = YES;
    }
    return self;
}


- (instancetype)initWithCellClass:(Class)cellClass stroyboard:(BOOL)stroyboard {
    if (self = [self init]) {
        if (cellClass) {
            self.cellClass = cellClass;
        }
        self.stroyboard = stroyboard;
    }
    return self;
}

- (void)setCellClass:(Class)cellClass {
    _cellClass = cellClass;
    _cellIdentifier = NSStringFromClass(cellClass);
}

- (void)setNoDataCellClass:(Class)noDataCellClass {
    _noDataCellClass = noDataCellClass;
    _noDataCellIdentifier = NSStringFromClass(noDataCellClass);
}

- (void)dealloc {
    NSLog(@"WJ section dealloc");
    self.rowOfDatas = nil;
}

@end
