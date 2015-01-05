//
// Created by 钟建明 on 15/1/5.
//

#import <objc/runtime.h>
#import "NSObject+ToDic.h"


@implementation NSObject (ToDic)
- (id)toDic {
  if ([self isKindOfClass:[NSString class]]) {
    return self;
  }

  if ([self isKindOfClass:[NSArray class]]) {
    NSArray *array = (NSArray *) self;
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:array.count];
    for (id item in array) {
      [result addObject:[item toDic]];
    }
    return result;
  }

  if ([self isKindOfClass:[NSObject class]]) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);

    for (int i = 0; i < count; i++) {
      NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
      id value = [self valueForKey:key];
      if (!value) {
        dictionary[key] = @"";
      } else {
        if ([value isKindOfClass:[NSNumber class]]) {
          NSLog(@"number: %@", value);
          dictionary[key] = value;
        } else {
          dictionary[key] = [value toDic];
        }
      }
    }

    free(properties);
    return dictionary;
  }

  return nil;
}

@end