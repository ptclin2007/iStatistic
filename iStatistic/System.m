//
//  System.m
//  statistic
//
//  Created by lee on 16/1/6.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "System.h"
#import <UIKit/UIKit.h>

@implementation System

+ (float) getOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+ (CGRect) getScreenRect
{
    return  [[UIScreen mainScreen] bounds];
}

@end
