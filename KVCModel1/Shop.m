//
//  Shop.m
//  KVCModel1
//
//  Created by weiying on 16/3/4.
//  Copyright © 2016年 Yuns. All rights reserved.
//

#import "Shop.h"

@implementation Shop

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"shopStorage"]) {
        NSLog(@"valueClass -- %@ \n value -- %@",[value class],value);
        NSMutableArray *shopSt = [NSMutableArray array];
        for (NSDictionary *goods in value) {
            ShopGoods *shopGs = [[ShopGoods alloc] init];
            [shopGs setValuesForKeysWithDictionary:goods];
            [shopSt addObject:shopGs];
        }
        _shopStorage = shopSt;
    }else{
        [super setValue:value forKey:key];
    }
}

@end

@implementation ShopGoods

@end