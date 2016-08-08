//
//  ViewController.m
//  UItableView－1
//
//  Created by 劳一 on 16/8/6.
//  Copyright © 2016年 劳一. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)NSArray *hzw;
@property (nonatomic,strong)NSArray *hyrz;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _hzw = @[@"luffy",@"zorelo",@"sanji",@"nami"];
    _hyrz = @[@"mingren",@"sasikei",@"boren"];
    
    // Do any additional setup after loading the view, typically from a nib.
}
//设置分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//设置每组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section ==0){
        return _hzw.count;
    }else{
        return _hyrz.count;
    }
}
//设置每行的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSString *man = nil;
    if(indexPath.section ==0){
        man = _hzw[indexPath.row];
  
    }else
    {
        man=_hyrz[indexPath.row];
    }
          NSLog(@"%lu-----%lu",indexPath.section,indexPath.row);
    [cell.textLabel setText:man];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return section ==0?@"海贼王":@"火影忍者";
    allKeys
    
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    return section ==0?@"         favorite":@"~";
}
@end
