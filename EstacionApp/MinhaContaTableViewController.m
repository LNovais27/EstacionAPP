//
//  MinhaContaTableViewController.m
//  EstacionAPP
//
//  Created by TIMATRIZ on 17/09/15.
//  Copyright © 2015 Thevelopers. All rights reserved.
//

#import "MinhaContaTableViewController.h"

@interface MinhaContaTableViewController ()

@end

@implementation MinhaContaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *stringUrl = [NSURL URLWithString:@"http://177.140.236.133:7024/Restful/usuario/listarTodos"];
    
    
    
    NSError *error;
    //Criando uma requisição com a url informada
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:stringUrl];
    //setando o tipo de conteúdo com json
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableDictionary *body = [[NSMutableDictionary alloc] init];
    
    //Serializa o Dictionary para Data
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:body
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    //Converte Data em String para impressao do JSON no Log
    NSString *string = [[NSString alloc] initWithData:jsonData
                                             encoding:NSUTF8StringEncoding];
    //Imprime JSON no Log.
    NSLog(@"Exibindo a String do Json para Teste, veja as informações que irão subir %@", string);
    
    //Adiciona o Data no Body(Corpo) da requisição
    [request setHTTPBody:jsonData];
    
    //criando o NSData e fazendo um request
    NSData *data = [NSData dataWithContentsOfURL:stringUrl];
    
    //transformando o NSDATA para NSDICTIONARy o NSJSONSerialization faz o Parser do JSON
    jsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions
                                                  error:&error];
    //testes
    NSLog(@"Exibindo o Array para Teste %@", jsonArray);
    meuDicionario = [jsonArray objectAtIndex:0];//passando para o dicionario o item 0 do array
    NSLog(@"Nome do parque para teste - índice 0 %@", [meuDicionario objectForKey:@"nome"]);
    [self.tableView reloadData];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [jsonArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    meuDicionario = [jsonArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [meuDicionario objectForKey:@"nome"];
    cell.detailTextLabel.text = [meuDicionario objectForKey:@"sobreNome"];
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
