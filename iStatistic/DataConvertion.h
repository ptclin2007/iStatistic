//
//  DataConvertion.h
//  statistic
//
//  Created by lee on 16/1/13.
//  Copyright © 2016年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataConvertion : NSObject
+(NSString*) NSDataToNSString:(NSData*)data;

+(NSData*) NSStringToNSData:(NSString*)aString;

+(NSData*) ByteToNSData:(Byte*)data;

+(Byte*) NSDataToByte:(NSData*)data;
@end
