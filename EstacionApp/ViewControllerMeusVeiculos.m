//
//  ViewControllerMeusVeiculos.m
//  EstacionAPP
//
//  Created by TIMATRIZ on 13/09/15.
//  Copyright (c) 2015 Thevelopers. All rights reserved.
//

#import "ViewControllerMeusVeiculos.h"

@interface ViewControllerMeusVeiculos ()

@end

@implementation ViewControllerMeusVeiculos

- (void)viewDidLoad {
    [super viewDidLoad];

  
    
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
- (IBAction)btnMenu:(id)sender {
    
    [self.navigationController popViewControllerAnimated: YES];
}

@end
