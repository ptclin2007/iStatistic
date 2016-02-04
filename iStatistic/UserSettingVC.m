//
//  UserSettingVC.m
//  iStatistic
//
//  Created by lee on 16/1/30.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "UserSettingVC.h"
#import "AppDelegate.h"

@interface UserSettingVC ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UITextField *qq;
@property (weak, nonatomic) IBOutlet UILabel *finishTasks;
@property (weak, nonatomic) IBOutlet UILabel *money;

@end

@implementation UserSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.qq setDelegate: [AppDelegate getAppDelegate]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelAction:(id)sender {
    [(UINavigationController *)[self parentViewController] popViewControllerAnimated:YES];
}

- (IBAction)saveAction:(id)sender {
}

- (IBAction)changePassAction:(id)sender {
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
