//
//  ViewControllerLogin.h
//  EstacionAPP
//
//  Created by TIMATRIZ on 12/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewControllerLogin : UIViewController{
    
    __weak IBOutlet UITextField *textEmail;
    
    __weak IBOutlet UITextField *textSenha;
    
}

@property (strong) NSManagedObject *usuario;
@property (strong) NSMutableArray *usuarios;

- (IBAction)btnEntrar:(id)sender;


@end
