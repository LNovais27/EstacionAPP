//
//  VeiculosViewController.h
//  EstacionApp
//
//  Created by TIMATRIZ on 04/11/15.
//  Copyright © 2015 Thevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface VeiculosViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtCarro;
@property (weak, nonatomic) IBOutlet UITextField *txtPlaca;
@property (weak, nonatomic) IBOutlet UITextField *txtApelido;
@property (strong) NSManagedObject *veiculos;



@end
