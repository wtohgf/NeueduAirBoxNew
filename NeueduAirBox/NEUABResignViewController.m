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
#import "MBProgressHUD+MoreExtentions.h"
@interface NEUABResignViewController ()
@property(weak,nonatomic)UIAlertView*alertView;
@end
static int timeindex=0;

static int count = 0;
@implementation NEUABResignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backPage:)];
    [self addsubviews];
    
}
#pragma mark 返回登录页
-(void)backPage:(id)sender{
    UIAlertView*alertView = [[UIAlertView alloc]initWithTitle:@"提示"message:@"你确定离开此页吗？" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alertView show];
    _alertView = alertView;
    
}
#pragma mark 动画效果选择
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {
        
        
      
       [[self navigationController] popViewControllerAnimated:YES];
    }else if
    (buttonIndex==1){
        if (timeindex==1) {
            NSLog(@"获取验证码成功");
            count = 0;
            
            NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:5
                                                              target:self
                                                            selector:@selector(showRepeatButton)
                                                            userInfo:nil
                                                             repeats:YES];
            
            NSTimer* timer2 = [NSTimer scheduledTimerWithTimeInterval:1
                                                               target:self
                                                             selector:@selector(updateTime)
                                                             userInfo:nil
                                                              repeats:YES];
            _timer1 = timer;
            _timer2 = timer2;
            timeindex=0;
            
        }else{
            NSLog(@"haha");
        }
    
    
    }
}
//隐藏键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}


