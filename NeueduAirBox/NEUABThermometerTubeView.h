//
//  NEUABThermometerTubeView.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/18.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEUABThermometerTubeView : UIView
@property(nonatomic)CAShapeLayer * shapelayer;
//中心点坐标
@property(nonatomic)CGPoint point;
//半径，底层半径，上层半径，中间层半径
@property(nonatomic)float bj;
//温度计宽度，线的宽度
@property(nonatomic)float sc_kd;

@end
