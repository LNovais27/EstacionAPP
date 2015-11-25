//
//  MeusVeiculosTableViewController.h
//  EstacionAPP
//
//  Created by TIMATRIZ on 17/09/15.
//  Copyright © 2015 Thevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface MeusVeiculosTableViewController : UITableViewController{
    
    NSMutableArray *jsonArray;
    NSMutableArray *veiculosTable;
    NSMutableArray *celulas;
    NSArray *veiculos;
    NSDictionary *json;
    
}

@property (strong) NSMutableArray *usuario;

@end
