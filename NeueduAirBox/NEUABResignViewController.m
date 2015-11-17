//
//  NEUABResginViewController.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/16.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABResignViewController.h"
#import "NEUABLogRegViewController.h"
#import <MBProgressHUD.h>
@interface NEUABResignViewController ()

@end

@implementation NEUABResignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addsubviews];
    
    
}

-(void)addsubviews{
    UILabel * account = [[UILabel alloc]init];
    account.frame = CGRectMake(leftMargin, upMargin+100.f, labelWidth, labelHeight);
    account.text = @"手机号";
    account.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:account];
    
    UITextField *phoneTextFiled = [[UITextField alloc]init];
    _phone = phoneTextFiled;
    phoneTextFiled.frame = CGRectMake(leftMargin+labelWidth+kMargin, upMargin+100.f, [UIScreen mainScreen].bounds.size.width-leftMargin-rightMargin-labelWidth-kMargin, labelHeight);
    
    [self.view addSubview:phoneTextFiled];
    phoneTextFiled.textColor = [UIColor blueColor];
    
    //输入字符为数字
    phoneTextFiled.keyboardType=UIKeyboardTypeNumberPad;
    
    phoneTextFiled.placeholder=@"请输入手机号";
    phoneTextFiled.borderStyle=UITextBorderStyleRoundedRect;
    
    UILabel * password  = [[UILabel alloc]init];
    password.frame = CGRectMake(leftMargin, upMargin+labelHeight+100.f, labelWidth, labelHeight+2*kMargin);
    password.text= @"密码";
    password.textAlignment =NSTextAlignmentCenter;
    [self.view addSubview:password];
    
    UITextField * passwordTextfiled  =[[UITextField alloc]init];
    _passwords = passwordTextfiled;
    passwordTextfiled.frame = CGRectMake(leftMargin+labelWidth+kMargin, labelHeight+kMargin+upMargin+100.f,[UIScreen mainScreen].bounds.size.width-leftMargin-rightMargin-labelWidth-kMargin, labelHeight);
    passwordTextfiled.placeholder = @"请输入密码";
    passwordTextfiled.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextfiled.secureTextEntry = YES;
    [self.view addSubview:passwordTextfiled];
    
    
    UIButton *resign = [[UIButton alloc]init];
    resign.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-labelWidth)*0.5, 2*labelHeight+2*kMargin+upMargin+100.f, labelWidth, labelHeight);
    [resign setTitle:@"注册" forState:UIControlStateNormal];
    [resign setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    resign.backgroundColor=[UIColor yellowColor];
    [resign addTarget:self action:@selector(resign:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resign];



}
- (void)resign:(UIButton *)sender {
    if([self checkTel:_phone.text]&&_passwords.text.length!=0){
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        //PFUser *user = [PFUser user];
//        user.username = _phone.text;
//        user.password = _passwords.text;
//        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            if (!error) {
//                [MBProgressHUD showTipToWindow:@"注册成功"];
//                [self performSegueWithIdentifier:@"tologon" sender:_phone.text];
//                
//                //_risign.enabled = YES;
//            } else {
//                
//                //Something bad has occurred
//                NSString *errorString = [[error userInfo] objectForKey:@"error"];
//                UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"注册失败" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                [errorAlertView show];
//                //_risign.enabled = YES;
//                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//            }
//        }];
//        
//    
//}else{
//    [MBProgressHUD showTipToWindow:@"验证码错误"];
//    [self.view endEditing:NO];
}

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[NEUABLogRegViewController class]]) {
        NEUABLogRegViewController *logon = segue.destinationViewController;
        logon.phoneNumber = sender;
    }
}

#pragma mark 手机号验证
-(BOOL)checkTel:(NSString *)str{
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (!isMatch) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
