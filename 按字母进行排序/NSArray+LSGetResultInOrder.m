//
//  NSArray+LSGetResultInOrder.m
//  按字母进行排序
//
//  Created by 中创 on 2019/7/5.
//  Copyright © 2019 中创慧谷. All rights reserved.
//

#import "NSArray+LSGetResultInOrder.h"

#import "NSString+LSGetFirstLetter.h"
#import "NSObject+LSModelToDict.h"
@implementation NSArray (LSGetResultInOrder)

- (NSArray *)getKeysAndResultsString:(NSString *)name{
    NSMutableArray * mutableArr = [NSMutableArray array];
    NSMutableDictionary *addressBookDict = [NSMutableDictionary dictionary];
    for (NSInteger i = 0; i < self.count; i ++) {
        id model = self[i];
        NSDictionary * dict = [model modelToDict];
        //获取到姓名的大写首字母
        NSString *firstLetterString = [dict[@"name"] getFirstLetter];
        //如果该字母对应的联系人模型不为空,则将此联系人模型添加到此数组中
        if (addressBookDict[firstLetterString])
        {
            [addressBookDict[firstLetterString] addObject:model];
        }
        //没有出现过该首字母，则在字典中新增一组key-value
        else
        {
            //创建新发可变数组存储该首字母对应的联系人模型
            NSMutableArray *arrGroupNames = [NSMutableArray array];
            [arrGroupNames addObject:model];
            //将首字母-姓名数组作为key-value加入到字典中
            [addressBookDict setObject:arrGroupNames forKey:firstLetterString];
        }
    }
    // 将addressBookDict字典中的所有Key值进行排序: A~Z
    NSArray *nameKeys = [[addressBookDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    // 将 "#" 排列在 A~Z 的后面
    NSMutableArray *mutableNamekeys = [NSMutableArray arrayWithArray:nameKeys];
    if ([nameKeys.firstObject isEqualToString:@"#"])
    {
        [mutableNamekeys insertObject:nameKeys.firstObject atIndex:nameKeys.count];
        [mutableNamekeys removeObjectAtIndex:0];
        
    }
    // 数组中第一个元素是最终的结果  第二个元素是键
    [mutableArr addObject:addressBookDict];
    [mutableArr addObject:mutableNamekeys];
    return mutableArr;
}



@end
