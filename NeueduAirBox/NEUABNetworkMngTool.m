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
-(void)userLogAccount:(NSString *)account Password:(NSString *)password{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:LOGAPI parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *array = (NSArray*)responseObject;
        NSDictionary*dict = [array lastObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

//3.
-(void)GetequipNoAccount:(NSString *)account{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:GetequAPI parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *array = (NSArray*)responseObject;
        NSDictionary*dict = [array lastObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];


}

//4.注册设备
-(void)RegequipAccount:(NSString *)account Equipment:(NSString *)Equipment Dvicescode:(NSString *)dvicescode{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:RegequipAPI parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *array = (NSArray*)responseObject;
        NSDictionary*dict = [array lastObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

//5.

@end
