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
@property (nonatomic, strong) NSMutableArray *currencies;
@property (nonatomic, readonly) NSUInteger currenciesCount;

-(NSUInteger) moneyCountForCurrency: (NSString *) currency;
-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc;
-(Money *) getMoneyForCurrency: (NSString *) currency
                       atIndex: (NSInteger) index;
-(Money *) totalMoneysOfCurrency: (NSString *) currency;

@end
