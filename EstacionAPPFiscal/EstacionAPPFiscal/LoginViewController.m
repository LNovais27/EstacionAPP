//
//  LoginViewController.m
//  EstacionAPPFiscal
//
//  Created by TIMATRIZ on 21/11/15.
//  Copyright © 2015 Thevelopers. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize txtEmail, txtSenha;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background APP.jpg"]];


    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view.
}
-(void)dismissKeyboard {
    [txtEmail resignFirstResponder];
    [txtSenha resignFirstResponder];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [txtEmail resignFirstResponder];
    [txtSenha resignFirstResponder];
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
    
    //Alterar URL
    NSString *caminho = [NSString stringWithFormat:@"http://177.140.236.133:7024/Restful/fiscalizador/logarFiscal/%@/%@",txtEmail.text,txtSenha.text];
    
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
        NSString *idFiscal = [json objectForKey:@"idFiscal"];
        
        AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        
        
        
        NSManagedObject *Novocontato = [NSEntityDescription insertNewObjectForEntityForName:@"Fiscal" inManagedObjectContext:context];
        
        [Novocontato setValue:nome forKey:@"nome"];
        [Novocontato setValue:email forKey:@"email"];
        [Novocontato setValue:senha forKey:@"senha"];
        [Novocontato setValue:idFiscal forKey:@"idFiscal"];
        NSError *error;
        [context save:&error];
        
    
        [self performSegueWithIdentifier:@"segueVerificar" sender:sender];
        
        
    }
    else{
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Usuário ou senha incorretos" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alerta show];
        
        txtEmail.text = @"";
        txtSenha.text = @"";
        
    }
}

@end
