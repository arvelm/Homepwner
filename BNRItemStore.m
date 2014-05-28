//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Ivan on 14-5-14.
//  Copyright (c) 2014年 Ivan. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemStore


-(id)init
{
    self=[super init];
    if (self) {
        NSString *path=[self itemArchivePath];
        _allItems=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (!_allItems) {
            _allItems=[[NSMutableArray alloc] init];

        }
    }
    return self;
}


//  # # 获取文件路径
-(NSString *) itemArchivePath
{
    NSArray *documentDirectories=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
//    # # 从documentDirectories 数组获取文档目录路径(documentDirectories 只包含一个对象)  # #
    NSString *documentDirectory=[documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"item.Archive"];
}



-(BOOL)saveChanges
{
    NSString *path=[self itemArchivePath];
    return [NSKeyedArchiver archiveRootObject:_allItems toFile:path];
}



-(NSArray *)allItems
{
    return _allItems;
}



-(BNRItem *)creatItem
{
//    BNRItem *p=[BNRItem randomItem];
    BNRItem *p=[[BNRItem alloc]init];
    [_allItems addObject:p];
    return p;
}



-(void)removeItem:(BNRItem *)rmItem
{
    [_allItems removeObjectIdenticalTo:rmItem];
}



+(BNRItemStore *) sharedStore
{
    static BNRItemStore *sharedStore=nil;
    if (!sharedStore) {
        sharedStore=[[super allocWithZone:nil] init];
    }
    return sharedStore;
}



+(id) allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}




@end
