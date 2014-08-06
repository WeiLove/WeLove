//
//  HRLLoginViewController.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-30.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLLoginViewController.h"
#import "HRLUserLoginService.h"
#import "HRLRPCService.h"
#import "HRLUserDataModel.h"
#import "HRLUtil.h"
#import "MBProgressHUD.h"
#import "HRLUserDefaultService.h"

@interface HRLLoginViewController ()

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *userIdLabel;
@property(nonatomic, strong) UITextField *userIdTextField;
@property(nonatomic, strong) UILabel *userPasswordLabel;
@property(nonatomic, strong) UITextField *userPasswordTextField;
@property(nonatomic, strong) UIButton *loginBtn;
@property(nonatomic, strong) UIButton *registerBtn;
@property(nonatomic, strong) LoginSuccessBlock loginSuccessBlock;
@property(nonatomic, strong) MBProgressHUD *hud;
@property(nonatomic, strong) UILabel *remindPasswordLabel;
@property(nonatomic, strong) UISwitch *remindPasswordSwitch;

@end

@implementation HRLLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor colorWithHex:0xFF558822];
    
    if (!self.titleLabel)
    {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        self.titleLabel.font = [UIFont boldSystemFontOfSize:30];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    self.titleLabel.text = @"鸿蓉";
    self.titleLabel.frame = CGRectMake(10, 60, CGRectGetWidth(self.view.frame) - 20, 50);
    [self.view addSubview:self.titleLabel];
    
    CGFloat y = 120;
    CGFloat height = 40;
    
    if (!self.userIdLabel)
    {
        self.userIdLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.userIdLabel.text = @"账号：";
    }
    
    self.userIdLabel.frame = CGRectMake(20, y, 60, height);
    [self.view addSubview:self.userIdLabel];
    
    if (!self.userIdTextField)
    {
        self.userIdTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        self.userIdTextField.layer.borderColor = [UIColor blackColor].CGColor;
        self.userIdTextField.layer.borderWidth = 1.0f;
        self.userIdTextField.font = [UIFont boldSystemFontOfSize:20];
        [self.userIdTextField addTarget:self
                                 action:@selector(textFieldTextDidChange:)
                       forControlEvents:UIControlEventEditingChanged];
    }
    
    self.userIdTextField.frame = CGRectMake(CGRectGetMaxX(self.userIdLabel.frame), CGRectGetMinY(self.userIdLabel.frame), 220, height);
    [self.view addSubview:self.userIdTextField];
    
    if (!self.userPasswordLabel)
    {
        self.userPasswordLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.userPasswordLabel.text = @"密码：";
    }
    
    self.userPasswordLabel.frame = CGRectMake(CGRectGetMinX(self.userIdLabel.frame), CGRectGetMaxY(self.userIdLabel.frame) + 30, 60, height);
    [self.view addSubview:self.userPasswordLabel];
    
    if (!self.userPasswordTextField)
    {
        self.userPasswordTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        self.userPasswordTextField.clearsOnBeginEditing = YES;
        self.userPasswordTextField.secureTextEntry = YES;
        self.userPasswordTextField.layer.borderColor = [UIColor blackColor].CGColor;
        self.userPasswordTextField.layer.borderWidth = 1.0f;
        self.userPasswordTextField.font = [UIFont systemFontOfSize:20];
        [self.userPasswordTextField addTarget:self
                                       action:@selector(textFieldTextDidChange:)
                             forControlEvents:UIControlEventAllEditingEvents];
    }
    
    self.userPasswordTextField.frame = CGRectMake(CGRectGetMaxX(self.userPasswordLabel.frame), CGRectGetMinY(self.userPasswordLabel.frame), 220, height);
    [self.view addSubview:self.userPasswordTextField];
    
    if (!self.remindPasswordLabel)
    {
        self.remindPasswordLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        self.remindPasswordLabel.text = @"记住密码：";
    }
    
    self.remindPasswordLabel.frame = CGRectMake(CGRectGetMinX(self.userPasswordLabel.frame), CGRectGetMaxY(self.userPasswordLabel.frame) + 15, 90, 20);
    [self.view addSubview:self.remindPasswordLabel];
    
    if (!self.remindPasswordSwitch)
    {
        self.remindPasswordSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        
        [self.remindPasswordSwitch setOn:YES];
    }
    
    self.remindPasswordSwitch.frame = CGRectMake(CGRectGetMaxX(self.remindPasswordLabel.frame), CGRectGetMinY(self.remindPasswordLabel.frame), 40, 10);
    [self.view addSubview:self.remindPasswordSwitch];
    
    if (!self.loginBtn)
    {
        self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [self.loginBtn setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]
                                                   size:CGSizeMake(1, 1)]
                                 forState:UIControlStateNormal];
        [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.loginBtn.enabled = NO;
        [self.loginBtn addTarget:self
                          action:@selector(loginBtnClicked:)
                forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.loginBtn.frame = CGRectMake(40, CGRectGetMaxY(self.remindPasswordSwitch.frame) + 15, 100, 44);
    
    [self.view addSubview:self.loginBtn];
    
    if (!self.registerBtn)
    {
        self.registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [self.registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.registerBtn setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]
                                                             size:CGSizeMake(1, 1)]
                                    forState:UIControlStateNormal];
        [self.registerBtn addTarget:self
                             action:@selector(registerBtnClicked:)
                   forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.registerBtn.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 100 - 40, CGRectGetMinY(self.loginBtn.frame), 100, 44);
    
    [self.view addSubview:self.registerBtn];
    
    //读取保存的账号信息
    NSString *userId = [[HRLUserDefaultService shareInstance] valueForKey:kUserDefaultKey_Uid];
    NSString *password= [[HRLUserDefaultService shareInstance] valueForKey:kUserDefaultKey_Password];
    
    self.userIdTextField.text = userId;
    self.userPasswordTextField.text = password;
    
    [self checkLoginBtnState];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - private

- (void)checkLoginBtnState
{
    if (self.userIdTextField.text.length > 0
        && self.userPasswordTextField.text.length > 0)
    {
        self.loginBtn.enabled = YES;
    }
    else
    {
        self.loginBtn.enabled = NO;
    }
}

- (void)textFieldTextDidChange:(UITextField *)tf
{
    [self checkLoginBtnState];
}

- (void)loginBtnClicked:(id)sender
{
    [self.userIdTextField resignFirstResponder];
    [self.userPasswordTextField resignFirstResponder];
    
    if (!self.hud)
    {
        self.hud = [[MBProgressHUD alloc] initWithView:self.view];
        
        self.hud.mode = MBProgressHUDModeIndeterminate;
        self.hud.labelText = @"登录中...";
    }
    
    [self.view addSubview:self.hud];
    [self.hud show:YES];
    
    BOOL shouldRemindPassword = self.remindPasswordSwitch.on;
    __block HRLUserDataModel *result = nil;
    __weak typeof(self) weakSelf = self;
    NSString *userId = self.userIdTextField.text;
    NSString *password = self.userPasswordTextField.text;
    
    [HRLRPCService asyncRPCBlock:^{
        HRLRPCRequest *request = [[HRLRPCRequest alloc] init];
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        [params setObject:userId
                   forKey:kRPCRequest_Key_Uid
             defaultValue:@""];
        [params setObject:password
                   forKey:kRPCRequest_Key_UserPassword
             defaultValue:@""];
        request.postDict = params;
        request.url = kRPCRequestUrl_UserLogin;
        request.isPost = YES;
        request.parseCls = [HRLUserDataModel class];
        
        result = [request startRequest];
    } completion:^{
        
        if (result.success)
        {
            [[HRLUserDefaultService shareInstance] storeValue:userId forKey:kUserDefaultKey_Uid];
            
            if (shouldRemindPassword)
            {
                [[HRLUserDefaultService shareInstance] storeValue:password forKey:kUserDefaultKey_Password];
            }
            
            weakSelf.loginSuccessBlock(result, YES);
            [weakSelf dismissViewControllerAnimated:YES
                                         completion:NULL];
            [weakSelf.hud hide:YES];
        }
        else
        {
            //clear password
            [[HRLUserDefaultService shareInstance] storeValue:@"" forKey:kUserDefaultKey_Password];
            
            weakSelf.hud.labelText = result.errorMsg;
            [weakSelf.hud hide:YES afterDelay:0.3f];
            weakSelf.userPasswordTextField.text = @"";
            [weakSelf.userPasswordTextField becomeFirstResponder];
            [weakSelf checkLoginBtnState];
        }
    }];
}

- (void)registerBtnClicked:(id)sender
{
    
}

- (void)attachLoginSuccessBlock:(LoginSuccessBlock)loginSuccessBlock
{
    self.loginSuccessBlock = loginSuccessBlock;
}

@end
