//
//  SectionHeaderView.h
//  QQListTableDemo
//
//  Created by ChowShayne on 15/4/24.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupModel.h"

// 自定义协议
@protocol HeaderViewDelegate <NSObject>
// 协议方法
@optional
- (void)clickView;

@end

@interface SectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic, assign) id<HeaderViewDelegate> delegate;
@property (nonatomic, strong) GroupModel *groupModel;

+ (instancetype)headerView:(UITableView *)tableView;

@end
