//
//  ViewController.m
//  按字母进行排序
//
//  Created by 中创 on 2019/7/5.
//  Copyright © 2019 中创慧谷. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface ViewController ()

@property (nonatomic, strong) NSMutableArray * perModels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    NSArray * pers = @[@"赵文件", @"钱", @"孙", @"李", @"周", @"吴", @"郑", @"王"];
    for (NSInteger i = 0; i < pers.count; i ++) {
        Person * per = [Person new];
        per.name = pers[i];
        [self.perModels addObject:per];
    }
    
    NSArray * titles = @[@"无序", @"有序"];
    for (NSInteger i = 0; i < titles.count; i ++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:btn];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(100, 100 + i * (50 + 5), 50, 50);
        btn.tag = i;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)clickBtn:(UIButton *)btn{
    if (btn.tag == 0) {
        SecondViewController * secondVC = [SecondViewController new];
        secondVC.perModels = self.perModels;
        [self.navigationController pushViewController:secondVC animated:YES];
    }else{
        ThirdViewController * thirdVC = [ThirdViewController new];
        thirdVC.perModels = self.perModels;
        [self.navigationController pushViewController:thirdVC animated:YES];
    }
}


- (NSMutableArray *)perModels{
    if (_perModels == nil) {
        _perModels = [NSMutableArray array];
    }
    return _perModels;
}

@end
