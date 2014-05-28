//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Ivan on 14-5-14.
//  Copyright (c) 2014年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;
@interface BNRItemStore : NSObject

@property(nonatomic,strong) NSMutableArray *allItems;

//  BNRItemStore实例是一个单实例，每个应用只会有一个这种类型的实例。

+(BNRItemStore *) sharedStore;

-(BNRItem *) creatItem;
-(NSArray *) allItems;


//  # ＃ ＃ 删 除 行 ＃ ＃ ＃
-(void)removeItem:(BNRItem *) rmItem;

//  # # 获取文件路径 # #
-(NSString *) itemArchivePath;

-(BOOL)saveChanges;

@end



