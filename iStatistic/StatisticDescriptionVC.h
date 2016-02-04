//
//  StatisticDescriptionVC.h
//  iStatistic
//
//  Created by lee on 16/1/21.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Statistic;

@interface StatisticDescriptionVC : UIViewController

- (void)viewWillAppear:(BOOL)animated;

@property(strong, nonatomic) Statistic *statistic;

@end
