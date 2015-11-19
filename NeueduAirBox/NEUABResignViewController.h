//
//  NEUABResginViewController.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/16.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SMS_SDK/SMSSDK.h>
#define kMargin  20.f
#define leftMargin  20.f
#define rightMargin 40.f
#define upMargin 65.f
#define labelWidth 60.f
#define labelHeight 30.f

@interface NEUABResignViewController : UIViewController<UIAlertViewDelegate>

@property(weak,nonatomic)UITextField* phone;
@property(weak,nonatomic)UITextField* passwords;
@property(weak,nonatomic)UITextField* SMSCode;
@property(weak,nonatomic)UITextField* name;

@property(assign,nonatomic)NSTimer* timer1;
@property(assign,nonatomic)NSTimer* timer2;
@property(assign,nonatomic)NSTimer* timer3;
@property(nonatomic,strong)  UILabel* time;
@property(nonatomic,strong)  UIButton* repeatSMSBtn;
@end
