//
//  Student2.m
//  KVCModel1
//
//  Created by weiying on 16/3/4.
//  Copyright © 2016年 Yuns. All rights reserved.
//

#import "Student2.h"

@implementation Student2

//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    if ([key isEqualToString:@"id"]) {
//        self.ID = value;
//    }
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}

@end
