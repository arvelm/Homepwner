//
//  DetailViewController.h
//  Homepwner
//
//  Created by Ivan on 14-5-17.
//  Copyright (c) 2014年 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface DetailViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic,strong) UITextField* nameField;
@property(nonatomic,strong) UITextField* serialField;
@property(nonatomic,strong) UITextField* valueField;
@property(nonatomic,readonly,strong) UILabel* dateLabel;

@property(nonatomic,strong) BNRItem *item;

@end
