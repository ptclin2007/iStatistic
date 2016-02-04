//
//  UserLoginVC.m
//  iStatistic
//
//  Created by lee on 16/1/29.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "UserLoginVC.h"
#import "AppDelegate.h"

@interface UserLoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPass;

@end

@implementation UserLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.userName setDelegate: [AppDelegate getAppDelegate]];
    [self.userPass setDelegate: [AppDelegate getAppDelegate]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)userLoginAction:(id)sender {
}

- (IBAction)userRegisterAction:(id)sender {
    [[AppDelegate getAppDelegate] gotoUserRegisterPage];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
