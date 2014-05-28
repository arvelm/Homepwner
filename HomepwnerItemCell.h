//
//  HomepwnerItemCell.h
//  Homepwner
//
//  Created by Ivan on 14-5-28.
//  Copyright (c) 2014年 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomepwnerItemCell : UITableViewCell

@property(nonatomic,strong) UILabel *itemNameLabel;
@property(nonatomic,strong) UILabel *serialNumberLabel;
@property(nonatomic,strong) UILabel *valueInDollarsLabel;
@property(nonatomic,strong) UIImageView *thumbnailImageView;

@end
