//
//  WeiboController.m
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/2.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "WeiboController.h"

#import "WJTable.h"

#import "WeiboCell.h"

@implementation WeiboController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    WJTableViewSection *section = [[WJTableViewSection alloc]initWithCellClass:[WeiboCell class] stroyboard:YES];
    self.sections = @[section];
    
    
    
    section.rowOfDatas =@[
  @{@"t":@"test",@"c":@"adkfl;",@"s":@{@"t":@"adfdasfsadfjiksadfksakldfjklsadklfjaskldjfklasjdfkla",@"c":@"adkfl;askdfkjklasdjfkljaskldfjklasjdfklajsdklfjklasdjfkljasdklfjaklsdjfklasdjfkljsadklfjkasdljfklasdjfkljsadklfjklasdjfkl"}},
  @{@"t":@"adfdasfsadfjiksadfksakldfjklsadklfjaskldjfklasjdfkla",@"c":@"adkfl;askdfkjklasdjfkljaskldfjklasjdfklajsdklfjklasdjfkljasdklfjaklsdjfklasdjfkljsadklfjkasdljfklasdjfkljsadklfjklasdjfkl"},
  @{@"t":@"tefla'sdf;'ksadl;gkl;asggsl;fkgl;ksflgkroewgkiejwiohguiheqwrufhkwhfkjhsdjkfkjsdhfkjahsdfjkhsadfst",@"c":@"adkfl;askdfkjkadsfasdfasdfsadfsadfsdfasdfsadflasdjfkljaskldfjklasjdfklajsdklfjklasdjfkljasdklfjaklsdjfklasdjfkljsadklfjkasdljfklasdjfkljsadklfjklasdjfkl"},
  @{@"t":@"test",@"c":@"adkfl;aasdfasdfasdfasdfasdlfk;lsadkfl;ksadl;flsadkf;sdafsadfskdfkjklasdjfkljaskldfjklasjdfklajsdklfjklasdjfkljasdklfjaklsdjfklasdjfkljsadklfjkasdljfklasdjfkljsadklfjklasdjfkl"}
  ];
    
    
    
}
@end
