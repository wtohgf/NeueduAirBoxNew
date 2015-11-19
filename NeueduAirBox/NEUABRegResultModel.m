//
//  NEUABRegResultModel.m
//  NeueduAirBox
//
//  Created by hegf on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABRegResultModel.h"

@implementation NEUABRegResultModel

+(instancetype)regResultModelWithDict:(NSDictionary*)dict{
    NEUABRegResultModel* model = [[NEUABRegResultModel alloc]init];
    if (model) {
        model.msg = [dict objectForKey:@"msg"];
        model.uid = [dict objectForKey:@"uid"];
        model.errorType = [dict objectForKey:@"errorType"];
    }
    return model;
}

-(NSString *)description{
    NSString* string = [NSString stringWithFormat:@"msg=%@ uid=%@ errorType=%@", self.msg, self.uid, self.errorType];
    return string;
}

@end
