//
//  NEUABEquipmentManageModel.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/16.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABEquipmentManageModel.h"

@implementation NEUABEquipmentManageModel


+(instancetype)equipmentManageWithDictionary:(NSDictionary *)dict{
    NEUABEquipmentManageModel*model=[[NEUABEquipmentManageModel alloc]init];
    if (model) {
        model.Equipment=[dict objectForKey:@"Equipment"];
        model.dvicename=[dict objectForKey:@"dvicename"];
        model.dviceState=[dict objectForKey:@"dviceState"];
        model.dviceaddress=[dict objectForKey:@"dviceaddress"];
    }
    return model;
    
}

@end
