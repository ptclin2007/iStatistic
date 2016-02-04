//
//  AppDelegate.h
//  iStatistic
//
//  Created by lee on 16/1/20.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IIViewDeckController.h"
#import "StatisticList.h"
#import "User.h"
#import "UserLoginVC.h"
#import "UserSettingVC.h"
#import "UserRegisterVC.h"
#import "AboutVC.h"
#import "HelpTVC.h"

@class StatisticDescriptionVC;

@interface AppDelegate : UIResponder <UIApplicationDelegate, IIViewDeckControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) IIViewDeckController* deckController;

@property (strong, nonatomic) UIViewController *centerController;

@property (weak, nonatomic) UIViewController *statisticListController;

@property (strong, nonatomic) UserSettingVC *settingController;

@property (strong, nonatomic) HelpTVC *helpController;

@property (strong, nonatomic) AboutVC *aboutController;

@property (strong, nonatomic) StatisticDescriptionVC *statisticDescriptionVC;

@property (strong, nonatomic) UserLoginVC *userLoginVC;

@property (strong, nonatomic) UserRegisterVC *userRegisterVC;

@property (assign, nonatomic) NSInteger selectedMenu;

@property (strong, nonatomic) User *loginUser;


+(AppDelegate *)getAppDelegate;


-(void)selectRightAction:(id)sender;


//for IIViewDeckControllerDelegate
- (void)viewDeckController:(IIViewDeckController*)viewDeckController willCloseViewSide:(IIViewDeckSide)viewDeckSide animated:(BOOL)animated;

-(BOOL)isUserLogin;
-(void)setUserLogin:(BOOL)isLogin;
-(void)gotoUserLoginPage:(BOOL)fromDelegate;
-(void)gotoUserRegisterPage;
-(void)gotoUserSettingPage;
@end

