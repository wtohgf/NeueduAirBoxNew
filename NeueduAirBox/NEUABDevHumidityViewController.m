//
//  NEUABDevHumidityViewController.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/18.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABDevHumidityViewController.h"

@interface NEUABDevHumidityViewController ()
{
    CGFloat _percentage;
}
@end

@implementation NEUABDevHumidityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isclick=YES;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backPage:)];
    _percentage = 10.0;
    
    
    UIColor *orange = [UIColor colorWithRed:0.83 green:0.38 blue:0.0 alpha:1.0];
    
    [chart setMainColor:orange];
    [chart setSecondaryColor:[UIColor darkGrayColor]];
    [chart setLineColor:[UIColor orangeColor]];
    [chart setFontName:@"Helvetica-Bold"];
    [chart setFontSize:30.0];
    [chart setText:@"湿度含量"];
    //初始角度
    [chart setPercentage:20];

//    UILabel * lbl = [[UILabel alloc] initWithFrame:CGRectMake(205.0, 100.0, 100.0, 1.0)];
//    lbl.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:lbl];
    
    // Do any additional setup after loading the view.
 
    // Do any additional setup after loading the view.
}
-(void)backPage:(id)sender{
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
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)ongo:(UIButton *)sender {
    if (_isclick==YES) {
        _timer =  [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(function) userInfo:nil repeats:YES];
       // _isclick=!_isclick;
        
    }else{
    [_timer setFireDate:[NSDate distantFuture]];
       

    }
    
   _isclick=!_isclick;

    
}
-(void)function{
    chart.percentage = _percentage;
    CGFloat randomData = (CGFloat)(arc4random_uniform(1000)/10.f);
    _percentage =randomData;
    if( _percentage > 100.0 )
        _percentage -= 101.0;
    
    }

@end
