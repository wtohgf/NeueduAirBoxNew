//
//  NEUABThermometerSummaryView.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/18.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NEUABCounterView.h"
#import "NEUABThermometerView.h"
#import "NEUABThermometerTubeView.h"
@interface NEUABThermometerSummaryView : UIView
//温度计宽度，线的宽度
@property(nonatomic)float kd;
//zhi
@property(nonatomic)float z;

@property(nonatomic)NEUABThermometerTubeView * sc;

@property(nonatomic)NEUABThermometerView * zj;

@property(nonatomic)NEUABCounterView*ledcount;


@property(nonatomic)CAShapeLayer * shapelayer;
//中心点坐标
@property(nonatomic)CGPoint point;
//半径，底层半径，上层半径，中间层半径
@property(nonatomic)float bj;
//温度计宽度，线的宽度
@property(nonatomic)float sc_kd;
@end
