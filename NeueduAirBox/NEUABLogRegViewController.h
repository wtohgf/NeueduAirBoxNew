//
//  NEUABLogRegViewController.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/16.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kMargin  20.f
#define leftMargin  20.f
#define rightMargin 40.f
#define upMargin 65.f
#define labelWidth 60.f
#define labelHeight 30.f


@interface NEUABLogRegViewController : UIViewController
@property(weak,nonatomic)UITextField* accountTextField;
@property(weak,nonatomic)UITextField* passwordTextField;
@property (copy,nonatomic)NSString *phoneNumber;
@end
