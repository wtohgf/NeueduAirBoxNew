//
//  NEUABLogoutDeviceModel.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEUABLogoutDeviceModel : NSObject

@property(copy,nonatomic)NSString *msg;

+(instancetype)logoutDeviceModelWithDict:(NSDictionary*)dict;
@end
