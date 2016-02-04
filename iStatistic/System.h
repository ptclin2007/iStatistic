//
//  System.h
//  statistic
//
//  Created by lee on 16/1/6.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CoreGraphics/CoreGraphics.h>

@interface System : NSObject

+ (float)getOSVersion;

+ (CGRect) getScreenRect;

@end
