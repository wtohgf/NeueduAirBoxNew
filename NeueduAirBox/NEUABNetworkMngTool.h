//
//  NEUABNetworkMngTool.h
//  NeueduAirBox
//
//  Created by hegf on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>

//1.用户注册 POST
#define REGAPI @"http://www.neuedufuhuaqi.com/appcode/?act=Post_UserReg"

@interface NEUABNetworkMngTool : NSObject
+(instancetype)sharedNetworkMngTool;

//1.用户注册 POST
-(void)userRegCleverName:(NSString*)cleverName Account:(NSString*)account Password:(NSString*)password;

@end
