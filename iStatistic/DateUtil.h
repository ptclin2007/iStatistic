//
//  DateUtil.h
//  iStatistic
//
//  Created by lee on 16/1/31.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

+(NSString *)dateToString:(NSDate*)date;

+(NSDate*)stringToDate:(NSString*)dateString;

@end
