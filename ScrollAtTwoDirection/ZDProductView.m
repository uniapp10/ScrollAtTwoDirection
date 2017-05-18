//
//  ZDProductView.m
//  ScrollAtTwoDirection
//
//  Created by zhudong on 2017/5/17.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDProductView.h"
#import "ZDTableViewCell.h"

@interface ZDProductView ()<UITableViewDataSource, UITableViewDelegate>



@end
@implementation ZDProductView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.headerV;
}

- (ZDHeaderView *)headerV{
    if (!_headerV) {
        _headerV = [[ZDHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, HeaderHeight)];
    }
    return _headerV;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return HeaderHeight;
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDTableViewCell"];
    if (!cell) {
        cell = [[ZDTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZDTableViewCell"];
    }
    cell.titles = self.titles[indexPath.row + 1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.tableV = self;
    return cell;
}

- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    NSArray *firstA = titles.firstObject;
    self.headerV.titles = firstA;
    
    [self reloadData];
}


@end
