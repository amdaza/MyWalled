//
//  Wallet.m
//  MyWalled
//
//  Created by Alicia Daza on 27/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "Wallet.h"

@interface Wallet()

@property (nonatomic, strong) NSMutableDictionary *moneys;


@end

@implementation Wallet

-(NSUInteger) count {
    return [self.moneys count];
}

-(NSUInteger) currenciesCount {
    return [self.currencies count];
}


-(NSUInteger) moneyCountForCurrency: (NSString *) currency {
    
    NSMutableArray *currencyMoneys = [self.moneys valueForKey: currency];
    
    return [currencyMoneys count];
}

-(id) initWithAmount:(NSInteger)amount
            currency:(NSString *)currency {
    
    if (self = [super init]) {
        Money *money = [[Money alloc] initWithAmount:amount
                                            currency:currency];
        //_moneys = [NSMutableArray array];
        //[_moneys addObject: money];
        
        NSMutableArray *currencyMoneys = [NSMutableArray array];
        [currencyMoneys addObject: money];
        
        _moneys = [@{}mutableCopy];
        [_moneys setObject:currencyMoneys
                    forKey:currency];
        
        _currencies = [NSMutableArray array];
        [_currencies addObject: currency];
    }
    return self;
}

-(id<Money>) plus:(Money *)other {
    
    NSMutableArray *currencyMoneys = [self.moneys valueForKey: other.currency];
    
    if (currencyMoneys == nil) {
        currencyMoneys = [NSMutableArray array];
        [currencyMoneys addObject: other];
        
        [self.moneys setObject: currencyMoneys
                        forKey: other.currency];

    } else {
        [currencyMoneys addObject: other];
    }
    
    
    
    if (![self.currencies containsObject:other.currency]) {
        [self.currencies addObject: other.currency];
    }
    
    return self;
}

-(id<Money>) times:(NSInteger)multiplier {
    
    for (NSString *currencyName in self.currencies) {
        
        NSMutableArray *currencyMoneys = [self.moneys valueForKey: currencyName];
    
        NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:currencyMoneys.count];
    
        for (Money *each in currencyMoneys) {
            Money *newMoney = [each times:multiplier];
            [newMoneys addObject:newMoney];
        }
        //currencyMoneys = newMoneys;
        [self.moneys setObject:newMoneys forKey: currencyName];
    }
    
    return self;
}

-(Money *) reduceToCurrency: (NSString *) currency
                    withBoker: (Broker *) broker {
    
    Money *result = [[Money alloc] initWithAmount:0
                                         currency:currency];
    for (NSString *currencyName in self.currencies) {
        
        NSMutableArray *currencyMoneys = [self.moneys valueForKey: currencyName];
        
        for (Money *each in currencyMoneys){
            result = [result plus: [each reduceToCurrency:currency
                                                withBoker:broker]];
        }
    }
    return result;
}

-(Money *) totalMoneysOfCurrency: (NSString *) currency{
    Money *result = [[Money alloc] initWithAmount:0
                                         currency:currency];
    
    NSMutableArray *currencyMoneys = [self.moneys valueForKey: currency];
    
    for (Money *m in currencyMoneys){
        result = [result plus: m];
    }
    
    return result;
}

-(Money *) getMoneyForCurrency: (NSString *) currency
                       atIndex: (NSInteger) index {
    
    NSMutableArray *currencyMoneys = [self.moneys valueForKey: currency];
    
    return currencyMoneys[index];
    
}


#pragma mark - Test Notifications
-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc {
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
}


-(void) dumpToDisk: (NSNotification *) notification {
    // Save data, you fools!
}







@end
