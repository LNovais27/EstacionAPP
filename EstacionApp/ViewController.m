//
//  ViewController.m
//  EstacionAPP
//
//  Created by TIMATRIZ on 12/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

-(IBAction)displayAlertView:(id)sender{
    
    UIAlertController *alerta =   [UIAlertController
                                  alertControllerWithTitle:@"Carro validado"
                                  message:@"O veículo está apto a utilizar a Zona Azul"
                                  preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alerta animated:YES completion:nil];
}


@end
