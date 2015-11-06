//
//  MeusVeiculosTableViewController.m
//  EstacionAPP
//
//  Created by TIMATRIZ on 17/09/15.
//  Copyright © 2015 Thevelopers. All rights reserved.
//

#import "MeusVeiculosTableViewController.h"

@interface MeusVeiculosTableViewController ()

@end

@implementation MeusVeiculosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *stringUrl = @"http://scarpioni.com/webservices/listar.php";
    
    NSURL *url = [NSURL URLWithString:stringUrl];
    
    NSError *error;
    //Criando uma requisição com a url informada
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //Definindo o método como Post
    [request setHTTPMethod:@"POST"];
    //setando o tipo de conteúdo com json
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //setando uma chave para acesso aos dados
    [request setValue:@"1234567890" forHTTPHeaderField:@"chave-api"];
    
    NSMutableDictionary *body = [[NSMutableDictionary alloc] init];
    //setar com seu rm para listar apenas os parques que vc cadastrou
    [body setValue:@"12777" forKey:@"rm"];
    
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
    
    NSURLResponse *resposta;
    //criando o NSData e fazendo um request
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&resposta
                                                     error:&error];
    
    //transformando o NSDATA para NSDICTIONARy o NSJSONSerialization faz o Parser do JSON
    jsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions
                                                  error:&error];
    //testes
    NSLog(@"Exibindo o Array para Teste %@", jsonArray);
    meuDicionario = [jsonArray objectAtIndex:0];//passando para o dicionario o item 0 do array
    NSLog(@"Nome do parque para teste - índice 0 %@", [meuDicionario objectForKey:@"nome"]);
    [self.tableView reloadData];
    
    /*
    //alterar WebService
    NSString *stringCep = @"http://scarponi.com/webservices/listar.php";
    
    //transformando a string em URL
    NSURL *url = [NSURL URLWithString:stringCep];
    
    
    NSError *error;
    //Criando a requisição com a URL informada
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
    //Definindo method como Post
    [request setHTTPMethod:@"@POST"];
    //setando o tipo de conteudo com json
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //setando uma chave para acesso ALTERAR SENHA!
    [request setValue:@"1234567890" forHTTPHeaderField:@"chave-api"];
    
    NSMutableDictionary *body = [[NSMutableDictionary alloc]init];
    //setar usuario para listar conteudo ALTERAR USUARIO
    [body setValue:@"12777" forKey:@"rm"];
    
    //Serializa o Dictionary para Data
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:&error];
    
    //Converte Data em String para impressao do JSON no Log
    NSString *string = [[NSString alloc] initWithData: jsonData encoding: NSUTF8StringEncoding];
    //Impreime JSON no Log
    NSLog(@"Testando os dados que irão subir %@ ", string);
    
    //Adiciona o Data no body da requisição
    [request setHTTPBody: jsonData];
    
    NSURLResponse *resposta;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse: &resposta error:&error];
    
    //Transforma NSDATA para NSDictionary o NSJSONSerialization faz o parser do JSON
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSLog(@"%@", jsonArray);//exibe Array
    meuDicionario = [jsonArray objectAtIndex:1];//passa pro Dicionario o item 0 do array ALTERAR NOME
    NSLog(@"%@", [meuDicionario objectForKey:@"nome"]);
    
*/
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [jsonArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseidentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    meuDicionario = [jsonArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [meuDicionario objectForKey:@"nome"];
    cell.detailTextLabel.text = [meuDicionario objectForKey:@"estado"];
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
