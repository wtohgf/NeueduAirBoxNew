//
//  NEUABBaseViewController.m
//  NeueduAirBox
//
//  Created by hegf on 15/11/16.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABBaseViewController.h"

@interface NEUABBaseViewController ()

@end

@implementation NEUABBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //统一修改导航栏的背景以及文字颜色
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bg"] forBarMetrics:UIBarMetricsDefault];
    NSDictionary* barTextAttr = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [self.navigationBar setTitleTextAttributes:barTextAttr];
    
    //返回按钮设置成白色
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
