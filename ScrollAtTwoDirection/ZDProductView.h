//
//  ZDProductView.h
//  ScrollAtTwoDirection
//
//  Created by zhudong on 2017/5/17.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDHeaderView.h"

@interface ZDProductView : UITableView

@property (nonatomic,strong) NSArray *titles;
@property (nonatomic, strong) ZDHeaderView *headerV;

@end
