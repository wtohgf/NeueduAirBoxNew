//
//  NEUABLogResultModel.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABLogResultModel.h"

@implementation NEUABLogResultModel

+(instancetype)logResultModelWithDict:(NSDictionary *)dict{

    NEUABLogResultModel* model = [[NEUABLogResultModel alloc]init];
    if (model) {
        model.msg = [dict objectForKey:@"msg"];
        model.clevername = [dict objectForKey:@"clevername"];
        model.errorType = [dict objectForKey:@"errorType"];
    }
    return model;
}

-(NSString *)description{
    NSString* string = [NSString stringWithFormat:@"msg=%@ clevername=%@ errorType=%@", self.msg, self.clevername, self.errorType];
    return string;
}

@end
