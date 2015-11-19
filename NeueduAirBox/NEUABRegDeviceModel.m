//
//  NEUABRegDeviceModel.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABRegDeviceModel.h"

@implementation NEUABRegDeviceModel

+(instancetype)regDeviceModelWithDict:(NSDictionary *)dict{

    NEUABRegDeviceModel* model=[[NEUABRegDeviceModel alloc]init];
    if (model) {
        model.msg=[dict objectForKey:@"msg"];
        model.errorType=[dict objectForKey:@"errorType"];
    }
    return model;
}

-(NSString *)description{

    NSString *string=[NSString stringWithFormat:@"msg=%@   errorType=%@",self.msg,self.errorType];
    return string;
}

@end
