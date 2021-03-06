//
//  WalletTableViewController.m
//  MyWalled
//
//  Created by Alicia Daza on 28/07/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "WalletTableViewController.h"
#import "Wallet.h"
#import "Broker.h"

@interface WalletTableViewController ()

@property (nonatomic, strong) Wallet *model;

@end

@implementation WalletTableViewController

-(id) initWithModel: (Wallet *) model {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.model.currenciesCount + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Check last section
    if(section == self.model.currenciesCount){
        // Total section
        return 1;
        
    } else {
        NSString *currency = self.model.currencies[section];
        NSInteger numOfMoneys = [self.model moneyCountForCurrency:currency];
        return numOfMoneys + 1;
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Money *money = nil;
    NSString *cellLabelText = nil;
   
    if(indexPath.section == self.model.currenciesCount){
        // Total section
        
        Broker *broker = [Broker new];
        [broker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
        money = [broker reduce: self.model toCurrency: @"USD"];
        
        cellLabelText = [NSString stringWithFormat: @"Total in %@: %@",
                         @"USD", money.description];
        
    } else {
        NSString *currency = self.model.currencies[indexPath.section];
        
        if (indexPath.row < [self.model moneyCountForCurrency:currency]) {
            // Get money
            money = [self.model getMoneyForCurrency: currency
                                            atIndex: indexPath.row];
            
            cellLabelText = money.description;
        } else {
            // Get money
            money = [self.model totalMoneysOfCurrency: currency];
            cellLabelText = [NSString stringWithFormat: @"Subotal %@: %@",
                             currency, money.description];
        }
        
    }
    
    NSString *cellID = @"moneyCell";
    
    // Create cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                      reuseIdentifier: cellID];
    }
    
    
    // Sincronizar libreta -> celda
    cell.textLabel.text = cellLabelText;

    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
 
    if (section < self.model.currenciesCount) {
        return self.model.currencies[section];
        
    } else {
        return @"Total amount";
    }
    
}



@end
