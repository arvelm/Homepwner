//
//  BNRItem.m
//  RandomPossesions
//
//  Created by Ivan on 14-5-9.
//  Copyright (c) 2014年 Ivan. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+(id)randomItem
{
    NSArray *randomAdjectiveList=[NSArray arrayWithObjects:@"Large",@"Medium",@"Small", nil];
    NSArray *randomNounList=[NSArray arrayWithObjects:@"Bear",@"Spork",@"Mac",nil];
    
    NSUInteger adjectiveList=rand() % [randomAdjectiveList count];
    NSUInteger nounList=rand() % [randomNounList count];
    
    NSString *randomName=[NSString stringWithFormat:@"%@ %@",[randomAdjectiveList objectAtIndex:adjectiveList],[randomNounList objectAtIndex:nounList]];
    
    int randomValue= rand()%200;
    
    NSString *randomSerialNumber=[NSString stringWithFormat:@"%c%c%c%c%c",'0'+rand()%10,'A'+rand()%10,'0'+rand()%10,'A'+rand()%10,'0'+rand()%10];
    
    BNRItem *newItem=[[BNRItem alloc]initWithItemName:randomName serialNumber:randomSerialNumber valuesInDollars:randomValue ];
    return newItem;
}



-(id)initWithItemName:(NSString *)itName serialNumber:(NSString *)serialNum valuesInDollars:(int)dollors
{
    self=[super init];
    if (self) {
        [self setItemName:itName];
        [self setSerialNumber:serialNum];
        [self setValuesInDollars:dollors];
        _dateCreated=[[NSDate alloc]init];
    }
    return self;
}



-(id)initItemName:(NSString *)itName
{
    return [self initWithItemName:itName serialNumber:@"" valuesInDollars:0];
}



-(id)initItemName:(NSString *)itName SerialNumber:(NSString *)serialNum
{
    return [self initWithItemName:itName serialNumber:serialNum valuesInDollars:0];
}


// #  #  固化 encodeWithCoder ， 键－值对形式保存
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_itemName forKey:@"itemName"];
    [aCoder encodeObject:_serialNumber forKey:@"serialNumber"];
    [aCoder encodeObject:_dateCreated forKey:@"dateCreated"];
    [aCoder encodeInt:_valuesInDollars forKey:@"valuesInDollars"];
}


// ＃ ＃ 解固 initWithCoder
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    if (self) {
        self.itemName=[aDecoder decodeObjectForKey:@"itemName"];
        self.serialNumber=[aDecoder decodeObjectForKey:@"serialNumber"];
        self.valuesInDollars=[aDecoder decodeIntForKey:@"valuesInDollars"];
        
        _dateCreated=[aDecoder decodeObjectForKey:@"dateCreated"];
    }
    return self;
}



-(NSString *)description
{
    NSString *descriptionString=[NSString stringWithFormat:@" %@ (%@) : worth $%d Recorded on date %@",_itemName,_serialNumber,_valuesInDollars,_dateCreated];
    
    return descriptionString;
}
@end
