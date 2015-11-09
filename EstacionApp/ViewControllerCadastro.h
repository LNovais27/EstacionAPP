//
//  ViewControllerCadastro.h
//  EstacionAPP
//
//  Created by TIMATRIZ on 12/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMaskTextField.h"

@interface ViewControllerCadastro : UIViewController<UITextFieldDelegate>

{
    __weak IBOutlet UILabel *labelCadastro;
    __weak IBOutlet UILabel *labelSexo;
    __weak IBOutlet UILabel *labelNome;
    __weak IBOutlet UILabel *labelSobrenome;
    __weak IBOutlet UILabel *labelEmail;
    __weak IBOutlet UILabel *labelSenha;
    __weak IBOutlet UILabel *labelConfirmarSenha;
    __weak IBOutlet UILabel *labelCpf;
    __weak IBOutlet UILabel *labelCnh;
    __weak IBOutlet UILabel *labelDataNasc;
    __weak IBOutlet UILabel *labelCelular;
    __weak IBOutlet UITextField *textNome;
    __weak IBOutlet UITextField *textSobrenome;
    __weak IBOutlet UITextField *textEmail;
    __weak IBOutlet UITextField *textSenha;
    __weak IBOutlet UITextField *textConfirmarSenha;
    __weak IBOutlet UITextField *textCpf;
    __weak IBOutlet UITextField *textCnh;
    __weak IBOutlet UITextField *textDataDia;
    __weak IBOutlet UITextField *textDataMes;
    __weak IBOutlet UITextField *textDataAno;
    __weak IBOutlet UITextField *textCelular;
    __weak IBOutlet UISegmentedControl *txtSexo;
    
}

- (IBAction)btnGravar:(id)sender;

@end
