//
//  Money.h
//  MyWalled
//
//  Created by Alicia Daza on 20/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;
@class Broker;

@protocol Money <NSObject>

-(id) initWithAmount: (NSInteger) amount
                      currency: (NSString *) currency;

-(id<Money>) times: (NSInteger) multiplier;

-(id<Money>) plus: (Money *) other;

-(id<Money>) reduceToCurrency: (NSString *) currency
                    withBoker: (Broker *) broker;

@end

@interface Money : NSObject<Money>

@property (nonatomic, readonly) NSString *currency;
@property (nonatomic, strong, readonly) NSNumber *amount;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;


@end
