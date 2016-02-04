//
//  DateUtil.m
//  iStatistic
//
//  Created by lee on 16/1/31.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil

+(NSString *)dateToString:(NSDate*)date {
    NSDateFormatter *outputFormatter= [[NSDateFormatter alloc] init];
    
    [outputFormatter setLocale:[NSLocale currentLocale]];
    
    [outputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    
    NSString *str= [outputFormatter stringFromDate:date];
    return str;
}

+(NSDate*)stringToDate:(NSString*)dateString {
    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
    
    [inputFormatter setLocale:[NSLocale currentLocale]];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    
    NSDate* date = [inputFormatter dateFromString:dateString];
    return date;
}

@end
