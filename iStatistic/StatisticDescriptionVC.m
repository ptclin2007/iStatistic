//
//  StatisticDescriptionVC.m
//  iStatistic
//
//  Created by lee on 16/1/21.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatisticDescriptionVC.h"
#import "StatisticList.h"
#import "AppDelegate.h"

@interface StatisticDescriptionVC ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *statisticTitle;

@property (weak, nonatomic) IBOutlet UIImageView *statisticImage;

@property (weak, nonatomic) IBOutlet UILabel *statisticDescription;

@property (weak, nonatomic) IBOutlet UILabel *questions;
@end

@implementation StatisticDescriptionVC

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];


    //self.scrollView.contentSize = self.contentView.bounds.size;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    if(self.statistic) {
        self.statisticTitle.text = self.statistic.name;
        self.statisticDescription.text = self.statistic.detailText;
        self.questions.text = [NSString stringWithFormat:@"题目共%d题,获钱%d元", [self.statistic.questionCount intValue], [self.statistic.questionCount intValue]];
        if(self.statistic.imageDownloaded) {
            NSData *dateImg = [NSData dataWithContentsOfURL:self.statistic.fileURL];
            self.statisticImage.image = [UIImage imageWithData:dateImg];
        }
    }
}

- (IBAction)clickForDoingStatistic:(id)sender {
    if(![[AppDelegate getAppDelegate] isUserLogin]) {
        [[AppDelegate getAppDelegate] gotoUserLoginPage: NO];
    } else {
        
    }
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
