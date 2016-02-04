//
//  AppTVC.h
//  statistic
//
//  Created by lee on 16/1/18.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppTVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *userLoginBtn;

- (void)viewWillAppear:(BOOL)animated;

@end
