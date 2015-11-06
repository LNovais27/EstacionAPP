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
    if ([textEmail.text isEqual:@"Lucas"] && [textSenha.text isEqual:@"123"]) {
        [self performSegueWithIdentifier:@"segueMenu" sender:sender];
        
    }
    else{
        labelTesteLogin.text = @"Login ou senha errado";
    }
    
}
@end
