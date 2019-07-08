//
//  NSString+LSGetFirstLetter.h
//  woi
//
//  Created by 中创 on 2019/7/5.
//  Copyright © 2019 中创-慧谷. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LSGetFirstLetter)

/// 传入汉字字符串, 返回大写拼音首字母
- (NSString *)getFirstLetter;

@end

NS_ASSUME_NONNULL_END
