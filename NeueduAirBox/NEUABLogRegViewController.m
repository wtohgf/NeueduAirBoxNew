//
//  NEUABLogRegViewController.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/16.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABLogRegViewController.h"
#import "ACSimpleKeychain.h"
#import <MBProgressHUD.h>
#import "MBProgressHUD+MoreExtentions.h"
#import <SMS_SDK/SMSSDK.h>
#import "NEUABNetworkMngTool.h"

#import "NEUABNetworkMngTool.h"
@interface NEUABLogRegViewController ()
@property (weak, nonatomic) IBOutlet UITextField *SMSCode;
@property (weak, nonatomic)UIButton *storepwd;
@end

@implementation NEUABLogRegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backPage:)];
     [self setSubViews];
}
#pragma mark 登录注册
-(void)setSubViews{
    UILabel * account = [[UILabel alloc]init];
    account.frame = CGRectMake(leftMargin, upMargin+100.f, labelWidth, labelHeight);
    account.text = @"手机号";
    account.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:account];
    
    UITextField *accountTextFiled = [[UITextField alloc]init];
    _accountTextField = accountTextFiled;
    accountTextFiled.frame = CGRectMake(leftMargin+labelWidth+kMargin, upMargin+100.f, [UIScreen mainScreen].bounds.size.width-leftMargin-rightMargin-labelWidth-kMargin, labelHeight);
    
    [self.view addSubview:accountTextFiled];
    accountTextFiled.textColor = [UIColor blueColor];
    
    //输入字符为数字
    accountTextFiled.keyboardType=UIKeyboardTypeNumberPad;
    
    accountTextFiled.placeholder=@"请输入手机号";
    accountTextFiled.borderStyle=UITextBorderStyleRoundedRect;
    
    UILabel * password  = [[UILabel alloc]init];
    password.frame = CGRectMake(leftMargin, upMargin+labelHeight+100.f, labelWidth, labelHeight+2*kMargin);
    password.text= @"密码";
    password.textAlignment =NSTextAlignmentCenter;
    [self.view addSubview:password];
    
    UITextField * passwordTextfiled  =[[UITextField alloc]init];
    _passwordTextField = passwordTextfiled;
    passwordTextfiled.frame = CGRectMake(leftMargin+labelWidth+kMargin, labelHeight+kMargin+upMargin+100.f,[UIScreen mainScreen].bounds.size.width-leftMargin-rightMargin-labelWidth-kMargin, labelHeight);
    passwordTextfiled.placeholder = @"请输入密码";
    passwordTextfiled.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextfiled.secureTextEntry = YES;
    [self.view addSubview:passwordTextfiled];
    
    
    UIButton *logon = [[UIButton alloc]init];
    logon.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-labelWidth)*2/3, 2*labelHeight+2*kMargin+upMargin+100.f, labelWidth, labelHeight);
    [logon setTitle:@"登录" forState:UIControlStateNormal];
    [logon setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    logon.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:logon];
    
    [logon addTarget:self action:@selector(logonButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *storepassword = [[UIButton alloc]init];
    storepassword.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-labelWidth)*1/3, 2*labelHeight+2*kMargin+upMargin+100.f, labelWidth, labelHeight);
    [storepassword setImage:[UIImage imageNamed:@"pic_unchecked"] forState:UIControlStateNormal];
    [storepassword setImage:[UIImage imageNamed:@"pic_checked"] forState:UIControlStateSelected];
    [self.view addSubview:storepassword];
    
    [storepassword addTarget:self action:@selector(storepasswordButton:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton *resign = [[UIButton alloc]init];
    resign.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-labelWidth-40.f, [UIScreen mainScreen].bounds.size.height-labelHeight-kMargin, labelWidth+40.f, labelHeight);
    [resign setTitle:@"注册新用户" forState:UIControlStateNormal];
    [resign setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    resign.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:resign];
    
    [resign addTarget:self action:@selector(resignButton:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark 从keychain取用户名和密码 如果取到 则自定填充到_userName _passWord
- (void)featchUserNamePwd{
    NSDictionary* userPwdDict =  [[ACSimpleKeychain defaultKeychain] credentialsForIdentifier:@"user1" service:@"userpassword"];
    
    if (userPwdDict!= nil) {
        _storepwd.selected = YES;
        _accountTextField.text = [userPwdDict valueForKey:ACKeychainUsername];
        _passwordTextField.text = [userPwdDict valueForKey:ACKeychainPassword];
    }
    if (_phoneNumber.length == 11) {
        _storepwd.selected = NO;
        _accountTextField.text = _phoneNumber;
        _passwordTextField.text = @"";
    }
    
}

//隐藏键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}
#pragma mark 登录功能
-(void)logonButton:(UIButton*)sender{
    if (_accountTextField.text.length == 0) {
        [MBProgressHUD showTipToWindow:@"手机号不能为空"];
    }else
    {
        if (_passwordTextField.text.length == 0) {
            [MBProgressHUD showTipToWindow:@"密码不能为空"];
    }else
       {
           [MBProgressHUD showHUDAddedTo:self.view animated:YES];
           NSLog(@"登录成功");
            //测试登录已注册过的用户 Case1 正常逻辑 ---------------
           [[NEUABNetworkMngTool sharedNetworkMngTool]userLogAccount:_accountTextField.text Password:_passwordTextField.text];
//
//           //测试登录已注册过的用户Case2 异常逻辑------------------
//           //（不用自动记住密码功能，假设重新输入错误）
//           _accountTextField.text=@"13622223334";
//           _passwordTextField.text=@"123456";
//           
//           
//           
//           //正确账号为：13622223333  密码正确
//           
//           [[NEUABNetworkMngTool sharedNetworkMngTool]userLogAccount:_accountTextField.text Password:_passwordTextField.text];
//           
//           //测试登录已注册过的用户Case3 异常逻辑------------------
//           //（不用自动记住密码功能，假设重新输入错误）
//           _accountTextField.text=@"13622";
//           _passwordTextField.text=@"123456";
//           
//           
//           
//           //正确账号为：13622223333  密码正确
//           
//           [[NEUABNetworkMngTool sharedNetworkMngTool]userLogAccount:_accountTextField.text Password:_passwordTextField.text];
//
//           
//           //测试登录已注册过的用户Case4 异常逻辑------------------
//           //（不用自动记住密码功能，假设重新输入错误）
//           _accountTextField.text=@"23622223333";
//           _passwordTextField.text=@"123456";
//           
//           
//           
//           //正确账号为：13622223333  密码正确
//           
//           [[NEUABNetworkMngTool sharedNetworkMngTool]userLogAccount:_accountTextField.text Password:_passwordTextField.text];
//           
//           //测试登录已注册过的用户Case5 异常逻辑-----------------
//           //（不用自动记住密码功能，假设重新输入错误）
//           _accountTextField.text=@"hahahahah";
//           _passwordTextField.text=@"123456";
//           
//           
//           
//           //正确账号为：13622223333  密码正确
//           
//           [[NEUABNetworkMngTool sharedNetworkMngTool]userLogAccount:_accountTextField.text Password:_passwordTextField.text];
//           
//           //测试登录已注册过的用户Case6 异常逻辑----------------
//           //（不用自动记住密码功能，假设重新输入错误）
//           _accountTextField.text=@"13622223333";
//           _passwordTextField.text=@"hah";
//           
//           
//           
//           //正确账号为：13622223333  密码错误
//           
//           [[NEUABNetworkMngTool sharedNetworkMngTool]userLogAccount:_accountTextField.text Password:_passwordTextField.text];

        }

    }
}

#pragma mark  注册功能
-(void)resignButton:(UIButton*)sender{
    
    //测试注册网络接口 Case1 正常逻辑-----------------
    [[NEUABNetworkMngTool sharedNetworkMngTool]userRegCleverName:@"test" Account:@"13578671492" Password:@"31121376"];
    
//    //测试注册网络接口 Case2 异常逻辑-------------------
//    [[NEUABNetworkMngTool sharedNetworkMngTool]userRegCleverName:@"haha" Account:@"13622223333" Password:@"123456"];
//
//    //测试注册网络接口 Case3 异常逻辑--------------------
//    [[NEUABNetworkMngTool sharedNetworkMngTool]userRegCleverName:@"haha" Account:@"63622223334" Password:@"123456"];
//    //测试注册网络接口 Case4 异常逻辑---------------------
//   [[NEUABNetworkMngTool sharedNetworkMngTool]userRegCleverName:@"haha" Account:@"223334" Password:@"123456"];
//     //测试注册网络接口 Case5 异常逻辑---------------------
//     [[NEUABNetworkMngTool sharedNetworkMngTool]userRegCleverName:@"" Account:@"13622223333" Password:@"123456"];
//
//    RegViewController* reg = [[RegViewController alloc] init];
//    [self presentViewController:reg animated:YES completion:^{
//        
//    }];

  //  [self performSegueWithIdentifier:@"toResign" sender:self];

    
}
//- (IBAction)sendSMS:(UIButton *)sender {
//    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:@"13074856970" zone:@"86" customIdentifier:nil result:^(NSError *error) {
//        if (!error) {
//            NSLog(@"获取验证码成功");
//        } else {
//            NSLog(@"错误码：%@",error.debugDescription);
//        }
//    }];
//}
//- (IBAction)checkSMS:(UIButton *)sender {
//        
//    [SMSSDK commitVerificationCode:_SMSCode.text phoneNumber:@"13074856970" zone:@"86" result:^(NSError *error) {
//        if (!error) {
//            NSLog(@"验证成功");
//        } else {
//            NSLog(@"错误码：%@",error.debugDescription);
//        }
//    }];
//    
//}


#pragma mark  记住密码功能
-(void)storepasswordButton:(UIButton*)sender{
  sender.selected = !sender.selected;

}

-(void)backPage:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
