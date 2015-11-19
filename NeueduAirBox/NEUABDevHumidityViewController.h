//
//  NEUABDevHumidityViewController.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/18.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PercentageChart.h"
@interface NEUABDevHumidityViewController : UIViewController
{
    IBOutlet PercentageChart *chart;}

- (IBAction)ongo:(UIButton *)sender;
@property(nonatomic)NSTimer*timer;
@property(nonatomic)BOOL isclick;

@end
