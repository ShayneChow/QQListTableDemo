//
//  GroupModel.h
//  QQListTableDemo
//
//  Created by ChowShayne on 15/4/24.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FriendsModel;

@interface GroupModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *online;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) FriendsModel *friendModel;
@property (nonatomic, assign) BOOL isOpen;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)GroupWithDict:(NSDictionary *)dict;

@end
