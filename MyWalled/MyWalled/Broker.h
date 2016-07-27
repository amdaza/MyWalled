//
//  Broker.h
//  MyWalled
//
//  Created by Alicia Daza on 25/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;

@interface Broker : NSObject

- (Money *) reduce: (Money *) money toCurrency: (NSString *) currency;

- (void) addRate: (NSInteger) rate
    fromCurrency: (NSString *) fromCurrency
      toCurrency: (NSString *) toCurrency;

@end