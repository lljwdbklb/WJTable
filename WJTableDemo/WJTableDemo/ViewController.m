//
//  ViewController.m
//  WJTable
//
//  Created by Maxson-001 on 15/3/27.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "ViewController.h"
#import "WJTableViewSection.h"

#import "NewController.h"
#import "LabelViewController.h"


#define This __weak typeof(self) this = self;

@interface ViewController ()

@end

@implementation ViewController

+ (NSString *)nextPushClass:(NSInteger)index {
    return [@[@"CustomController",@"NewController",@"AnimationController",@"WeiboController",@"LabelViewController"] objectAtIndex:index];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WJTableViewSection *section = [[WJTableViewSection alloc]initWithCellClass:nil stroyboard:NO];
    [section setRowOfDatas:@[@{@"t":@"自定义Cell"      ,@"d":@"自定义开发tableView"},
                             @{@"t":@"新闻Cell"       ,@"d":@"常用新闻tableView"},
                             @{@"t":@"特效Cell"       ,@"d":@"特效tableView"},
                             @{@"t":@"微博形式Cell"     ,@"d":@"微博形式tableView"},
                             @{@"t":@"Label Test"   ,@"d":@"Label Test"}
                             ]];
    
    
    self.sections =@[section];
    This
    [self setSelectCellForRow:^(UITableView* tableView,WJTableViewSection *section, id data, NSIndexPath *indexPath){
//        UIViewController *c = [[[ViewController nextPushClass:indexPath.row] alloc]init];
//        [this.navigationController pushViewController:c animated:YES];
        [this performSegueWithIdentifier:[ViewController nextPushClass:indexPath.row] sender:data];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *viewController = segue.destinationViewController;
    [viewController setTitle:sender[@"t"]];
}

@end
