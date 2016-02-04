//
//  MainTableViewCell.h
//  statistic
//
//  Created by lee on 16/1/10.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainTableViewController;

@interface MainTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property(weak, nonatomic) MainTableViewController *parentTableView;




@end
