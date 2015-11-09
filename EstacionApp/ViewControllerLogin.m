//
//  ViewControllerLogin.m
//  EstacionAPP
//
//  Created by TIMATRIZ on 12/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import "ViewControllerLogin.h"

@interface ViewControllerLogin ()

@end

@implementation ViewControllerLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    
    labelEstacionAPP.text = @"EstacionAPP";
    labelTesteLogin.text = @"Teste Login";
    
    [textEmail setDelegate:self];
    [textSenha setDelegate:self];
    

    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    
    // Do any additional setup after loading the view.
}
-(void)dismissKeyboard {
    [textEmail resignFirstResponder];
    [textSenha resignFirstResponder];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textEmail resignFirstResponder];
    [textSenha resignFirstResponder];
    return YES;
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



/*    if ([textEmail.text isEqual:@"Lucas"] && [textSenha.text isEqual:@"123"]) {

    [self.navigationController popViewControllerAnimated: YES];
        
    }
    else{
        labelTesteLogin.text = @"Login ou senha errado";
    }
    
}
*/
- (IBAction)btnEntrar:(id)sender {
    
    
    NSString *caminho = [NSString stringWithFormat:@"http://177.140.236.133:7024/Restful/usuario/logarUsuario/%@/%@",textEmail.text,textSenha.text];
    
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
    NSString *nome = [json objectForKey:@"nome"];
    if (nome != NULL) {
        
        NSString *nome = [json objectForKey:@"nome"];
        NSString *email = [json objectForKey:@"email"];
        NSString *senha = [json objectForKey:@"senha"];
        NSString *idUsuario = [json objectForKey:@"idUsuario"];
        
        AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        
        
        
        NSManagedObject *Novocontato = [NSEntityDescription insertNewObjectForEntityForName:@"Usuario" inManagedObjectContext:context];
        
        [Novocontato setValue:nome forKey:@"nome"];
        [Novocontato setValue:email forKey:@"email"];
        [Novocontato setValue:senha forKey:@"senha"];
        [Novocontato setValue:idUsuario forKey:@"idUsuario"];
        NSError *error;
        [context save:&error];
        
        
        
        [self performSegueWithIdentifier:@"segueMenu" sender:sender];
        
    }
    else{
        labelTesteLogin.text = @"Login ou senha errado";
    }
    
}
@end
