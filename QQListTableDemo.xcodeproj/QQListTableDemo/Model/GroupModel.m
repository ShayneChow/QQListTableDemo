//
//  GroupModel.m
//  QQListTableDemo
//
//  Created by ChowShayne on 15/4/24.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "GroupModel.h"
#import "FriendsModel.h"

@implementation GroupModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *muArray = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            FriendsModel *model = [FriendsModel friendWithDict:dict];
            [muArray addObject:model];
        }
        self.friends = muArray;
    }
    return self;
}

+ (instancetype)GroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
