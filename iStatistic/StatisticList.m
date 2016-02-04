//
//  StatisticList.m
//  statistic
//
//  Created by lee on 16/1/10.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "StatisticList.h"



@implementation Statistic
@end


@implementation StatisticList

-(id)init
{
    if(self=[super init])
    {
        //self.updatedDate = nil;
        self.listArray = [[NSMutableArray<Statistic> alloc] init];
    }
    return self;
}

@end
