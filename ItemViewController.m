//
//  ItemViewController.m
//  Homepwner
//
//  Created by Ivan on 14-5-14.
//  Copyright (c) 2014年 Ivan. All rights reserved.
//

#import "ItemViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import "DetailViewController.h"
#import "HomepwnerItemCell.h"

@implementation ItemViewController

-(id)init
{
    self=[super initWithStyle:UITableViewStylePlain];
    if (self) {
//        for (int i=0; i<7; i++) {
//            [[BNRItemStore sharedStore] creatItem];
//        }
        self.title=@"Home";
        
        UIBarButtonItem *rightNavigationItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target
                                                                                                :self action:@selector(addNewItem)];
        self.navigationItem.rightBarButtonItem=rightNavigationItem;
        
        self.navigationItem.leftBarButtonItem=[self editButtonItem];
    }
    
    return self;
}



-(id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];

}


//  ＃ ＃ ＃ 增加行 ＃ ＃ ＃
-(void)addNewItem
{
    BNRItem *newItem=[[BNRItemStore sharedStore] creatItem];
    int lastRow=[[[BNRItemStore sharedStore] allItems ] indexOfObject:newItem];
    NSIndexPath *ip=[NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationTop];
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}



//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
//    if (!cell) {
//        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
//                                    reuseIdentifier:@"UITableViewCell"];
//    }
//    //获取allItems的第n个BNRItems实例
//    //然后将该BNRItem实例的描述信息赋给UITableViewCell的对象textLabel
//    //这里的n是该UITableViewCell对象所对应的表格索引
//    BNRItem *p=[[[BNRItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
//    cell.textLabel.text=[p description];
//    
//    NSString *strValueInDollars=[NSString stringWithFormat:@" Worth : %d",p.valuesInDollars];
//    cell.detailTextLabel.text=strValueInDollars;
//    
//    cell.imageView.image=[UIImage imageNamed:@"light"];
//    cell.backgroundColor=[UIColor greenColor];
//
//    return cell;
//}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomepwnerItemCell *cell=[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HomepwnerItemCell"];
    if (!cell) {
        cell=[[HomepwnerItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomepwnerItemCell"];
    }
    
    BNRItem *p=[[[BNRItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    
    cell.itemNameLabel.text=[p itemName];
    cell.serialNumberLabel.text=[p serialNumber];
    cell.valueInDollarsLabel.text=[NSString stringWithFormat:@"$%d",[p valuesInDollars]];
//    NSLog(@"%d",[indexPath row]);
    int v =[p valuesInDollars];
    if (v<=50) {
        cell.valueInDollarsLabel.textColor=[UIColor colorWithRed:1 green:0.6 blue:0.6 alpha:0.9];
    }
    cell.thumbnailImageView.image=[UIImage imageNamed:@"2"];
    
    
    return cell;
}




//  # # # UITableView 删除行 ＃ ＃ ＃
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        BNRItemStore *ps=[BNRItemStore sharedStore];
        NSArray *items=[ps allItems];
        BNRItem *p=[items objectAtIndex:[indexPath row]];
        [ps removeItem:p];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController=[[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    NSArray *items=[[BNRItemStore sharedStore] allItems];
    BNRItem *selectedItem=[items objectAtIndex:[indexPath row]];
    [detailViewController setItem:selectedItem];
    
}






@end
