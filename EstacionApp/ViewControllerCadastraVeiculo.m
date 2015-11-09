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
@synthesize usuario;
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
    }else{
    if([textPlaca.text isEqual: @""]){
        labelPlaca.text = @"Digite a placa do carro";
    }else{
    
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Usuario"];
    
    usuario = [[context executeFetchRequest:request error:nil]mutableCopy];

    NSManagedObject * contat=[usuario objectAtIndex:0];

    NSString *id = [NSString stringWithFormat:@"%@", [contat valueForKey:@"idUsuario"]];

        NSLog(@"Print do ID %@", id);
    
    NSString *caminho = [NSString stringWithFormat:@"http://177.140.236.133:7024/Restful/veiculo/cadastrarVeiculo/%@/%@/%@/%@",textCarro.text, textPlaca.text, textApelido.text, id];
    
    NSLog(caminho);
    
    NSURL *url = [NSURL URLWithString:caminho];
    
    //criando o NSData e fazendo um request
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    //transformando o NSDATA para NSDICTIONARY, o NSJSONSerialization faz o Parser do JSON
    NSError *error;
    NSDictionary *json=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error ];
    
    //caso precise isto vai exibir o conteÃºdo do dicionÃ¡rio e assim Ã© possÃvel identificar os nomes das chaves
    NSLog(@"Json %@", json);
    
    //coletando os dados msg e status que retornaram das variaveis
    NSString *nome = [json objectForKey:@"nome"];
    if (nome != NULL) {
        //coletando os dados msg e status que retornaram das variaveis
        NSString *msg = [json objectForKey:@"nome"];
        
        
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Carro cadastrado com sucesso" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alerta show];
        
        textCarro.text = @"";
        textPlaca.text = @"";
        textApelido.text =@"";
        
        
}
}
}
}


@end

