//
//  NEUABNetworkMngTool.m
//  NeueduAirBox
//
//  Created by hegf on 15/11/19.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABNetworkMngTool.h"
#import <AFNetworking.h>
#import "NEUABRegResultModel.h"
#import "NEUABLogResultModel.h"
#import "NEUABRegDeviceModel.h"
#import "NEUABLogoutDeviceModel.h"
#import "NEUABGetEnvironmentalDataModel.h"
#import "NEUABGetDeviceListModel.h"
#import "NEUABEquipments.h"

static NEUABNetworkMngTool* tool;

@implementation NEUABNetworkMngTool

+(instancetype)sharedNetworkMngTool{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        tool = [[NEUABNetworkMngTool alloc]init];
    });
    return tool;
}

//1.用户注册 POST
-(void)userRegCleverName:(NSString*)cleverName Account:(NSString*)account Password:(NSString*)password{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"clevername":cleverName,
                                 @"account":account,
                                 @"password":password};
    NSLog(@"clename%@",cleverName)
    ;
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json", nil];
    
    [manager POST:REGAPI parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray* array = (NSArray*)responseObject;
        NSDictionary* dict = [array lastObject];
        
        //字典转模型
        NEUABRegResultModel* regResult = [NEUABRegResultModel regResultModelWithDict:dict];
        NSLog(@"%@", regResult);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

//2.用户登录  GET
-(void)userLogAccount:(NSString *)account Password:(NSString *)password {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:LOGAPI parameters:@{@"act":@"GET_UserLogon",
                                     @"account":account,
                                     @"password":password} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *array = (NSArray*)responseObject;
        NSDictionary*dict = [array lastObject];
        
        NEUABLogResultModel*logResult = [NEUABLogResultModel logResultModelWithDict:dict];
        NSLog(@"%@", logResult);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

//3.
-(void)GetequipNoAccount:(NSString *)account{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:GetequAPI parameters:@{@"act":@"GET_UserAcquisitionequipment",
                                        @"account":account
                                        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *array = (NSArray*)responseObject;
        NSDictionary*dict = [array lastObject];
//       NEUABGetDeviceListModel*model
        NEUABGetDeviceListModel*model=[NEUABGetDeviceListModel getDeviceListModelWithDictionary:dict];
            NSLog(@"%@",model);
                                            
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];


}

//4.注册设备
-(void)RegequipAccount:(NSString *)account Equipment:(NSString *)Equipment Dvicescode:(NSString *)dvicescode {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:RegequipAPI parameters:@{@"act":@"GET_UserRegisteredequipment",
                                          @"account":account,
                                          @"Equipment":Equipment,
                                          @"Dvicescode":dvicescode} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSArray *array = (NSArray*)responseObject;
//        NSDictionary*dict = [array lastObject];
//        NEUABRegDeviceModel*regDevice=[NEUABRegDeviceModel regDeviceModelWithDict:dict];
//                                              NSLog(@"%@",regDevice);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

//5.注销设备 GET
-(void)LogoutequipmentAccount:(NSString *)account Equipment:(NSString *)Equipment{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:LogoutequipAPI parameters:@{@"act":@"GET_UserDeleteequipment",
                                             @"account":account,
                                             @"Equipment":Equipment} success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                 NSLog(@"JSON: %@", responseObject);
//                                                 NSArray *array = (NSArray*)responseObject;
//                                                 NSDictionary*dict = [array lastObject];
//                                                 
//                                                 NEUABLogoutDeviceModel*logoutDevice = [NEUABLogoutDeviceModel logoutDeviceModelWithDict:dict];
//                                                 NSLog(@"%@", logoutDevice);
                                             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                 NSLog(@"Error: %@", error);
                                             }];
    
    
}

//6.根据设备ID取得当前的环境数据(1 温度 2湿度 3红外 4烟雾) GET
-(void)GetinfoAccount:(NSString *)account Equipment:(NSString *)Equipment {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:GetinfoAPI parameters:@{@"act":@"GET_UserAcquisitionparameters",
                                         @"account":account,
                                         @"Equipment":Equipment} success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             NSLog(@"JSON: %@", responseObject);
                                             NSArray *array = (NSArray*)responseObject;
                                             NSDictionary*dict = [array lastObject];
                                             NEUABGetEnvironmentalDataModel*getEnvironmentalData = [NEUABGetEnvironmentalDataModel getEnvironmentalDataModelWithDict:dict];
                                             NSLog(@"%@", getEnvironmentalData);
                                             
                                             
                                         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"Error: %@", error);
                                         }];
    
    
    
}
@end
