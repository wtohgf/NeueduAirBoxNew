//
//  NEUABEquipmentManageModel.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/16.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEUABEquipmentManageModel : NSObject
@property(nonatomic,copy)NSString*Equipment;
@property(nonatomic,copy)NSString*dvicename;
@property(nonatomic,copy)NSString*dviceState;
@property(nonatomic,copy)NSString* dviceaddress;
//@property(nonatomic,copy)NSString* count;


+(instancetype)equipmentManageWithDictionary:(NSDictionary*)dict;

@end
