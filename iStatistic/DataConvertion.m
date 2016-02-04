//
//  DataConvertion.m
//  statistic
//
//  Created by lee on 16/1/13.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "DataConvertion.h"

@implementation DataConvertion

+(NSString*) NSDataToNSString:(NSData*)data
{
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+(NSData*) NSStringToNSData:(NSString*)aString
{
    return [aString dataUsingEncoding: NSUTF8StringEncoding];
}

+(NSData*) ByteToNSData:(Byte*)data
{
    return [[NSData alloc] initWithBytes:data length:sizeof(data)];
}

+(Byte*) NSDataToByte:(NSData*)data
{
    //NSData *testData = [testString dataUsingEncoding: NSUTF8StringEncoding];
    return (Byte *)[data bytes];
}

@end
