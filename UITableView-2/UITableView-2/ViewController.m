//
//  ViewController.m
//  UITableView-2
//
//  Created by 劳一 on 16/8/6.
//  Copyright © 2016年 劳一. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)NSArray *provinces;
@property(nonatomic,strong)NSDictionary *cities;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle =   [NSBundle mainBundle];
    _provinces = [NSArray arrayWithContentsOfFile:[bundle pathForResource:@"provinces" ofType:@"plist"]];
    _cities = [NSDictionary dictionaryWithContentsOfFile:[bundle pathForResource:@"cities" ofType:@"plist"]];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 设置组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _provinces.count;
}
#pragma mark 设置每组多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //1将省份名给过去，2确定这个省份有多少个城市 3返回的是各个省份有多少给城市
    NSString *provincesname = _provinces[section];
    NSArray *citycount = _cities[provincesname];
    return citycount.count;
    
}
#pragma mark设置每行的内容
//1,确定多少个省份。2，再确定每个省份有多少个城市。3，再设置每行对应的每个城市
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *pname = _provinces[indexPath.section];
    NSArray *citynum = _cities[pname];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [cell.textLabel setText:citynum[indexPath.row]];
    return cell;
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _provinces[section];
}
#pragma mark - 设置索引
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _provinces;
}
@end
