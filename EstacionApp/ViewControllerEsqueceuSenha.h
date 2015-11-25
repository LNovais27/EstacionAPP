//
//  ViewControllerEsqueceuSenha.h
//  EstacionAPP
//
//  Created by TIMATRIZ on 12/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>

@interface ViewControllerEsqueceuSenha : UIViewController{
    
    __weak IBOutlet UILabel *labelDigiteDados;
    __weak IBOutlet UITextField *textEmail;
    __weak IBOutlet UITextField *textCPF;
    __weak IBOutlet UILabel *labelTesteUsuario;
    __weak IBOutlet UILabel *labelEmail;
    __weak IBOutlet UILabel *labelCpf;
    
    
}

- (IBAction)bntEnviar:(id)sender;

@end
