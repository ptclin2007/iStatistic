//
//  HelpTVC.h
//  iStatistic
//
//  Created by lee on 16/2/1.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpTVC : UITableViewController
@property (nonatomic) NSArray *questionArray;
@property (nonatomic) NSArray *answerArray;

@property (nonatomic, strong) UITableViewCell *prototypeCell;
@end
