//
//  VerificaVeiculoViewController.h
//  EstacionAPPFiscal
//
//  Created by TIMATRIZ on 21/11/15.
//  Copyright © 2015 Thevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface VerificaVeiculoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtPlaca;
@property (weak, nonatomic) IBOutlet UILabel *lblNome;
- (IBAction)btnVerificar:(id)sender;

@property (strong) NSMutableArray *fiscal;


@end