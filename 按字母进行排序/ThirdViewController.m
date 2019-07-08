//
//  ThirdViewController.m
//  按字母进行排序
//
//  Created by 中创 on 2019/7/5.
//  Copyright © 2019 中创慧谷. All rights reserved.
//

#import "ThirdViewController.h"

#import "Person.h"
#import "NSString+LSGetFirstLetter.h"
#import "NSArray+LSGetResultInOrder.h"

@interface ThirdViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
/// 右侧显示的字母
@property (nonatomic, strong) NSMutableArray * mutableNamekeys;
/// 排序后的结果
@property (nonatomic, strong) NSMutableDictionary *addressBookDict;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
    
    self.title = @"按字母排序";
    NSArray * arr = [self.perModels getKeysAndResultsString:@"name"];
    self.addressBookDict = arr[0];
    self.mutableNamekeys = arr[1];
    [self.tableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.mutableNamekeys.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = self.mutableNamekeys[section];
    return [self.addressBookDict[key] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    NSString * key = self.mutableNamekeys[indexPath.section];
    Person * per = self.addressBookDict[key][indexPath.row];
    cell.textLabel.text = per.name;
    return cell;
}
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.mutableNamekeys[section];
}
//右侧的索引
- (NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.mutableNamekeys;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
