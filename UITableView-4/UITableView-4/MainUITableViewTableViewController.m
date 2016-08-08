//
//  MainUITableViewTableViewController.m
//  UITableView-4
//
//  Created by 劳一 on 16/8/7.
//  Copyright © 2016年 劳一. All rights reserved.
//

#import "MainUITableViewTableViewController.h"
#import "citiesTableViewController.h"

@interface MainUITableViewTableViewController ()
@property(nonatomic,strong)NSArray *provinces ;
@property(nonatomic,strong)NSDictionary *cities;
@end

@implementation MainUITableViewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle =[NSBundle mainBundle];
    _provinces = [NSArray arrayWithContentsOfFile:[bundle pathForResource:@"provinces" ofType:@"plist"]];
    _cities = [NSDictionary dictionaryWithContentsOfFile:[bundle pathForResource:@"cities" ofType:@"plist"]];
}

#pragma mark - Table view data source

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    citiesTableViewController *control = segue.destinationViewController;
 //1获取省名称，2获取对应的城市字典中的城市数组，3给控制器
    NSInteger index = [self.tableView indexPathForSelectedRow].row;
    NSString *pname =_provinces[index];

    NSArray *cities = self.cities[pname];
    NSLog(@"%@",cities);
    [control setCities:cities];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _provinces.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellWithIdentifier = @"RoyCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if(cell ==0){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    
    [cell.textLabel setText:_provinces[indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 37;
}
@end
