//
//  NEUABCounterView.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/18.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEUABCounterView : UIView



@property(nonatomic)CAGradientLayer * gradientlayer;
@property(nonatomic)CAGradientLayer * gradientlayer2;

@property(nonatomic)CAShapeLayer *shapelayer;


@property(nonatomic)NSArray * arrayColor;
@property(nonatomic)NSArray * arrayColor2;


@property(nonatomic)UILabel * label,*label2;
@property(nonatomic)UIFont * font1,*font2;
@property(nonatomic)float z;

@end
