//
//  MainTableViewController.h
//  statistic
//
//  Created by lee on 16/1/10.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IIViewDeckController.h"

@class StatisticList;


@interface MainTableViewController : UITableViewController

@property (strong, nonatomic) StatisticList *statisticList;


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;


-(void)selectLeftAction:(id)sender;

- (void)viewWillAppear:(BOOL)animated;
-(void)requestionData;

@end
