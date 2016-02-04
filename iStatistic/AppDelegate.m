//
//  AppDelegate.m
//  iStatistic
//
//  Created by lee on 16/1/20.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "AppDelegate.h"
#import "IIViewDeckController.h"
#import "MainTableViewController.h"
#import "AppTVC.h"
#import "StatisticDescriptionVC.h"
#import "DateUtil.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self readUserDefaults];
  

    
    self.centerController = self.window.rootViewController;
    self.statisticListController = [((UINavigationController *)self.centerController) topViewController];
    //((UINavigationController *)self.centerController).navigationBar.tintColor = [UIColor whiteColor];
    
    [((UINavigationController *)self.centerController).navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    AppTVC* leftController = [[AppTVC alloc] init];
    
    
    self.deckController =  [[IIViewDeckController alloc] initWithCenterViewController:self.centerController leftViewController:leftController rightViewController:nil];
    
    self.deckController.delegate = self;
    self.deckController.leftSize  = 66;
    
    self.window.rootViewController = self.deckController;
    [self.window makeKeyAndVisible];
    
    self.window.tintColor = [UIColor orangeColor];
    return YES;
}

- (void)viewDeckController:(IIViewDeckController*)viewDeckController willCloseViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated {
    switch ([AppDelegate getAppDelegate].selectedMenu) {
        case 0:
        {
            UINavigationController  *naviCtrl = (UINavigationController *)self.deckController.centerController;
            if([naviCtrl.viewControllers containsObject:self.statisticListController]) {
                [naviCtrl popToViewController:self.statisticListController animated:YES];
            }
        }
            break;
        case 1: {
            if(self.loginUser.isLogin) {
                [self gotoUserSettingPage];
            } else {
                [self gotoUserLoginPage:YES];
                //[self gotoUserSettingPage];
            }
        }
            break;
        case 2: {
            if(self.helpController == nil) {
                self.helpController =  [[HelpTVC alloc] initWithNibName:@"HelpTVC" bundle:nil];
            }
            
            UINavigationController  *naviCtrl = (UINavigationController *)self.deckController.centerController;
            self.helpController.navigationItem.leftBarButtonItem = [naviCtrl.viewControllers lastObject].navigationItem.leftBarButtonItem;
            self.helpController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_btn.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(selectRightAction:)];
            
            if([naviCtrl.viewControllers containsObject:self.helpController]) {
                [naviCtrl popToViewController:self.helpController animated:YES];
            } else {
                [naviCtrl pushViewController:self.helpController animated:YES];
            }
            
        }
            break;
        case 3: {
            
            if(self.aboutController == nil) {
                self.aboutController = [self.deckController.centerController.storyboard instantiateViewControllerWithIdentifier:@"aboutController"];
            }
            
            UINavigationController  *naviCtrl = (UINavigationController *)self.deckController.centerController;
            self.aboutController.navigationItem.leftBarButtonItem = [naviCtrl.viewControllers lastObject].navigationItem.leftBarButtonItem;
            self.aboutController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_btn.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(selectRightAction:)];
            
            if([naviCtrl.viewControllers containsObject:self.aboutController]) {
                [naviCtrl popToViewController:self.aboutController animated:YES];
            } else {
                [naviCtrl pushViewController:self.aboutController animated:YES];
            }
            
        }
            break;
        default:
            
            break;
    }
}

-(void)gotoUserSettingPage {
    if(self.settingController == nil) {
        self.settingController = [self.deckController.centerController.storyboard instantiateViewControllerWithIdentifier:@"settingController"];
    }
    
    UINavigationController  *naviCtrl = (UINavigationController *)self.deckController.centerController;
    self.settingController.navigationItem.leftBarButtonItem = [naviCtrl.viewControllers lastObject].navigationItem.leftBarButtonItem;
    self.settingController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_btn.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(selectRightAction:)];
    if([naviCtrl.viewControllers containsObject:self.settingController]) {
        [naviCtrl popToViewController:self.settingController animated:YES];
    } else {
        [naviCtrl pushViewController:self.settingController animated:YES];
    }
}

-(void)gotoUserRegisterPage {
    if(self.userRegisterVC == nil) {
        self.userRegisterVC = [[UserRegisterVC alloc] init];
    }
    
    UINavigationController  *naviCtrl = (UINavigationController *)self.deckController.centerController;
    self.userRegisterVC.navigationItem.leftBarButtonItem = [naviCtrl.viewControllers lastObject].navigationItem.leftBarButtonItem;
    self.userRegisterVC.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_btn.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(selectRightAction:)];
    
    if([naviCtrl.viewControllers containsObject:self.userRegisterVC]) {
        [naviCtrl popToViewController:self.userRegisterVC animated:YES];
    } else {
        [naviCtrl pushViewController:self.userRegisterVC animated:YES];
    }
}

-(void)gotoUserLoginPage:(BOOL)fromDelegate {
    if(self.userLoginVC == nil) {
        self.userLoginVC = [self.deckController.centerController.storyboard instantiateViewControllerWithIdentifier:@"userLogin"];
    }
    
    UINavigationController  *naviCtrl = (UINavigationController *)self.deckController.centerController;
    self.userLoginVC.navigationItem.leftBarButtonItem = [naviCtrl.viewControllers lastObject].navigationItem.leftBarButtonItem;
    self.userLoginVC.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_btn.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(selectRightAction:)];
    
    if([naviCtrl.viewControllers containsObject:self.userLoginVC]) {
        [naviCtrl popToViewController:self.userLoginVC animated:YES];
    } else {
        [naviCtrl pushViewController:self.userLoginVC animated:YES];
    }
    
    if(fromDelegate) {
        [AppDelegate getAppDelegate].selectedMenu = -1;
        [self.deckController toggleLeftViewAnimated:YES];
    }
}

-(void)selectRightAction:(id)sender
{
    [(UINavigationController *)self.deckController.centerController popViewControllerAnimated:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self writeUserDefaults];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self writeUserDefaults];
}

-(void)readUserDefaults {
    self.loginUser = [[User alloc] init];
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    self.loginUser.isLogin = NO;
    self.loginUser.userName = [defaults stringForKey:@"userName"];
    self.loginUser.userQQ = [defaults stringForKey:@"userQQ"];
    self.loginUser.userMoney = [defaults stringForKey:@"userMoney"];
    self.loginUser.userFinishTasks = [defaults integerForKey:@"userFinishTasks"];
    self.loginUser.updateDate = [defaults valueForKey:@"updateDate"];
    
    if(self.loginUser.updateDate == nil) {
        self.loginUser.updateDate = [NSDate distantPast];
    }
    
}

-(void)writeUserDefaults {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.loginUser.userName forKey:@"userName"];
    [userDefaults setObject:self.loginUser.userQQ forKey:@"userQQ"];
    [userDefaults setObject:self.loginUser.userMoney forKey:@"userMoney"];
    [userDefaults setInteger:self.loginUser.userFinishTasks forKey:@"userFinishTasks"];
    [userDefaults setObject:self.loginUser.updateDate forKey:@"updateDate"];
    [userDefaults synchronize];
}

-(BOOL)isUserLogin {
    NSDate *now = [NSDate date];
    NSTimeInterval aTimer = [now timeIntervalSinceDate:self.loginUser.updateDate];
    self.loginUser.isLogin = (aTimer > 60*30) ? NO : YES;
    return self.loginUser.isLogin;
}

-(void)setUserLogin:(BOOL)isLogin {
    self.loginUser.isLogin = isLogin;
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if(textField)
    {
        [textField resignFirstResponder];
        return YES;
    }
    
    return NO;
}

+(AppDelegate *)getAppDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

@end
