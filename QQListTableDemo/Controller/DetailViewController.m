//
//  DetailViewController.m
//  QQListTableDemo
//
//  Created by ChowShayne on 15/4/24.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "DetailViewController.h"

CGFloat btnW = 100;
CGFloat bthH = 40;
#define  kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((kScreenWidth - btnW)/2, (kScreenHeight-bthH)/2, btnW, bthH);
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)popView{
    [self.navigationController popViewControllerAnimated:YES];
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
