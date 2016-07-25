//
//  Money.h
//  MyWalled
//
//  Created by Alicia Daza on 20/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject

@property (nonatomic, readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

-(instancetype) initWithAmount: (NSInteger) amount
                      currency: (NSString *) currency;

-(id) times: (NSInteger) multiplier;

-(Money *) plus: (Money *) other;
@end
