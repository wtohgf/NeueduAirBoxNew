//
//  NEUABRegResultModel.h
//  NeueduAirBox
//
//  Created by hegf on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEUABRegResultModel : NSObject

@property (copy, nonatomic) NSString* msg;
@property (copy, nonatomic) NSString* uid;
@property (copy, nonatomic) NSString* errorType;

+(instancetype)regResultModelWithDict:(NSDictionary*)dict;
@end
