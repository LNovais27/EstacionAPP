//
//  HistoricoTableViewController.h
//  EstacionAPP
//
//  Created by TIMATRIZ on 17/09/15.
//  Copyright © 2015 Thevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface HistoricoTableViewController : UITableViewController{
    
    NSMutableArray *jsonArray;
    NSMutableDictionary *meuDicionario;
    NSArray *logs;
    
}

@property (strong) NSMutableArray *usuario;



@end
