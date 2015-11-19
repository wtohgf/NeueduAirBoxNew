//
//  NEUABLogResultModel.h
//  NeueduAirBox
//
//  Created by neuedu on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEUABLogResultModel : NSObject

@property (copy, nonatomic) NSString* msg;
@property (copy, nonatomic) NSString* clevername;
@property (copy, nonatomic) NSString* errorType;

+(instancetype)logResultModelWithDict:(NSDictionary*)dict;
@end
