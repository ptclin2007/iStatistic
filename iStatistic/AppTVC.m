//
//  AppTVC.m
//  statistic
//
//  Created by lee on 16/1/18.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "AppTVC.h"
#import "AppTVCCell.h"

#import "IIViewDeckController.h"
#import "AppDelegate.h"

@interface AppTVC ()

@end

@implementation AppTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AppTVCCell" bundle:nil] forCellReuseIdentifier:@"AppTVCCell"];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AppTVCCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppTVCCell" forIndexPath:indexPath];
    
    // Configure the cell...
    switch(indexPath.row) {
        case 0:
            cell.image.image = [UIImage imageNamed:@"ic_menu_attention"];
            cell.label.text = @"参与调查";
            break;
        case 1:
            cell.image.image = [UIImage imageNamed:@"ic_menu_account"];
            cell.label.text = @"账户设置";
            break;
        case 2:
            cell.image.image = [UIImage imageNamed:@"ic_menu_help"];
            cell.label.text = @"帮助";
            break;
        case 3:
            cell.image.image = [UIImage imageNamed:@"ic_menu_about"];
            cell.label.text = @"关于";
            break;
    }
    return cell;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}



#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [AppDelegate getAppDelegate].selectedMenu = indexPath.row;
    
    IIViewDeckController *parent = (IIViewDeckController *)[[[UIApplication sharedApplication] delegate] window].rootViewController;
    
    [parent toggleLeftViewAnimated:YES];
}

- (IBAction)userLoginAction:(id)sender {
    if(![[AppDelegate getAppDelegate] isUserLogin]) {
        [[AppDelegate getAppDelegate] gotoUserLoginPage : YES];
    }
}

@end
