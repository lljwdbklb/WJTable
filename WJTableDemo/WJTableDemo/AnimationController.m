//
//  AnimationController.m
//  WJTable
//
//  Created by Maxson-001 on 15/3/31.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "AnimationController.h"

#import "WJTable.h"

#import "AnimationCell.h"

@implementation AnimationController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[[UIColor blackColor],    // 0.0 white
                       [UIColor darkGrayColor],   // 0.333 white
                       [UIColor lightGrayColor],  // 0.667 white
//                       [UIColor whiteColor],      // 1.0 white
                       [UIColor grayColor],       // 0.5 white
                       [UIColor redColor],        // 1.0, 0.0, 0.0 RGB
                       [UIColor greenColor],      // 0.0, 1.0, 0.0 RGB
                       [UIColor blueColor],       // 0.0, 0.0, 1.0 RGB
                       [UIColor cyanColor],       // 0.0, 1.0, 1.0 RGB
                       [UIColor yellowColor],     // 1.0, 1.0, 0.0 RGB
                       [UIColor magentaColor],    // 1.0, 0.0, 1.0 RGB
                       [UIColor orangeColor],     // 1.0, 0.5, 0.0 RGB 
                       [UIColor purpleColor],     // 0.5, 0.0, 0.5 RGB 
                       [UIColor brownColor],      // 0.6, 0.4, 0.2 RGB 
//                       [UIColor clearColor]
                       ];
    
    WJTableViewSection *section = [[WJTableViewSection alloc]init];
    [section setCellClass:[AnimationCell class]];
    NSMutableArray *aM = [@[]mutableCopy];
//    for (UIColor *color in array) {
//        id p = @{@"bgcolor":color};
//        [aM addObject:p];
//    }

    for (int i = 0; i < array.count * 2; i++) {
        UIColor *color = array[i % array.count];
        id p = @{@"bgc":color};
        [aM addObject:p];
    }
    
    
    section.rowOfDatas = aM;
    
    self.sections = @[section];
    
}
@end
