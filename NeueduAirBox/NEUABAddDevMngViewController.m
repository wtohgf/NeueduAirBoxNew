//
//  NEUABAddDevMngViewController.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/17.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABAddDevMngViewController.h"

@interface NEUABAddDevMngViewController ()

@end

@implementation NEUABAddDevMngViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)yousureAdd:(UIButton *)sender {
    
    UIAlertView*alt=[[UIAlertView alloc]initWithTitle:@"提示" message:@"您输入的序列号不存在" delegate:self cancelButtonTitle:@"算了" otherButtonTitles:@"点我重新输入", nil];
    [alt show];
    
    UIAlertView*alt2=[[UIAlertView alloc]initWithTitle:@"提示" message:@"您输入的序列号与密钥不匹配" delegate:self cancelButtonTitle:@"算了" otherButtonTitles:@"点我重新输入", nil];
    [alt2 show];
    UIAlertView*alt3=[[UIAlertView alloc]initWithTitle:@"提示" message:@"设备添加成功！" delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil];
    [alt3 show];
    
    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{


    if (buttonIndex==1) {
        NSLog(@"1index");
        
    }else{
    
        NSLog(@"2index");
        
    }



}





@end
