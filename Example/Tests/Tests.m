//
//  AZObjectToDicTests.m
//  AZObjectToDicTests
//
//  Created by Abner Zhong on 01/05/2015.
//  Copyright (c) 2014 Abner Zhong. All rights reserved.
//

#import <NSObject+ToDic.h>
#import "AZFakePerson.h"
#import "AZFakeRoom.h"
#import "AZFakeCar.h"

SPEC_BEGIN(ToDic)

  describe(@"NSObject", ^{
    it(@"toDic returns right dic", ^{
      AZFakePerson *person = [[AZFakePerson alloc] init];
      person.name = @"Windless";
      person.age = 27;
      person.isMale = YES;

      NSDictionary *dic = @{
          @"name" : @"Windless",
          @"age" : @27,
          @"isMale" : @YES
      };
      [[[person toDic] should] equal:dic];
    });

    describe(@"FakeRoom", ^{
      it(@"returns right dic", ^{
        AZFakeRoom *room = [[AZFakeRoom alloc] init];
        room.address = @"road 1";
        room.roomNumber = 123;

        AZFakePerson *person = [[AZFakePerson alloc] init];
        person.name = @"Windless";
        person.age = 27;
        person.isMale = YES;

        AZFakeCar *car = [[AZFakeCar alloc] init];
        car.type = @"Mini";
        car.gas = 13.333;
        person.car = car;

        room.people = @[person, person];

        NSDictionary *dic = @{
            @"address" : @"road 1",
            @"rooNumber" : @123,
            @"people" : @[
                @{
                    @"name" : @"Windless",
                    @"age" : @27,
                    @"isMale" : @YES,
                    @"car" : @{
                    @"type" : @"Mini",
                    @"gas" : @13.333
                }
                },
                @{
                    @"name" : @"Windless",
                    @"age" : @27,
                    @"isMale" : @YES,
                    @"car" : @{
                    @"type" : @"Mini",
                    @"gas" : @13.333
                }
                },
            ],
            @"host" : @""
        };

        [[[room toDic] should] equal:dic];
      });
    });
  });

SPEC_END
