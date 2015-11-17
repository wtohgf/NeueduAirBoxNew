//
//  NEUABAddDevMngViewController.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/17.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NEUABAddDevMngViewController : UIViewController<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *Equipment;
@property (weak, nonatomic) IBOutlet UITextField *Dviceaddress;
- (IBAction)yousureAdd:(UIButton *)sender;

@end
