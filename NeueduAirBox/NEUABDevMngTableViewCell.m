//
//  NEUABDevMngTableViewCell.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/16.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABDevMngTableViewCell.h"

@implementation NEUABDevMngTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(NEUABEquipmentManageModel *)model{
    
    _model=model;
    _Equipment.text=model.Equipment;
    _dvicename.text=model.dvicename;
    _dviceaddress.text=model.dviceaddress;
    _dviceState.text=model.dviceState;
    
   }

@end
