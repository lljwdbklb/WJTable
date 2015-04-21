//
//  LabelViewController.m
//  WJTableDemo
//
//  Created by Maxson-001 on 15/4/10.
//  Copyright (c) 2015年 WhoJun. All rights reserved.
//

#import "LabelViewController.h"

#import "WJLabel.h"
//#import "RegexKitLite.h"

@interface LabelViewController ()

@end

@implementation LabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 70.0, 320.0, 100.0)];
//    [label setTextColor:[UIColor blackColor]];
//    [label setBackgroundColor:[UIColor blackColor]];
//    [label setTouchSelect:YES];
    [self.view addSubview:label];
    NSString * str = @"xxxxxxxxxxx@dasdfl xxxxx#asdfsadf#xxxxx";
//    NSArray *array = [str componentsSeparatedByRegex:@"@\\w+"];
//    NSRange range = [str rangeOfRegex:@"#\\w+#"];
//    NSString *strR = [str substringWithRange:range];
//    NSLog(@"%@",array);
    [label setText:str];
    
//    [self.view setBackgroundColor:[UIColor redColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
