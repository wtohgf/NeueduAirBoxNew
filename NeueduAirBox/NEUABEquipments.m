//
//  Equipments.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABEquipments.h"

@implementation NEUABEquipments

+(instancetype)equipmentsWithDict:(NSDictionary *)dict{
    NEUABEquipments * equ=[[NEUABEquipments alloc]init];
    if (equ) {
        equ.Equipment=[dict objectForKey:@"Equipment"];
        equ.dvicename=[dict objectForKey:@"dvicename"];
        equ.dviceState=[dict objectForKey:@"dviceState"];
        equ.dviceaddress=[dict objectForKey:@"dviceaddress"];
    }
    return equ;
}

@end
