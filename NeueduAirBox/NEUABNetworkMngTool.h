//
//  NEUABNetworkMngTool.h
//  NeueduAirBox
//
//  Created by hegf on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import <Foundation/Foundation.h>

//1.用户注册 POST
#define REGAPI @"http://10.25.246.172:8080/ServletProject/servlet/UserRegister"
#define LOGAPI @"http://10.25.246.172:8080/ServletProject/servlet/UserLogin"
#define GetequAPI @"http://10.25.246.172:8080/ServletProject/servlet/EquipmentId"

#define RegequipAPI @"http://10.25.246.172:8080/ServletProject/servlet/EquipmentRegister"

#define LogoutequipAPI @"http://10.25.246.172:8080/ServletProject/servlet/CancelEquipment"

#define GetinfoAPI @"http://10.25.246.172:8080/ServletProject/servlet/EquipmentIE"

typedef void (^NetworkBlock)(NSString* flag);

@interface NEUABNetworkMngTool : NSObject

+(instancetype)sharedNetworkMngTool;

//1.用户注册 POST
-(void)userRegCleverName:(NSString*)cleverName Account:(NSString*)account Password:(NSString*)password Result:(NetworkBlock) block;


//2.用户登录 GET
-(void)userLogAccount:(NSString*)account Password:(NSString*)password Result:(NetworkBlock) block;

//3.获取账号对应的设备列表
-(void)GetequipNoAccount:(NSString*)account ;

//4.注册设备
-(void)RegequipAccount:(NSString*)account Equipment:(NSString*)Equipment Dvicescode:(NSString*)dvicescode ;

//5.注销设备
-(void)LogoutequipmentAccount:(NSString*)account Equipment:(NSString*)Equipment ;

//6.根据设备ID取得当前的环境数据(1 温度 2湿度 3红外 4烟雾)
-(void)GetinfoAccount:(NSString*)account Equipment:(NSString*)Equipment ;

@end
