//
//  BNRItem.h
//  RandomPossesions
//
//  Created by Ivan on 14-5-9.
//  Copyright (c) 2014年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject <NSCoding>
{
    
}

@property(nonatomic,strong) NSString *itemName;
@property(nonatomic,strong) NSString *serialNumber;
@property(nonatomic,readonly,strong) NSDate *dateCreated;
@property(nonatomic) int valuesInDollars;

+(id)randomItem;

-(id)initWithItemName:(NSString *)itName serialNumber:(NSString*)serialNum valuesInDollars:(int)dollors ;

-(id)initItemName:(NSString *)itName SerialNumber:(NSString *)serialNum;


@end
