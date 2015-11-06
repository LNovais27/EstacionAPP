//
//  ViewControllerEsqueceuSenha.m
//  EstacionAPP
//
//  Created by TIMATRIZ on 12/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import "ViewControllerEsqueceuSenha.h"

@interface ViewControllerEsqueceuSenha ()

@end

@implementation ViewControllerEsqueceuSenha

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    labelDigiteDados.text = @"Digite seus dados";
    labelEmail.text = @"";
    labelCpf.text = @"";
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)bntEnviar:(id)sender {
    if([textEmail.text isEqual: @""]){
        labelEmail.text = @"Digite o E-mail";
    }
    if([textCPF.text isEqual: @""]){
        labelCpf.text = @"Digite o CPF";
    }
    if ([textEmail.text isEqual:@"Lucas"] && [textCPF.text isEqual:@"123"]) {
        labelTesteUsuario.text = @"Enviado";
    }
    else{
        labelTesteUsuario.text = @"Usuario não encontrado";
    }
    
}
@end
