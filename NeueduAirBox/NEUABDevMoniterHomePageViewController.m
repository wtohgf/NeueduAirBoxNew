//
//  NEUABDevMoniterHomePageViewController.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/18.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABDevMoniterHomePageViewController.h"

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
@end
