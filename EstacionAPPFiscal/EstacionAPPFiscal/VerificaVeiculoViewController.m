//
//  VerificaVeiculoViewController.m
//  EstacionAPPFiscal
//
//  Created by TIMATRIZ on 21/11/15.
//  Copyright © 2015 Thevelopers. All rights reserved.
//

#import "VerificaVeiculoViewController.h"

@interface VerificaVeiculoViewController ()

@end

@implementation VerificaVeiculoViewController

@synthesize txtPlaca, lblNome, fiscal;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background APP.jpg"]];

    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Fiscal"];
    
    fiscal = [[context executeFetchRequest:request error:nil]mutableCopy];
    
    NSManagedObject * contat=[fiscal objectAtIndex: [fiscal count] -1 ];
    
    lblNome.text = [NSString stringWithFormat:@"%@", [contat valueForKey:@"nome"]];
    

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

- (IBAction)btnVerificar:(id)sender {

    if([txtPlaca.text isEqual: @""]){
        
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"" message:@"Favor digitar uma placa para verificação" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alerta show];
        
    }else{
    
    
    
    NSString *caminho = [NSString stringWithFormat:@"http://177.140.236.133:7024/Restful/fiscalizador/fiscalizarVeiculo/%@",txtPlaca.text];
    
    NSLog(caminho);
    
    NSURL *url = [NSURL URLWithString:caminho];
    
    //criando o NSData e fazendo um request
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    
    NSString *retorno = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"" message:retorno delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alerta show];
    
    txtPlaca.text = @"";
    }
    
}
@end
