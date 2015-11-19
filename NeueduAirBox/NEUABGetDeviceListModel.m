//
//  NEUABGetDeviceListModel.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABGetDeviceListModel.h"

@implementation NEUABGetDeviceListModel

/*+(instancetype)GroupModelWithDict:(NSDictionary *)dict{
    GroupModel* group = [[GroupModel alloc]init];
    if (group) {
        //如果模型中再包含子模型 不要用kvc了
        //[group setValuesForKeysWithDictionary:dict];
        group.title = [dict objectForKey:@"title"];
        
        group.Cars = [NSMutableArray array];
        //通过key 拿到需要转换成模型的那个数组
        NSArray* cars = [dict objectForKey:@"cars"];
        for (int i=0; i<cars.count; i++) {
            NSDictionary* dict = cars[i];
            Car* car = [Car CarWithDict:dict];
            [group.Cars addObject:car];
        }
    }
    return group;
}*/

+(instancetype)getDeviceListModelWithDict:(NSDictionary *)dict{

    NEUABGetDeviceListModel* model=[[NEUABGetDeviceListModel alloc]init];
    if (model) {
        model.msg=[dict objectForKey:@"msg"];
        
        model.equipment=[NSMutableArray array];
        //  通过key 拿到需要转换成模型的那个数组
        NSArray *Equipment=[dict objectForKey:@"Equipment"];
        for (int i=0; i<Equipment.count; i++) {
            NSDictionary* dict1=Equipment[i];
            NEUABEquipments *Equipments=[NEUABEquipments equipmentsWithDict:dict1];
            [model.equipment addObject:Equipments];
            
        }
    }
    return model;
    
}

@end
