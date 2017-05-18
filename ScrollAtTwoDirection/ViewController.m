//
//  ViewController.m
//  ScrollAtTwoDirection
//
//  Created by zhudong on 2017/5/17.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ViewController.h"
#import "ZDProductView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZDProductView *productV = [[ZDProductView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    NSLog(@"%@", NSStringFromUIEdgeInsets(productV.contentInset));
    [self.view addSubview:productV];
    NSLog(@"%@", NSStringFromUIEdgeInsets(productV.contentInset));
    NSArray *titles = @[@[@"名称", @"现价", @"昨结价", @"最高价", @"最低价",],
                       @[@"亚宝药业", @"30.0", @"35.0", @"36.0", @"28.0",],
                        @[@"上证指数", @"3000.0", @"3500.0", @"3600.0", @"2800.0",],
                        @[@"深证指数", @"2800.0", @"35.0", @"36.0", @"28.0",],];
    productV.titles = titles;
}
@end
