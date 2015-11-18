//
//  NEUABDevMoniterViewController.h
//  NeueduAirBox
//
//  Created by hegf on 15/11/17.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JBLineChartView.h>
#import "NEUABThermometerSummaryView.h"
@interface NEUABDevMoniterViewController : UIViewController<JBLineChartViewDataSource, JBLineChartViewDelegate>
@property(nonatomic)NEUABThermometerSummaryView*Thermometer;

@end
