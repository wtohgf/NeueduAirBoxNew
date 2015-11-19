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
#define LOGAPI @"http://www.neuedufuhuaqi.com/appcode/?act=GET_UserLogon&account=13381109915&password=123456"
#define GetequAPI @"http://www.neuedufuhuaqi.com/appcode/?act=GET_UserAcquisitionequipment&account=13381109915"

#define RegequipAPI @"http://www.neuedufuhuaqi.com/appcode/?act=GET_UserRegisteredequipment&account=13381109915&Equipment＝KQHZ00000001&dvicescode＝kqhz62"

#define LogoutequipAPI @"http://www.neuedufuhuaqi.com/appcode/?act=GET_UserDeleteequipment&account=13381109915&Equipment＝KQHZ00000001"

#define GetinfoAPI @"http://www.neuedufuhuaqi.com/appcode/?act=GET_UserAcquisitionparameters&account=13381109915&Equipment＝KQHZ00000001"

@interface NEUABNetworkMngTool : NSObject
+(instancetype)sharedNetworkMngTool;

//1.用户注册 POST
-(void)userRegCleverName:(NSString*)cleverName Account:(NSString*)account Password:(NSString*)password;


//2.用户登录 GET
-(void)userLogAccount:(NSString*)account Password:(NSString*)password;

//3.获取账号对应的设备列表
-(void)GetequipNoAccount:(NSString*)account;

//4.注册设备
-(void)RegequipAccount:(NSString*)account Equipment:(NSString*)Equipment Dvicescode:(NSString*)dvicescode;

//5.注销设备
-(void)LogoutequipmentAccount:(NSString*)account Equipment:(NSString*)Equipment;

//6.根据设备ID取得当前的环境数据(1 温度 2湿度 3红外 4烟雾)
-(void)GetinfoAccount:(NSString*)account Equipment:(NSString*)Equipment;

@end
