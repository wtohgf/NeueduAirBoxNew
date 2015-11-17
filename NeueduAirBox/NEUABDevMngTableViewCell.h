//
//  NEUABDevMngTableViewCell.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/16.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NEUABEquipmentManageModel.h"
@interface NEUABDevMngTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Equipment;
@property (weak, nonatomic) IBOutlet UILabel *dvicename;
@property (weak, nonatomic) IBOutlet UILabel *dviceaddress;
@property (weak, nonatomic) IBOutlet UILabel *dviceState;


@property (strong,nonatomic) NEUABEquipmentManageModel * model;
@end
