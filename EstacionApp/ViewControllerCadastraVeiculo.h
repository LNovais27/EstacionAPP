//
//  ViewControllerCadastraVeiculo.h
//  EstacionAPP
//
//  Created by TIMATRIZ on 13/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerCadastraVeiculo : UIViewController
{
    
    
    __weak IBOutlet UITextField *textCarro;
    __weak IBOutlet UITextField *textPlaca;
    __weak IBOutlet UITextField *textApelido;
    __weak IBOutlet UILabel *labelCarro;
    __weak IBOutlet UILabel *labelPlaca;
    __weak IBOutlet UILabel *labelApelido;
    __weak IBOutlet UILabel *labelCadastraVeiculo;
    
    
}
- (IBAction)btnCadastraVeiculo:(id)sender;


@end
