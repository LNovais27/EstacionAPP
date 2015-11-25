//
//  LoginViewController.h
//  EstacionAPPFiscal
//
//  Created by TIMATRIZ on 21/11/15.
//  Copyright © 2015 Thevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtSenha;
- (IBAction)btnEsqueceuSenha:(id)sender;
- (IBAction)btnEntrar:(id)sender;


@property (strong) NSManagedObject *fiscal;

@end
