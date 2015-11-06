//
//  ViewControllerLogin.h
//  EstacionAPP
//
//  Created by TIMATRIZ on 12/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerLogin : UIViewController{
    
    __weak IBOutlet UILabel *labelEstacionAPP;
    
    __weak IBOutlet UITextField *textEmail;

    __weak IBOutlet UITextField *textSenha;
    
    __weak IBOutlet UILabel *labelTesteLogin;
    
}
- (IBAction)btnEntrar:(id)sender;


@end
