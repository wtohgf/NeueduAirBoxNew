//
//  NEUABGetDeviceListModel.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABGetDeviceListModel.h"

@implementation NEUABGetDeviceListModel



+(instancetype)getDeviceListModelWithmodel:(NEUABEquipments *)dict{

    NEUABGetDeviceListModel* model=[[NEUABGetDeviceListModel alloc]init];
    if (model) {
      //  model.msg=[dict objectForKey:@"msg"];
        
        model.equipment=[NSMutableArray array];
        //  通过key 拿到需要转换成模型的那个数组
        //NSArray *Equipment=[dict objectForKey:@"Equipment"];
//        for (int i=0; i<Equipment.count; i++) {
//            NSDictionary* dict1=Equipment[i];
//            NEUABEquipments *Equipments=[NEUABEquipments equipmentsWithDict:dict1];
//            [model.equipment addObject:Equipments];
        
//        }
    }
    return model;
    
}

- (NSString *)description
{
    NSString* string = [NSString stringWithFormat:@"msg=%@ Equipment %@", self.msg,self.equipment];
    return string;
}

@end
