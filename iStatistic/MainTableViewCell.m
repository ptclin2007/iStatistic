//
//  MainTableViewCell.m
//  statistic
//
//  Created by lee on 16/1/10.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "MainTableViewCell.h"
#import "MainTableViewController.h"
#import "AppDelegate.h"

@implementation MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)enterStatisticDescription:(id)sender {
    NSLog(@"enterStatisticDescription");
    //[self.parentTableView performSegueWithIdentifier:@"statisticDescription" sender:self.parentTableView];
    
    if([AppDelegate getAppDelegate].statisticListController == nil) {
        [AppDelegate getAppDelegate].statisticListController = [self.parentTableView.storyboard instantiateViewControllerWithIdentifier:@"statisticDescription"];
    }
    UIViewController *tmpCtrl = [AppDelegate getAppDelegate].statisticListController;
    UINavigationController  *naviCtrl = (UINavigationController *)[AppDelegate getAppDelegate].deckController.centerController;
    tmpCtrl.navigationItem.leftBarButtonItem = [naviCtrl.viewControllers lastObject].navigationItem.leftBarButtonItem;

    
    if([naviCtrl.viewControllers containsObject:tmpCtrl]) {
        [naviCtrl popToViewController:tmpCtrl animated:YES];
    } else {
        [naviCtrl pushViewController:tmpCtrl animated:YES];
    }
}


@end
