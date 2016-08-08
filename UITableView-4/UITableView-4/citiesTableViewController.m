//
//  citiesTableViewController.m
//  UITableView-4
//
//  Created by 劳一 on 16/8/7.
//  Copyright © 2016年 劳一. All rights reserved.
//

#import "citiesTableViewController.h"

@interface citiesTableViewController ()

@end

@implementation citiesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu",_cities.count);
    return _cities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellWithIdentifier = @"RoycityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier ];
    if(cell ==0){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    [cell.textLabel setText:_cities[indexPath.row]];
    return cell;
}


@end
