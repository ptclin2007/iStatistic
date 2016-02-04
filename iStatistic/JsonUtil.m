//
//  JsonUtil.m
//  statistic
//
//  Created by lee on 16/1/11.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "JsonUtil.h"

@implementation JsonUtil


+(StatisticList *) parseJsonToStatisticList:(NSData *)data
{
    StatisticList *mainList = [[StatisticList alloc] init];
    
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (json == nil) {
        NSLog(@"json parse failed \r\n");
        return mainList;
    }
    
    mainList.updatedDate = [json objectForKey:@"date"];
    
    NSArray *listArray = [json objectForKey:@"list"];
    
    NSLog(@"statistic collection: %@\r\n",listArray);
    
    for(id obj in listArray)
    {
        NSDictionary *aStatistic = obj;
        Statistic *statistic = [[Statistic alloc] init];
        statistic.name = [aStatistic objectForKey:@"name"];
        statistic.url = [aStatistic objectForKey:@"url"];
        //[mainList.listArray addObject:statistic];
    }

    return mainList;
}

+(StatisticList *) parseResponseToStatisticList:(NSDictionary *)data
{
    StatisticList *mainList = [[StatisticList alloc] init];
    if(data) {
        mainList.updatedDate = [data objectForKey:@"updateDate"];

        id listArray = [data objectForKey:@"statisticList"];
        if([listArray isKindOfClass:[NSArray class]])
        {
            NSArray *statisticList = (NSArray *)listArray;
            for(id obj in statisticList)
            {
                if([obj isKindOfClass:[NSDictionary class]])
                {
                    NSDictionary *statisticData = (NSDictionary *)obj;
                    Statistic *aStatistic = [[Statistic alloc]init];
                    aStatistic.statisticId = [statisticData objectForKey:@"id"];
                    aStatistic.name = [statisticData objectForKey:@"name"];
                    aStatistic.url = [statisticData objectForKey:@"url"];
                    aStatistic.detailText = [statisticData objectForKey:@"detailText"];
                    aStatistic.payment = [statisticData objectForKey:@"payment"];
                    aStatistic.questionCount = [statisticData objectForKey:@"questionCount"];
                    aStatistic.mainImage = [statisticData objectForKey:@"mainImage"];
                    [mainList.listArray addObject:aStatistic];
                }
            }
        }
    }
   
    return mainList;
}


+(NSData *) parseStatisticListToData:(StatisticList *)aStatisticList
{
    return nil;
}

+(NSString *) parseStatisticListToString:(StatisticList *)aStatisticList
{
    NSString* string = [aStatisticList toJSONString];
    NSLog(@"parseStatisticListToString: %@",string);
    return string;
}
	
@end
