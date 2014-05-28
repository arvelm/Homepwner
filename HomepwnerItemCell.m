//
//  HomepwnerItemCell.m
//  Homepwner
//
//  Created by Ivan on 14-5-28.
//  Copyright (c) 2014年 Ivan. All rights reserved.
//

#import "HomepwnerItemCell.h"

@implementation HomepwnerItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _itemNameLabel=[[UILabel alloc] initWithFrame:CGRectMake(60, 0, 120, 30)];
        _itemNameLabel.textColor=[UIColor colorWithRed:0.26 green:0.26 blue:1 alpha:0.9];
        _itemNameLabel.font=[UIFont systemFontOfSize:18.0];
        [self.contentView addSubview:_itemNameLabel];
        
        _serialNumberLabel=[[UILabel alloc] initWithFrame:CGRectMake(60, 28, 120, 10)];
        _serialNumberLabel.textColor=[UIColor greenColor];
        _serialNumberLabel.font=[UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_serialNumberLabel];
        
        _valueInDollarsLabel=[[UILabel alloc] initWithFrame:CGRectMake(280, 10, 50, 20)];
        _valueInDollarsLabel.textColor=[UIColor colorWithRed:0.8 green:0.7 blue:0.3 alpha:1];
        _valueInDollarsLabel.font=[UIFont systemFontOfSize:18.0];
//      #simple resize
        _valueInDollarsLabel.autoresizingMask=YES;
        [self.contentView addSubview:_valueInDollarsLabel];
        
        _thumbnailImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 3, 38 , 38)];
        [self.contentView addSubview:_thumbnailImageView];
        
        
        
        
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
