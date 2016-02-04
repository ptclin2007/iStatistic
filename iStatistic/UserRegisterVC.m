//
//  UserRegisterVC.m
//  iStatistic
//
//  Created by lee on 16/1/30.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "UserRegisterVC.h"
#import "AppDelegate.h"

@interface UserRegisterVC ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (weak, nonatomic) IBOutlet UITextField *passAgain;
@property (weak, nonatomic) IBOutlet UITextField *qq;
@property (weak, nonatomic) IBOutlet UITextField *email;



@end

@implementation UserRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.userName setDelegate: [AppDelegate getAppDelegate]];
    [self.pass setDelegate: [AppDelegate getAppDelegate]];
    [self.passAgain setDelegate: [AppDelegate getAppDelegate]];
    [self.qq setDelegate: [AppDelegate getAppDelegate]];
    [self.email setDelegate: [AppDelegate getAppDelegate]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelRegisterAction:(id)sender {
    [(UINavigationController *)[self parentViewController] popViewControllerAnimated:YES];
}

- (IBAction)doRegisterAction:(id)sender {
    id d = [AppDelegate getAppDelegate].window.rootViewController;
    if(self.userName.text.length == 0) {
        [self.userName becomeFirstResponder];
        [self showErrorMessage:@"用户名不能为空"];
        return;
    }
    if(self.pass.text.length == 0) {
        [self.pass becomeFirstResponder];
        [self showErrorMessage:@"密码不能为空"];
        return;
    }
    if(self.passAgain.text.length == 0) {
        [self.passAgain becomeFirstResponder];
        [self showErrorMessage:@"重复密码不能为空"];
        return;
    }
    if(kCFCompareEqualTo != [self.passAgain.text compare:self.pass.text]) {
        [self.passAgain becomeFirstResponder];
        [self showErrorMessage:@"两个密码不一样"];
        return;
    }
}

-(void) showErrorMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alertController animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertController dismissViewControllerAnimated:YES completion:^{
        }];
    });
    
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
