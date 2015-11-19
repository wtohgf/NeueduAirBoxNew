//
//  NEUABGetDeviceListModel.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEUABEquipments.h"

@interface NEUABGetDeviceListModel : NSObject

@property(copy,nonatomic)NSString* msg;
@property(strong,nonatomic)NSMutableArray* equipment;

+(instancetype)getDeviceListModelWithmodel:(NEUABEquipments*)dict;

@end
