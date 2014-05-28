//
//  DetailViewController.m
//  Homepwner
//
//  Created by Ivan on 14-5-17.
//  Copyright (c) 2014年 Ivan. All rights reserved.
//

#import "DetailViewController.h"
#import "BNRItem.h"

@implementation DetailViewController


-(id)init
{
    self=[super init];
    if (self) {;
        self.title=@"Detail";
    }
    return self;
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self detailField];
}



-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    取消当前的第一响应
    [[self view] endEditing:YES];
    
    _item.itemName=[_nameField text];
    _item.serialNumber=[_serialField text];
//   # # # intValue # # #
    _item.valuesInDollars=[[_valueField text] intValue];
}
-(void)loadView
{
    UIView *view=[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    view.backgroundColor=[UIColor yellowColor];
    self.view=view;
 
    
    
   
}



-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

-(void)detailField
{
//  #Label: Name Serial,Value
    UILabel *nameLabel=[[UILabel alloc] initWithFrame:CGRectMake(25, 85, 50, 20)];
    nameLabel.text=@"Name ";
    [self.view addSubview:nameLabel];
    UILabel *serialLabel=[[UILabel alloc] initWithFrame:CGRectMake(25, 125, 50, 20)];
    serialLabel.text=@"Serial ";
    [self.view addSubview:serialLabel];
    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(25, 165, 50, 20)];
    valueLabel.text=@"Value ";
    [self.view addSubview:valueLabel];
  
    
//  #UITextField Name, Serial ,Value
    _nameField=[[UITextField alloc] initWithFrame:CGRectMake(90, 85, 160, 20)];
    _nameField.text=[_item itemName];
    _nameField.delegate=self;
//    _nameField.backgroundColor=[UIColor redColor];
    [self.view addSubview:_nameField];
    
    _serialField=[[UITextField alloc] initWithFrame:CGRectMake(90, 125, 160, 20)];
    _serialField.delegate=self;
    _serialField.text=[_item serialNumber];
    [self.view addSubview:_serialField];
    
    _valueField=[[UITextField alloc] initWithFrame:CGRectMake(90, 165, 160, 20) ];
    _valueField.text=[NSString stringWithFormat:@"%d",[_item valuesInDollars]];
    _valueField.delegate=self;
    [self.view addSubview:_valueField];
    
    _dateLabel=[[UILabel alloc] initWithFrame:CGRectMake(70, 205, 180, 20)];
    _dateLabel.backgroundColor=[UIColor cyanColor];
    _dateLabel.textAlignment=NSTextAlignmentCenter;
    [self date];
    [self.view addSubview:_dateLabel];
    

}



-(void)date
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    dateFormatter.dateStyle=NSDateFormatterMediumStyle;
    dateFormatter.timeZone=NSDateFormatterNoStyle;
    _dateLabel.text=[dateFormatter stringFromDate:[_item dateCreated]];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField==_nameField ||textField==_serialField||textField==_valueField) {
        [textField resignFirstResponder];
    };
    return YES;
}
@end

