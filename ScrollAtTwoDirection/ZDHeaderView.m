//
//  ZDHeaderView.m
//  ScrollAtTwoDirection
//
//  Created by zhudong on 2017/5/18.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDHeaderView.h"

@implementation ZDHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.leftL = [[UILabel alloc] init];
        self.leftL.text = @"名称";
        [self.leftL sizeToFit];
        self.leftL.frame = CGRectMake(10, (HeaderHeight - self.leftL.bounds.size.height) * 0.5, (ScreenSize.width - 20) / 3.0, self.leftL.bounds.size.height);
        self.scrollV = [[UIScrollView alloc] initWithFrame: CGRectMake(10 + (ScreenSize.width - 20) / 3.0, 0, (ScreenSize.width - 20) * 2 / 3.0, 44)];
        self.scrollV.scrollEnabled = false;
        [self addSubview:self.leftL];
        [self addSubview:self.scrollV];
    }
    return self;
}

- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    self.leftL.text = titles[0];
    self.scrollV.contentSize = CGSizeMake(TitleWidth * (titles.count - 1), HeaderHeight);
    for (int i = 0; i < titles.count - 2; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = titles[i + 1];
        label.frame = CGRectMake(i * TitleWidth, 0, TitleWidth, HeaderHeight);
        [self.scrollV addSubview:label];
    }
}

@end
