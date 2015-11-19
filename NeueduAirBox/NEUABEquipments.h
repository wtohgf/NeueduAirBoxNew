//
//  Equipments.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEUABEquipments : NSObject

//对应的设备序列号
@property(copy,nonatomic)NSString* Equipment;
//设备对应名称
@property(copy,nonatomic)NSString* dvicename;
//设备状态
@property(copy,nonatomic)NSString* dviceState;
//设备地址
@property(copy,nonatomic)NSString* dviceaddress;

+(instancetype)equipmentsWithDict:(NSDictionary*)dict;
@end
