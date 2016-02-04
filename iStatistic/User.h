//
//  User.h
//  iStatistic
//
//  Created by lee on 16/1/29.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (assign, nonatomic) BOOL isLogin;
@property NSDate *updateDate;
@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *userPass;
@property (nonatomic) NSString *userQQ;
@property (nonatomic) NSString *userMoney;
@property (assign, nonatomic) NSInteger userFinishTasks;

@end
