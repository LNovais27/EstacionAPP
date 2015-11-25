//
//  VeiculosViewController.m
//  EstacionApp
//
//  Created by TIMATRIZ on 04/11/15.
//  Copyright © 2015 Thevelopers. All rights reserved.
//

#import "VeiculosViewController.h"

@interface VeiculosViewController ()

@end

@implementation VeiculosViewController
@synthesize txtApelido,txtCarro,txtPlaca;
@synthesize veiculos;

- (IBAction)btnCancelar:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnSalvar:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSManagedObject *Novoveiculo = [NSEntityDescription insertNewObjectForEntityForName:@"Veiculo" inManagedObjectContext:context];
    [Novoveiculo setValue:txtCarro.text forKey:@"carro"];
    [Novoveiculo setValue:txtPlaca.text forKey:@"placa"];
    [Novoveiculo setValue:txtApelido.text forKey:@"apelido"];
    NSError *error;
    [context save:&error];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background APP.jpg"]];

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

@end
