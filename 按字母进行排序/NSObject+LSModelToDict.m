//
//  NSObject+LSModelToDict.m
//  按字母进行排序
//
//  Created by 中创 on 2019/7/5.
//  Copyright © 2019 中创慧谷. All rights reserved.
//

#import "NSObject+LSModelToDict.h"

#import <objc/runtime.h>
@implementation NSObject (LSModelToDict)

- (NSMutableDictionary *)modelToDict{
    NSMutableDictionary *propsDic = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    // class:获取哪个类的成员属性列表
    // count:成员属性总数
    // 拷贝属性列表
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (i = 0; i<outCount; i++) {
        objc_property_t property = properties[i];
        const char* char_f = property_getName(property);
        // 属性名
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        // 属性值
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        // 设置KeyValues
        if (propertyValue) [propsDic setObject:propertyValue forKey:propertyName];
    }
    // 需手动释放 不受ARC约束
    free(properties);
    return propsDic;
}

@end
