//
//  ViewControllerCadastro.m
//  EstacionAPP
//
//  Created by TIMATRIZ on 12/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import "ViewControllerCadastro.h"
#import "VMaskTextField.h"

@interface ViewControllerCadastro()


@end

@implementation ViewControllerCadastro

- (void)viewDidLoad {
    [super viewDidLoad];
    
/*    self.maskTextFieldDataNasc.mask = @"##/##/####";
    self.maskTextFieldCpf.mask = @"###.###.###-##";
    self.maskTextFieldCelular.mask = @"(##)#####-####"; */
    
    labelCadastro.text = @"CADASTRO";
    labelNome.text = @"";
    labelSexo.text = @"Sexo: ";
    labelSobrenome.text = @"";
    labelEmail.text = @"";
    labelSenha.text = @"";
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

- (IBAction)btnCadastrar:(id)sender {
    if([textNome.text isEqual: @""]){
       labelNome.text = @"Digite o Nome";
    }
    if([textSobrenome.text isEqual: @""]){
        labelSobrenome.text = @"Digite o Sobrenome";
    }
    if([textEmail.text isEqual: @""]){
        labelEmail.text = @"Digite o E-mail";
    }
    if([textSenha.text isEqual: @""]){
        labelSenha.text = @"Digite a Senha";
    }
    if([textCpf.text isEqual: @""]){
        labelCpf.text = @"Digite o CPF";
    }
    if([textCnh.text isEqual: @""]){
        labelCnh.text = @"Digite o numero da CNH";
    }
    if([textDataNasc.text isEqual: @""]){
        labelDataNasc.text = @"Digite a Data de Nascimento";
    }
    if([textCelular.text isEqual: @""]){
        labelCelular.text = @"Digite o Numero do Celular";
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    VMaskTextField * maskTextField = (VMaskTextField*) textField;
    return  [maskTextField shouldChangeCharactersInRange:range replacementString:string];
}

- (IBAction)btnGravar:(id)sender {
    
    NSString *stringUrl = @"http://177.140.236.133:7024/Restful/usuario/listarTodos";
    
    //transformando a string em URL
    NSURL *url = [NSURL URLWithString:stringUrl];
    
    //Criando uma requisição com a URL informada
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //Definindo method como post
    [request setHTTPMethod:@"POST"];
    
    //setando o tipo de conteudo com JSON
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //setando uma chave para acesso aos dados.
    //[request setValue:@"TheVelopers" forHTTPHeaderField:@"chave-api"];
    NSMutableDictionary *body = [[NSMutableDictionary alloc]init];
    [body setValue:textNome.text forKey: @"nome"];
    [body setValue:textSobrenome.text forKey: @"sobrenome"];
    [body setValue:textEmail.text forKey: @"smail"];
    [body setValue:textSenha.text forKey: @"senha"];
    [body setValue:textCpf.text forKey: @"cpf"];
    [body setValue:textCnh.text forKey: @"ch"];
    [body setValue:textDataNasc.text forKey: @"dataNasc"];
    [body setValue:textCelular.text forKey: @"celular"];
    
    //Serializa o Dictionary para Data
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:&error];
    
    //Converte Data em String para impressao do JSON no Log
    NSString *string = [[NSString alloc] initWithData: jsonData encoding: NSUTF8StringEncoding];
    //Impreime JSON no Log
    NSLog(@"Testando os dados que irão subir %@ ", string);
    
    //Adiciona o Data no body da requisição
    [request setHTTPBody: jsonData];
    
    NSURLResponse *resposta;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse: &resposta error:&error];
    
    //Transforma NSDATA para NSDictionary o NSJSONSerialization faz o parser do JSON
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSLog(@"Exibindo os dados que retornaram da gravação %@ ", json);
    
    //coletando os dados msg e status que retornaram das variaveis
    NSString *msg = [json objectForKey:@"mensagem"];
    int status = [[json objectForKey:@"status"]intValue];
    
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Usuário cadastrado com sucesso" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alerta show];
    
    //Limpando a tela caso a gravação tenha ocorrido com sucesso
    if (status == 1){
        textNome.text=@"";
        textSobrenome.text=@"";
        textEmail.text=@"";
        textSenha.text=@"";
        textCpf.text=@"";
        textCnh.text=@"";
        textDataNasc.text=@"";
        textCelular.text=@"";
    }
    
    
}
@end
