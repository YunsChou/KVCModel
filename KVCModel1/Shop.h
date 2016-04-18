//
//  Shop.h
//  KVCModel1
//
//  Created by weiying on 16/3/4.
//  Copyright © 2016年 Yuns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

@property (nonatomic, strong) NSString *shopName;

@property (nonatomic, strong) NSArray *shopStorage;

@end

@interface ShopGoods : NSObject

@property (nonatomic, strong) NSString *goodsName;

@property (nonatomic, assign) float goodsPrice;

@end