#pragma mark 添加子控件
-(void)addsubviews{
    
    UILabel *clevername = [[UILabel alloc]init];
    clevername.frame = CGRectMake(leftMargin, upMargin+100.f-2*kMargin, labelWidth, labelHeight);
    clevername.text = @"昵称";
    clevername.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:clevername];
    
    UITextField *name = [[UITextField alloc]init];
    _name = name;
    name.frame = CGRectMake(leftMargin+labelWidth+kMargin, upMargin+100.f-2*kMargin, [UIScreen mainScreen].bounds.size.width-leftMargin-rightMargin-labelWidth-kMargin, labelHeight);
    [self.view addSubview:name];
     name.placeholder=@"请输入昵称";
    name.borderStyle=UITextBorderStyleRoundedRect;
    
    UILabel * account = [[UILabel alloc]init];
    account.frame = CGRectMake(leftMargin, upMargin+100.f-kMargin+labelHeight, labelWidth, labelHeight);
    account.text = @"手机号";
    account.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:account];
   
    
    UITextField *phoneTextFiled = [[UITextField alloc]init];
    _phone = phoneTextFiled;
    phoneTextFiled.frame = CGRectMake(leftMargin+labelWidth+kMargin, upMargin+100.f-kMargin+labelHeight, [UIScreen mainScreen].bounds.size.width-leftMargin-rightMargin-labelWidth-kMargin, labelHeight);
    
    [self.view addSubview:phoneTextFiled];
    phoneTextFiled.textColor = [UIColor blueColor];
    
    //输入字符为数字
    phoneTextFiled.keyboardType=UIKeyboardTypeNumberPad;
    
    phoneTextFiled.placeholder=@"请输入手机号";
    phoneTextFiled.borderStyle=UITextBorderStyleRoundedRect;
    
    UILabel * password  = [[UILabel alloc]init];
    password.frame = CGRectMake(leftMargin,  2*labelHeight+upMargin+100.f-kMargin, labelWidth, labelHeight+2*kMargin);
    password.text= @"密码";
    password.textAlignment =NSTextAlignmentCenter;
    [self.view addSubview:password];
    
    UITextField * passwordTextfiled  =[[UITextField alloc]init];
    _passwords = passwordTextfiled;
    passwordTextfiled.frame = CGRectMake(leftMargin+labelWidth+kMargin, 2*labelHeight+upMargin+100.f,[UIScreen mainScreen].bounds.size.width-leftMargin-rightMargin-labelWidth-kMargin, labelHeight);
    passwordTextfiled.placeholder = @"请输入密码";
    passwordTextfiled.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextfiled.secureTextEntry = YES;
    [self.view addSubview:passwordTextfiled];
    
    //验证码
    UILabel * vercode= [[UILabel alloc]init];
    vercode.frame = CGRectMake(leftMargin, 2*upMargin+labelHeight+100.f, labelWidth, labelHeight);
    vercode.text = @"验证码";
    vercode.textAlignment =NSTextAlignmentCenter;
    [self.view addSubview:vercode];
    
    //输入验证码
    UITextField * SMSCodeTextfiled  =[[UITextField alloc]init];
    _SMSCode = SMSCodeTextfiled;
    SMSCodeTextfiled.frame = CGRectMake(leftMargin+labelWidth+kMargin, 2*upMargin+2*labelHeight+100.f,labelWidth+50.f, labelHeight);
    SMSCodeTextfiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:SMSCodeTextfiled];
    
    //获取验证码
    UIButton * getver = [[UIButton alloc]init];
    getver.frame = CGRectMake(leftMargin+2*labelWidth+kMargin+80.f, 2*upMargin+labelHeight+100.f, labelWidth+50.f, labelHeight);
    [getver setTitle:@"获取验证码" forState:UIControlStateNormal];
    //getver.font = [UIFont fontWithName:@"Helvetica" size:15];
    [getver setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [getver addTarget:self action:@selector(getvercode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getver];
    
    UILabel* time = [[UILabel alloc]init];
    time.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-labelWidth-100.f)*0.5, 3*upMargin+labelHeight+100.f, labelWidth+100.f, labelHeight);
    time.numberOfLines = 0;
    time.textAlignment = NSTextAlignmentCenter;
    time.font = [UIFont fontWithName:@"Helvetica" size:15];
    time.text = @"接受短信大约需要60秒";
    _time=time;
    _time.hidden=YES;
    [self.view addSubview:time];
    
    //收不到短信验证码
    UIButton*repeatSMSBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    repeatSMSBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-labelWidth-100.f)*0.5, 3*upMargin+labelHeight+100.f, labelWidth+100.f, labelHeight-10.f);
    [repeatSMSBtn setTitle:@"收不到短信验证码？" forState:UIControlStateNormal];
    [repeatSMSBtn addTarget:self action:@selector(CannotGetSMS:) forControlEvents:UIControlEventTouchUpInside];
    _repeatSMSBtn=repeatSMSBtn;
    repeatSMSBtn.hidden=YES;
    [self.view addSubview:repeatSMSBtn];
    
    // 注册按钮
    UIButton *resign = [[UIButton alloc]init];
    resign.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-labelWidth)*0.5, 2*labelHeight+2*kMargin+upMargin+250.f, labelWidth, labelHeight);
    [resign setTitle:@"注册" forState:UIControlStateNormal];
    [resign setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    resign.backgroundColor=[UIColor yellowColor];
    [resign addTarget:self action:@selector(resign:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resign];

}

//重新发送验证码
#pragma mark重新发送验证码
-(void)CannotGetSMS:(UIButton*)sender{
    if (timeindex==0) {
         timeindex++;
    }
    
    NSString* str = [NSString stringWithFormat:@"%@:%@",@"我们将重新发送验证码短信到这个号码",_phone.text];
    UIAlertView*alertView = [[UIAlertView alloc]initWithTitle:@"确认手机号码"message:str delegate:self cancelButtonTitle:@"取消"otherButtonTitles:@"确定", nil];
    [alertView show];
    if ([self checkTel:_phone.text]&&_passwords.text.length!=0 ) {
        //[MBProgressHUD showTipToWindow:@"正在发送中"];
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_phone.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
            if (!error) {
                NSLog(@"获取验证码成功");
            } else {
                NSLog(@"错误码：%@",error.debugDescription);
            }
        }];
    }else{
        //        UIAlertView*alertView = [[UIAlertView alloc]initWithTitle:@"提示"message:@"请输入手机号或密码" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        //        [alertView show];
    }

}

