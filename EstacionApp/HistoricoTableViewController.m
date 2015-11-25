//
//  HistoricoTableViewController.m
//  EstacionAPP
//
//  Created by TIMATRIZ on 17/09/15.
//  Copyright © 2015 Thevelopers. All rights reserved.
//

#import "HistoricoTableViewController.h"

@interface HistoricoTableViewController ()

@end        

@implementation HistoricoTableViewController

@synthesize usuario;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background APP.jpg"]];

    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Usuario"];
    
    usuario = [[context executeFetchRequest:request error:nil]mutableCopy];
    
    NSManagedObject * contat=[usuario objectAtIndex:[usuario count]-1];
    
    NSString *id = [NSString stringWithFormat:@"%@", [contat valueForKey:@"idUsuario"]];
    
    //ALTERAR
    NSString *caminho = [NSString stringWithFormat:@"http://177.140.236.133:7024/Restful/usuario/consultarHistorico/%@",id];
    
    NSLog(caminho);
    
    NSURL *url = [NSURL URLWithString:caminho];
    
    //criando o NSData e fazendo um request
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    //transformando o NSDATA para NSDICTIONARY, o NSJSONSerialization faz o Parser do JSON
    NSError *error;
    NSDictionary *json=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error ];
    
    //caso precise isto vai exibir o conteÃºdo do dicionÃ¡rio e assim Ã© possÃvel identificar os nomes das chaves
    NSLog(@"Json %@", json);
    
    NSArray *wrapper= [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    logs = [json valueForKey:@"log"];
    
    NSLog(@" criou o array de logs ");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return logs.count -1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseidentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *log = logs[indexPath.row];
    
    NSString * descricao = [log objectForKey:@"descricao"];
    if([descricao  isEqual: @"Utilização do zona azul"]){
        
        
        cell.textLabel.text = [log objectForKey:@"placa"];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@",[log objectForKey:@"descricao"],[log objectForKey:@"data"]];

    }else{
    
        cell.textLabel.text = [log objectForKey:@"descricao"];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@",[log objectForKey:@"valorRecarga"],[log objectForKey:@"data"]];
    
}
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
