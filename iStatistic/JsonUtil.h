//
//  JsonUtil.h
//  statistic
//
//  Created by lee on 16/1/11.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatisticList.h"

@interface JsonUtil : NSObject

+(StatisticList *) parseJsonToStatisticList:(NSData *)data;

+(StatisticList *) parseResponseToStatisticList:(NSDictionary *)data;

+(NSData *) parseStatisticListToData:(StatisticList *)aStatisticList;


+(NSString *) parseStatisticListToString:(StatisticList *)aStatisticList;

@end
