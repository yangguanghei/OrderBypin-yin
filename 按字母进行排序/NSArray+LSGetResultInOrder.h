//
//  NSArray+LSGetResultInOrder.h
//  按字母进行排序
//
//  Created by 中创 on 2019/7/5.
//  Copyright © 2019 中创慧谷. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (LSGetResultInOrder)

/// 对数组中的元素按照元素的某个值按照字母进行排序
- (NSArray *)getKeysAndResultsString:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
