//
//  ZDTableViewCell.m
//  ScrollAtTwoDirection
//
//  Created by zhudong on 2017/5/18.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDTableViewCell.h"
#import "ZDHeaderView.h"

@interface ZDTableViewCell ()<UIScrollViewDelegate>

@end
@implementation ZDTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.leftL = [[UILabel alloc] init];
    self.leftL.text = @"名称";
    [self.leftL sizeToFit];
    self.leftL.frame = CGRectMake(10, (HeaderHeight - self.leftL.bounds.size.height) * 0.5, (ScreenSize.width - 20) / 3.0, self.leftL.bounds.size.height);
    self.scrollV = [[UIScrollView alloc] initWithFrame: CGRectMake(10 + (ScreenSize.width - 20) / 3.0, 0, (ScreenSize.width - 20) * 2 / 3.0, 44)];
    self.scrollV.delegate = self;
    self.scrollV.showsVerticalScrollIndicator = false;
    self.scrollV.showsHorizontalScrollIndicator = false;
    [self.contentView addSubview:self.leftL];
    [self.contentView addSubview:self.scrollV];
    
}

- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    self.leftL.text = titles[0];
    self.scrollV.contentSize = CGSizeMake(TitleWidth * (titles.count - 1), HeaderHeight);
    for (int i = 0; i < titles.count - 2; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = titles[i + 1];
        label.frame = CGRectMake(i * TitleWidth, 0, TitleWidth, self.contentView.bounds.size.height);
        [self.scrollV addSubview:label];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSArray *cells = self.tableV.visibleCells;
    [cells enumerateObjectsUsingBlock:^(ZDTableViewCell *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj != self) {
            obj.scrollV.contentOffset = scrollView.contentOffset;
        }
    }];
    
    ZDHeaderView *headerV = self.tableV.headerV;
    headerV.scrollV.contentOffset = scrollView.contentOffset;
}
@end
