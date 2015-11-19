//
//  NEUABLogoutDeviceModel.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABLogoutDeviceModel.h"

@implementation NEUABLogoutDeviceModel

+(instancetype)logoutDeviceModelWithDict:(NSDictionary *)dict{

    NEUABLogoutDeviceModel* model=[[NEUABLogoutDeviceModel alloc]init];
    if (model) {
        model.msg=[dict objectForKey:@"msg"];
    }
    return model;
}

-(NSString *)description{
    NSString *string=[NSString stringWithFormat:@"msg=%@",self.msg];
    return string;
}
@end
