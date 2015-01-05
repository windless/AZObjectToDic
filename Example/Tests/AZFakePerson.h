//
// Created by 钟建明 on 15/1/5.
// Copyright (c) 2015 Abner Zhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AZFakeCar;


@interface AZFakePerson : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger age;
@property(nonatomic, assign) BOOL isMale;
@property(nonatomic, strong) AZFakeCar *car;

@end