//
//  Wallet.h
//  MyWalled
//
//  Created by Alicia Daza on 27/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Money.h"

@interface Wallet : NSObject<Money>

@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) NSUInteger currenciesCount;

-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc;

@end