#pragma mark 接收验证码中。。。（更新时间）
-(void)updateTime
{
    count++;
    if (count >= 5)
    {
        [_timer2 invalidate];
        return;
    }
    //NSLog(@"更新时间");
    _time.hidden=NO;
    _repeatSMSBtn.hidden = YES;
    self.time.text = [NSString stringWithFormat:@"%@%i%@",@"接收验证码中...",5-count,@"秒"];
    
}

//验证码发送成功
#pragma mark显示收不到验证码按钮
-(void)showRepeatButton{
    _time.hidden = YES;
    _repeatSMSBtn.hidden = NO;
    [_timer1 invalidate];
    return;
}

#pragma mark 注册
- (void)resign:(UIButton *)sender {
    if (_phone.text.length==0||_passwords.text.length==0) {
        UIAlertView*alertView = [[UIAlertView alloc]initWithTitle:@"提示"message:@"请输入手机号或密码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }else if(_SMSCode.text.length == 0){
        UIAlertView*alertView = [[UIAlertView alloc]initWithTitle:@"提示"message:@"请输入验证码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }else if(_SMSCode.text.length != 4){
         UIAlertView*alertView = [[UIAlertView alloc]initWithTitle:@"提示"message:@"验证码输入错误，请重新输入" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
         [alertView show];
     }else{[SMSSDK commitVerificationCode:_SMSCode.text phoneNumber:_phone.text zone:@"86" result:^(NSError *error) {
            if([self checkTel:_phone.text]&&_passwords.text.length!=0){
                //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
                
                if (!error) {
                    NSLog(@"验证成功");
                    [MBProgressHUD showTipToWindow:@"注册成功"];
                    
                    [self performSegueWithIdentifier:@"tologon" sender:_phone.text];
                } else {
                    NSLog(@"错误码：%@",error.debugDescription);
                    [MBProgressHUD showTipToWindow:@"验证码输入错误"];
                }
            }
     }];}
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[NEUABLogRegViewController class]]) {
        NEUABLogRegViewController *logon = segue.destinationViewController;
        logon.phoneNumber = sender;
    }
}

#pragma mark获取验证码
-(void)getvercode:(UIButton*)sender{

    //NSLog(@"vercode");
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if (_phone.text&&_passwords.text.length==0) {
        UIAlertView*alertView = [[UIAlertView alloc]initWithTitle:@"提示"message:@"请输入手机号或密码" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles:nil, nil];
        [alertView show];

    }
     else if ([self checkTel:_phone.text]&&_passwords.text.length!=0 ) {
        [MBProgressHUD showTipToWindow:@"正在发送中"];
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_phone.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
            if (!error) {
                NSLog(@"获取验证码成功");
                [_timer2 invalidate];
                [_timer1 invalidate];
                count = 0;
                
                NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:5
                                                                  target:self
                                                                selector:@selector(showRepeatButton)
                                                                userInfo:nil
                                                                 repeats:YES];
                
                NSTimer* timer2 = [NSTimer scheduledTimerWithTimeInterval:1
                                                                   target:self
                                                                 selector:@selector(updateTime)
                                                                 userInfo:nil
                                                                  repeats:YES];
                _timer1 = timer;
                _timer2 = timer2;
            } else {
                NSLog(@"错误码：%@",error.debugDescription);
            }
        }];
    }else{
//        UIAlertView*alertView = [[UIAlertView alloc]initWithTitle:@"提示"message:@"请输入手机号或密码" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
//        [alertView show];
    }

}

#pragma mark 手机号验证
-(BOOL)checkTel:(NSString *)str{
  
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (!isMatch) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的手机号码" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
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
