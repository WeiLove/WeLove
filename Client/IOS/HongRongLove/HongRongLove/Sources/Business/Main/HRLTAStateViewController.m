//
//  HRLTAStateViewController.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-23.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLTAStateViewController.h"
#import "HRLUserStateDataModel.h"
#import "HRLRPCService.h"
#import "MBProgressHUD.h"
#import "HRLUtil.h"
#import "HRLNetWorkService.h"
#import "HRLUserStateCell.h"
#import "HRLSocketMsgDataModel.h"
#import "HRLSocketService.h"
#import "HRLUserDataModel.h"
#import "HRLUserLoginService.h"

@interface HRLTAStateViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UIButton *refreshBtn; // 刷新列表按钮
@property(nonatomic, strong) HRLUserStateDataModel *currentUserStateDataModel; // 当前TA的状态
@property(nonatomic, strong) NSMutableArray *historyUserStateListArray; // 已读TA的历史状态，默认一页10条
@property(nonatomic, strong) MBProgressHUD *hud;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UITextView *currentStateTextView;

@end

@implementation HRLTAStateViewController

-(void)dealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[HRLSocketService shareInstance] stop];
}

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
    
    [self createRightBarRefreshItem];
    [self createCurrentStateTextView];
    
    [self createTableView];
    self.tableView.tableHeaderView = self.currentStateTextView;
    [self.view addSubview:self.tableView];
    [[HRLSocketService shareInstance] start];
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



#pragma mark ______doing


- (void)refreshUserState
{
    //刷新用户状态
    NSString *userStateStr = self.currentUserStateDataModel.user_state;
    NSString *createDateStr = self.currentUserStateDataModel.create_date;
    
    if ([NSString stringIsNullOrEmpty:userStateStr])
    {
        userStateStr = @"没有新状态哦，赶紧叫TA去添加状态！💏";
    }
    
    //时间差
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *createDate = [dateFormatter dateFromString:createDateStr];
    NSString *compareCurrentTime = [HRLUtil compareCurrentTime:createDate];
    
    //    self.createDateLabel.text = [createDateStr stringByAppendingFormat:@"  %@", compareCurrentTime];
    self.currentStateTextView.text = userStateStr;
}

- (void)getCurrentUserState
{
    if (!self.hud)
    {
        self.hud = [[MBProgressHUD alloc] initWithView:self.view];
        
        self.hud.mode = MBProgressHUDModeIndeterminate;
        [self.view addSubview:self.hud];
    }
    
    self.hud.labelText = @"我要变身🙏";
    [self.hud show:YES];
    
    __block HRLUserStateDataModel *result = nil;
    __weak typeof(self) weakSelf = self;
    
    NSString *uid = [HRLUserLoginService shareInstance].userDataModel.uid;
    
    [HRLRPCService asyncRPCBlock:^{
        HRLRPCRequest *request = [[HRLRPCRequest alloc] init];
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        [params setObject:uid
                  forKey:kRPCRequest_Key_Uid
            defaultValue:@""];
        [params setObject:[HRLNetWorkService shareInstance].isWifi ? @"1" : @"0"
                  forKey:kRPCRequest_Key_IsWifi
            defaultValue:@"0"];
        
        request.url = [HRLUtil url:kRPCRequestUrl_GetCurrentUserState
                             params:params];
        request.parseCls = [HRLUserStateDataModel class];
        
        result = [request startRequest];
    } completion:^{
        
        if (result.success)
        {
            [weakSelf.hud hide:YES afterDelay:0.3f];
            
            if (kErrorCode_Success_NotUpdate == result.errorCode)
            {
                //服务端没更新
            }
            else
            {
                weakSelf.currentUserStateDataModel = result;
                [weakSelf refreshUserState];
            }
        }
        else
        {
            weakSelf.hud.labelText = @"变身失败了😱，再来一次吧！";
            [weakSelf.hud hide:YES afterDelay:1.0f];
        }
    }];
}

#pragma mark ______clicked

- (void)refreshBtnClicked:(id)sender
{
//    [[HRLSocketService shareInstance] sendMsg:[HRLSocketSendMsgParam sendMsgParam:@"10000" toUid:@"10001" msg:@"hello!" msgType:kSocketProtocol_MsgType_Text]];
//    [];
    [[HRLSocketService shareInstance] startQueryUnReadMsg:[HRLSocketQueryUnReadMsgParam queryUnReadMsgParam:@"10000"]];
    [self getCurrentUserState];
}

#pragma mark ______create

- (void)createRightBarRefreshItem
{
    if (!self.refreshBtn)
    {
        self.refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.refreshBtn setTitle:@"刷新" forState:UIControlStateNormal];
        self.refreshBtn.backgroundColor = [UIColor grayColor];
        self.refreshBtn.frame = CGRectMake(0, 20, 60, 44);
        [self.refreshBtn addTarget:self
                            action:@selector(refreshBtnClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.refreshBtn];
}

- (void)createCurrentStateTextView
{
    if (!self.currentStateTextView)
    {
        self.currentStateTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        
        self.currentStateTextView.editable = NO;
    }
    
    self.currentStateTextView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200);
}

- (void)createTableView
{
    if (!self.tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    
    self.tableView.frame = self.view.bounds;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth
    | UIViewAutoresizingFlexibleHeight;
}

#pragma mark ______notif



#pragma mark - DataSource

#pragma mark ______tableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int numberOfSections = 1;
    
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int numberOfRows = 0;
    
    numberOfRows = self.historyUserStateListArray.count + 20;
    
    return numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height = 0.0f;
    
    height = 100;
    
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HRLUserStateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (nil == cell)
    {
        cell = [[HRLUserStateCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.currentUserStateDataModel.user_state;
    
    return cell;
}

#pragma mark - Delegates



#pragma mark - public




@end
