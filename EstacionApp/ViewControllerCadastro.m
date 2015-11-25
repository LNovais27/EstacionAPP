//
//  ViewControllerCadastro.m
//  EstacionAPP
//
//  Created by TIMATRIZ on 12/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import "ViewControllerCadastro.h"


@interface ViewControllerCadastro()


@end

@implementation ViewControllerCadastro

NSString *sexo = @"";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background APP.jpg"]];
    
    /*    self.maskTextFieldDataNasc.mask = @"##/##/####";
     self.maskTextFieldCpf.mask = @"###.###.###-##";
     self.maskTextFieldCelular.mask = @"(##)#####-####"; */
    labelCadastro.text = @"CADASTRO";
    labelNome.text = @"";
    labelSexo.text = @"Sexo: ";
    labelSobrenome.text = @"";
    labelEmail.text = @"";
    labelSenha.text = @"";
    labelConfirmarSenha.text = @"";
    labelCpf.text = @"";
    labelCnh.text = @"";
    labelDataNasc.text = @"";
    labelCelular.text = @"";
    
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

- (IBAction)btnGravar:(id)sender {
    
    if([textNome.text isEqual: @""]){
        labelNome.text = @"Digite o Nome";
    }else{
        if([textSobrenome.text isEqual: @""]){
            labelSobrenome.text = @"Digite o Sobrenome";
        }
        if([textEmail.text isEqual: @""]){
            labelEmail.text = @"Digite o E-mail";
        }else{
            if([textSenha.text isEqual: @""]){
                labelSenha.text = @"Digite a Senha";
            }else{
                if(![textSenha.text isEqualToString: textConfirmarSenha.text]){
                    labelConfirmarSenha.text = @"Senha incorreta";
                }
                else{
                    if([textCpf.text isEqual: @""]){
                        labelCpf.text = @"Digite o CPF";
                    }
                    if([textCnh.text isEqual: @""]){
                        labelCnh.text = @"Digite o numero da CNH";
                    }else{
                        if([textDataDia.text isEqual: @""] || [textDataMes.text isEqual: @""] || [textDataAno.text isEqual: @""] ){
                            labelDataNasc.text = @"Digite a Data de Nascimento";
                        }else{
                            if([textCelular.text isEqual: @""]){
                                labelCelular.text = @"Digite o Numero do Celular";
                            }
                            else{
                                NSString *sexo = @"0";
                                if (txtSexo.selectedSegmentIndex == 1) {
                                    NSString *sexo = @"1";
                                }
                                NSString *dataNasc = [NSString stringWithFormat:@"%@-%@-%@", textDataAno.text, textDataMes.text, textDataDia.text];
                                
                                NSString *caminho = [NSString stringWithFormat:@"http://177.140.236.133:7024/Restful/usuario/cadastrarUsuario/%@/%@/%@/%@/%@/%@/%@/%@/%@",textNome.text,
                                                     textSobrenome.text,
                                                     textEmail.text,
                                                     textCpf.text,
                                                     textCnh.text,
                                                     dataNasc,
                                                     textCelular.text,
                                                     sexo,
                                                     textSenha.text];
                                NSLog(caminho);
                                
                                NSURL *url = [NSURL URLWithString:caminho];
                                
                                //criando o NSData e fazendo um request
                                NSData *data = [NSData dataWithContentsOfURL:url];
                                
                                //transformando o NSDATA para NSDICTIONARY, o NSJSONSerialization faz o Parser do JSON
                                NSError *error;
                                NSDictionary *json=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error ];
                                
                                //caso precise isto vai exibir o conteÃºdo do dicionÃ¡rio e assim Ã© possÃvel identificar os nomes das chaves
                                NSLog(@"%@", json);
                                
                                //coletando os dados msg e status que retornaram das variaveis
                                NSString *msg = [json objectForKey:@"nome"];
                                
                                
                                UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Usuário cadastrado com sucesso" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                
                                [alerta show];
                                
                                //Limpando a tela caso a gravação tenha ocorrido com sucesso
                                if (msg != NULL ){
                                    
                                    textNome.text = @"";
                                    textSobrenome.text = @"";
                                    textEmail.text = @"";
                                    textSenha.text = @"";
                                    textConfirmarSenha.text = @"";
                                    textCpf.text = @"";
                                    textCnh.text = @"";
                                    textDataDia.text = @"";
                                    textDataMes.text = @"";
                                    textDataAno.text = @"";
                                    textCelular.text = @"";
                                }
                            }}}}}}}
}
@end
