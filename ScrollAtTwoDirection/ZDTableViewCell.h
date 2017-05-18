//
//  ZDTableViewCell.h
//  ScrollAtTwoDirection
//
//  Created by zhudong on 2017/5/18.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDProductView.h"

@interface ZDTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *leftL;
@property (nonatomic,strong) UIScrollView *scrollV;
@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) ZDProductView *tableV;

@end
