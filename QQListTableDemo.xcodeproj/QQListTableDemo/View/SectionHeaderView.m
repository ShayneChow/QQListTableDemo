//
//  SectionHeaderView.m
//  QQListTableDemo
//
//  Created by ChowShayne on 15/4/24.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "SectionHeaderView.h"

@implementation SectionHeaderView{
    UIButton *_arrowBtn;
    UILabel *_label;
}

+ (instancetype)headerView:(UITableView *)tableView{
    static NSString *identifier = @"header";
    SectionHeaderView *header = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!header) {
        header = [[SectionHeaderView alloc] initWithReuseIdentifier:identifier];
    }
    return header;
}

// 重写 initWithReuseIdentifier: 方法
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super init]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.imageView.contentMode = UIViewContentModeCenter;
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        button.imageView.clipsToBounds = NO; // 不裁剪图片, btn旋转时图片大小不变，针对didMoveToSuperview方法
        _arrowBtn = button;
        [self addSubview:_arrowBtn];
        //创建label，显示当前在线人数
        UILabel *labelRight = [[UILabel alloc] init];
        labelRight.textAlignment = NSTextAlignmentCenter;
        _label = labelRight;
        [self addSubview:_label];
    }
    return self;
}

#pragma mark - buttonAction方法
- (void)buttonAction{
    self.groupModel.isOpen = !self.groupModel.isOpen;
    if ([self.delegate respondsToSelector:@selector(clickView)]) {
        [self.delegate clickView];
    }
}

- (void)didMoveToSuperview{
    _arrowBtn.imageView.transform = self.groupModel.isOpen ? CGAffineTransformMakeRotation(M_PI_2) :CGAffineTransformMakeRotation(0);
}

//布局
- (void)layoutSubviews{
    [super layoutSubviews];
    _arrowBtn.frame = self.bounds;
    _label.frame = CGRectMake(self.frame.size.width - 70, 0, 60, self.frame.size.height);
}
//赋值
- (void)setGroupModel:(GroupModel *)groupModel{
    _groupModel = groupModel;
    [_arrowBtn setTitle:_groupModel.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%@/%lu",_groupModel.online,(unsigned long)_groupModel.friends.count];
}

@end
