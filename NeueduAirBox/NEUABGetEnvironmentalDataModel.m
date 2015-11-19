//
//  NEUABGetEnvironmentalDataModel.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABGetEnvironmentalDataModel.h"

@implementation NEUABGetEnvironmentalDataModel

+(instancetype)getEnvironmentalDataModelWithDict:(NSDictionary *)dict{
   
    NEUABGetEnvironmentalDataModel *model=[[NEUABGetEnvironmentalDataModel alloc]init];
    if (model) {
        model.msg=[dict objectForKey:@"msg"];
        model.parameters=[dict objectForKey:@"parameters"];
        model.errorType=[dict objectForKey:@"errorType"];
    }
    return model;
 
}


-(NSString *)description{
   
    NSString *string=[NSString stringWithFormat:@"msg=%@  parameters=%@  errorType=%@",self.msg,self.parameters,self.errorType];
    return string;
}
@end
