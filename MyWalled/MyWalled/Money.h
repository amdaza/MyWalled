//
//  Money.h
//  MyWalled
//
//  Created by Alicia Daza on 20/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

-(instancetype) initWithAmount:(NSInteger) amount;

-(id) times: (NSInteger) multiplier;


@end
