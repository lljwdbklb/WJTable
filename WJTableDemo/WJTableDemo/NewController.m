//
//  NewController.m
//  WJTable
//
//  Created by Maxson-001 on 15/3/30.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "NewController.h"

#include "WJTableViewSection.h"

#include "ScrollCell.h"

#import "UINavigationBar+WJ.h"

#import "UIColor+WJ.h"

//#import <MJRefresh.h>
#define This __weak typeof(self) this = self;

@interface NewController ()

@property (assign, nonatomic) CGFloat proess;

@property (weak, nonatomic) UIView *bgView;

@property (strong, nonatomic) UIImage *oldImage;
@property (strong, nonatomic) UIImage *shadowImage;
@end

@implementation NewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    WJTableViewSection *header = [[WJTableViewSection alloc]init];
    [header setCellClass:[ScrollCell class]];
    header.rowOfDatas = @[@{@"images":@[@"1.png",@"2.png",@"3.png"]}];
    
    static UIImage *images[3];//模拟图片缓存
    images[0] = [UIImage imageNamed:@"1"];
    images[1] = [UIImage imageNamed:@"2"];
    images[2] = [UIImage imageNamed:@"3"];
    
    
    WJTableViewSection *content = [[WJTableViewSection alloc]init];
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        id data = @{@"title":[NSString stringWithFormat:@"hehe%d",i],@"detail":@"AA啊",@"image":images[i%3]};
        [array addObject:data];
    }
    
    content.rowOfDatas = array;
    
    
    self.sections = @[header,content];
    self.selectCellForRow = ^(UITableView* tableView,WJTableViewSection *section, id data, NSIndexPath *indexPath){
        if (indexPath.section) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:data[@"title"] message:data[@"detail"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    };
//    This
    
//    [self.tableView addGifHeaderWithRefreshingBlock:^{
//        [this.tableView.header endRefreshing];
//        NSMutableArray *array = [NSMutableArray array];
//        for (int i = 0; i < 10; i++) {
//            id data = @{@"title":[NSString stringWithFormat:@"hehe%d",i],@"detail":@"AA啊",@"image":[NSString stringWithFormat:@"%d.png",i%3+1]};
//            [array addObject:data];
//        }
//        
//        content.rowOfDatas = array;
//        [this.tableView reloadData];
//    }];
//    
//    [self.tableView addLegendFooterWithRefreshingBlock:^{
//        [this.tableView.footer endRefreshing];
//        NSMutableArray *array = (NSMutableArray *)content.rowOfDatas ;
//        NSInteger count = array.count;
//        for (int i = 0; i < 10; i++) {
//            id data = @{@"title":[NSString stringWithFormat:@"hehe%d",i+count],@"detail":@"AA啊",@"image":[NSString stringWithFormat:@"%d.png",i%3+1]};
//            [array addObject:data];
//        }
//        [this.tableView reloadData];
////        content.rowOfDatas = array;
//    }];
//    uiedi
    
//    CALayer *layer = [[CALayer alloc]init];
//    [layer setBackgroundColor:[UIColor blackColor].CGColor];
////    [self.navigationController.navigationBar.layer addSublayer:layer];
//    self.layer = layer;
//    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
//    self.oldImage = [self.navigationController.navigationBar backIndicatorImage];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"1"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
//    [self.navigationController.navigationBar setProess:0.0];
//    UIView *view = [[UIView alloc]initWithFrame:self.navigationController.navigationBar.bounds];
//    [view setBackgroundColor:[UIColor blueColor]];
//    [view setAlpha:0];
//    [self.navigationController.navigationBar insertSubview:view atIndex:0];
//    self.bgView = view;
//    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.oldImage = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[RGBA(200, 100, 0, 0.8) imageForSize:CGSizeMake(1, 1)] forBarMetrics:UIBarMetricsDefault];
    self.shadowImage = self.navigationController.navigationBar.shadowImage;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    [self.navigationController.navigationBar setProess:0.0];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.oldImage = [self.navigationController.navigationBar backIndicatorImage];
    [self.navigationController.navigationBar setBackgroundImage:self.oldImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:self.shadowImage];
    [self.navigationController.navigationBar setProess:1.0];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y <= 64) {
        CGFloat proess = (scrollView.contentOffset.y+64) / 64.0;
        NSLog(@"proess = %f",proess);
        self.proess = proess;
    }
}

- (void)setProess:(CGFloat)proess {
//    self.layer
    [UIView beginAnimations:@"" context:nil];
    [self.navigationController.navigationBar setProess:proess];
    [UIView commitAnimations];
}
@end
