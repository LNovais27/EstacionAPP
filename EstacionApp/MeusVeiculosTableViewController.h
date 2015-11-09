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
    NSMutableDictionary *meuDicionario;
    NSMutableArray *modeloArray;
    NSMutableArray *placaArray;
    NSMutableArray *apelidoArray;
    
}

@property (strong) NSMutableArray *usuario;

@end
