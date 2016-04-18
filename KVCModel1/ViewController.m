//
//  ViewController.m
//  KVCModel1
//
//  Created by weiying on 16/3/4.
//  Copyright © 2016年 Yuns. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Student0.h"
#import "Student1.h"
#import "Student2.h"
#import "Book.h"
#import "Shop.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self modelDataStudent];
    [self modelDataStudent0];
    [self modelDataStudent1];
    [self modelDataStudent2];
    [self modelDataBook];
    [self modelDataShop];
}
/*********************学生【字典和模型中字段一一对应】***************************/
//字典模型的字段一一对应，最简单的KVC
- (void)modelDataStudent
{
    NSDictionary *student = @{
                              @"name" : @"小明",
                              @"age"  : @(10)
                              };
    Student *st = [[Student alloc] init];
    [st setValuesForKeysWithDictionary:student];
    NSLog(@"st.name -- %@",st.name);
}

//字典的字段比模型中的多一个【不做处理会崩】
//模型中需要重写这个方法- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//作用是：忽略掉字典中多余的字段，或者字典中在模型中匹配不到的字段
- (void)modelDataStudent0
{
    NSDictionary *student = @{
                              @"name" : @"小明",
                              @"age"  : @(10),
                              @"like" : @"篮球"
                              };
    Student0 *st0 = [[Student0 alloc] init];
    [st0 setValuesForKeysWithDictionary:student];
    NSLog(@"st0.name -- %@",st0.name);
}

//模型的字段比字典中的多一个
//不会报错，但是模型中多出那个字段的值是空的
- (void)modelDataStudent1
{
    NSDictionary *student = @{
                              @"name" : @"小明",
                              @"age"  : @(10)
                              };
    Student1 *st1 = [[Student1 alloc] init];
    [st1 setValuesForKeysWithDictionary:student];
    NSLog(@"st1.sex -- %@",st1.sex);
}

//字典中含有系统关键字（如id等），或者想把字典中某个字段在模型中改成另一个名字【需要做处理】
//模型中需要重写这个方法- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//作用是：将字典中某个字段的值，用模型中指定的字段来接收
//注意：字段替换不是用该方法- (void)setValue:(id)value forKey:(NSString *)key
//该方法是KVC正常转换时的方法，如是在该方法中进行字段赋值替换，会出现其他字段无值得问题
- (void)modelDataStudent2
{
    NSDictionary *student = @{
                              @"name" : @"小明",
                              @"age"  : @(10),
                              @"id"   : @"123"
                              };
    Student2 *st2 = [[Student2 alloc] init];
    [st2 setValuesForKeysWithDictionary:student];
    NSLog(@"st2.ID -- %@",st2.ID);
}

/*********************书本【字典中嵌套字典】***************************/
//【字典中嵌套字典】与模型中字段一一对应，最简单的KVC
- (void)modelDataBook
{
    NSDictionary *book = @{
                           @"bookName" : @"时间简史",
                           @"pubHouse" : @"出版社",
                           @"author" : @{
                                   @"name" : @"作者名",
                                   @"sex"  : @"作者性别"
                                   }
                           };
    Book *b = [[Book alloc] init];
    [b setValuesForKeysWithDictionary:book];
    NSLog(@"b -- %@",b.bookName);
}

/*********************商店【字典中嵌套数组】***************************/
//【字典中嵌套数组】与模型中字段一一对应，最简单的KVC【字典中的数组需要做处理】
//在KVC正常转换的方法中- (void)setValue:(id)value forKey:(NSString *)key
//获取数组对应key的value，可以获得value的类型（数组），遍历数组得到数组中的字典
//将字典转为内层模型，并添加到一个可变数组中，并用外层的数组接收该可变数组
- (void)modelDataShop
{
    NSDictionary *shop = @{
                           @"shopName" : @"周黑鸭",
                           @"shopStorage" : @[
                                   @{
                                       @"goodsName" : @"鸭脖",
                                       @"goodsPrice": @"10.0"
                                       },
                                   @{
                                       @"goodsName" : @"鸭舌",
                                       @"goodsPrice": @"18.0"
                                       },
                                   @{
                                       @"goodsName" : @"鸭掌",
                                       @"goodsPrice": @"15.0"
                                       }
                                   ]
                           };
    Shop *sp = [[Shop alloc] init];
    [sp setValuesForKeysWithDictionary:shop];
    NSLog(@"shopName -- %@",sp.shopName);
    
    ShopGoods *spGs = sp.shopStorage[0];
    NSLog(@"goodsName -- %@",spGs.goodsName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
