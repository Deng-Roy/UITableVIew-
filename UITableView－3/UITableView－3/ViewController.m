//
//  ViewController.m
//  UITableView－3
//
//  Created by 劳一 on 16/8/7.
//  Copyright © 2016年 劳一. All rights reserved.
//

#import "ViewController.h"
#import "goods.h"

@interface ViewController ()
@property(nonatomic,strong) NSMutableArray *goodslist;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _goodslist =[NSMutableArray arrayWithCapacity:77];
    //1设置商品名称，2 描述信息，3头像名称
    for(int i =0;i<77;i++){
        goods *god =[[goods alloc]init];

    god.gooodsname = [NSString stringWithFormat:@"陈俊🐻SB-%02d",i];
        god.drsc = @"cjx可爱吗";
        god.headname=[NSString stringWithFormat:@"%03d.png",arc4random_uniform(9)+1];
    
    
    [_goodslist addObject:god];
    }
}

#pragma mark 设置有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _goodslist.count;
}
#pragma mark 设置每行对内容

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"RoyCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
    if(cell ==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    }
    goods *god =_goodslist[indexPath.row];
    [cell.textLabel setText:god.gooodsname];
    UIImage *himage =[UIImage imageNamed:god.headname];
    [cell.imageView setImage:himage];
    [cell.detailTextLabel setText:god.drsc];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  73;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    goods *god =_goodslist[indexPath.row];
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"修改商品信息" message:@"请输入商品名称" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    UITextField *field = [alert textFieldAtIndex:0];
    [field setText:god.gooodsname] ;
    [alert show];
}

@end
