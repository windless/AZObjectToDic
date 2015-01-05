//
// Created by 钟建明 on 15/1/5.
// Copyright (c) 2015 Abner Zhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AZFakePerson;


@interface AZFakeRoom : NSObject

@property(nonatomic, copy) NSString *address;
@property(nonatomic, assign) NSInteger roomNumber;
@property(nonatomic, strong) NSArray *people;
@property(nonatomic, strong) AZFakePerson *host;

@end