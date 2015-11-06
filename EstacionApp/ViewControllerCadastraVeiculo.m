//
//  ViewControllerCadastraVeiculo.m
//  EstacionAPP
//
//  Created by TIMATRIZ on 13/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import "ViewControllerCadastraVeiculo.h"

@interface ViewControllerCadastraVeiculo ()

@end

@implementation ViewControllerCadastraVeiculo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    labelCarro.text = @"";
    labelPlaca.text = @"";
    labelApelido.text = @"";
    labelCadastraVeiculo.text = @"CADASTRAR VEICULOS";
    
    

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
- (IBAction)btnMenuCadastrarVeiculo:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)btnCadastraVeiculo:(id)sender {
    
    if([textCarro.text isEqual: @""]){
        labelCarro.text = @"Digite um nome para o carro";
    }
    if([textPlaca.text isEqual: @""]){
        labelPlaca.text = @"Digite a placa do carro";
    }

    //inicio da implementação
    
        NSString *stringUrl = @"http://scarponi.com/webservice/inserir.php";
        
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
        [body setValue:textCarro.text forKey: @"nome"];
        [body setValue:textPlaca.text forKey: @"placa"];
        [body setValue:textApelido.text forKey: @"apelido"];

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
        
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Veículo cadastrado com sucesso" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alerta show];
        
        //Limpando a tela caso a gravação tenha ocorrido com sucesso
        if (status == 1){
            textCarro.text=@"";
            textPlaca.text=@"";
            textApelido.text=@"";
        }
}
@end

