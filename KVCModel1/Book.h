//
//  Book.h
//  KVCModel1
//
//  Created by weiying on 16/3/4.
//  Copyright © 2016年 Yuns. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Author;

@interface Book : NSObject

@property (nonatomic, strong) NSString *bookName;

@property (nonatomic, strong) NSString *pubHouse;

@property (nonatomic, strong) Author *author;
@end

@interface Author : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *sex;

@end
