//
//  FiltUtil.m
//  statistic
//
//  Created by lee on 16/1/10.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "FileUtil.h"

@implementation FileUtil

+(void)loadStatisticListFile
{
    NSString *fileName = @"statisticList";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    NSError *error;
    if([fileManager fileExistsAtPath:filePath]) //如果存在
    {
        [fileManager removeItemAtPath:filePath error:&error];
    }
    {
        NSLog(@"%@ is not exist in %@", fileName, filePath);
        
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];//获取程序包中相应文件的路径
        
        if([fileManager copyItemAtPath:dataPath toPath:filePath error:&error]) //拷贝
        {
            NSLog(@"copy %@ success", fileName);
        }
        else
        {
            NSLog(@"%@",error);
        }
       
    }
}

@end
