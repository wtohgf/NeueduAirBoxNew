//
//  NEUABDevMoniterHomePageViewController.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/18.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABDevMoniterHomePageViewController.h"
#import "NEUABNetworkMngTool.h"
@interface NEUABDevMoniterHomePageViewController ()
- (IBAction)toThermometer:(UIButton *)sender;
- (IBAction)Humidity:(UIButton *)sender;

@end

@implementation NEUABDevMoniterHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backPage:)];
    
   
    
    //[self addThermometer];

    // Do any additional setup after loading the view.
}
-(void)backPage:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (IBAction)toThermometer:(UIButton *)sender {

    [self performSegueWithIdentifier:@"toThermometer" sender:nil];
    

}

- (IBAction)Humidity:(UIButton *)sender {
    [self performSegueWithIdentifier:@"Humidity" sender:nil];
    
}
-(void)viewWillAppear:(BOOL)animated{
//测试取得具体设备参数   test1 正常状态
[[NEUABNetworkMngTool sharedNetworkMngTool]GetinfoAccount:@"13381109915" Equipment:@"KQHZ00000001"];
    //测试取得具体设备参数   test2 异常状态
//    [[NEUABNetworkMngTool sharedNetworkMngTool]GetinfoAccount:@"23622223333" Equipment:@"KQHZ0000001"];
//    //测试取得具体设备参数   test3 异常状态
//    [[NEUABNetworkMngTool sharedNetworkMngTool]GetinfoAccount:@"1362222223333" Equipment:@"KQHZ0000001"];
//    //测试取得具体设备参数   test4 异常状态
//    [[NEUABNetworkMngTool sharedNetworkMngTool]GetinfoAccount:@"136223333" Equipment:@"KQHZ0000001"];
//    //测试取得具体设备参数   test5 异常状态
//    [[NEUABNetworkMngTool sharedNetworkMngTool]GetinfoAccount:@"13622223333" Equipment:@"KQHZ0000000001"];
//    //测试取得具体设备参数   test6 异常状态
//    [[NEUABNetworkMngTool sharedNetworkMngTool]GetinfoAccount:@"13622223333" Equipment:@"KQHZ001"];
//    //测试取得具体设备参数   test7 异常状态
//    [[NEUABNetworkMngTool sharedNetworkMngTool]GetinfoAccount:@"13622223333" Equipment:@"HQHZ0000001"];
//    //若测试设备异常  询问服务器人员异常的仪器
    



}
@end
