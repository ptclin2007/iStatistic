//
//  StatisticList.h
//  statistic
//
//  Created by lee on 16/1/10.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JSONModel.h"

@protocol Statistic
@end

@protocol Question
@end

@interface Question : JSONModel

@end


@interface Statistic : JSONModel
@property(strong, nonatomic) NSNumber *statisticId;
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *url;
@property(strong, nonatomic) NSString *detailText;
@property(strong, nonatomic) NSNumber *payment;
@property(strong, nonatomic) NSNumber *questionCount;
@property(strong, nonatomic) NSString *mainImage;
@property(assign, nonatomic) BOOL imageDownloaded;
@property(strong, nonatomic) NSURL *fileURL;
@end


@interface StatisticList : JSONModel

@property(strong, nonatomic) NSString* updatedDate;
@property(strong, nonatomic) NSString* country;
@property(strong, nonatomic) NSMutableArray<Statistic> *listArray;


@end

//NSString *dateFormatString = @"yyyy-MM-dd HH:mm:ss";
//NSDateFormatter*df = [[NSDateFormatteralloc]init];//格式化
//[dfsetDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//NSString* s1 = [dfstringFromDate:today];