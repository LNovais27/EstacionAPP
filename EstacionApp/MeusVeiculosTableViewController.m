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
@synthesize usuario;

- (void)viewDidLoad {
    [super viewDidLoad];

    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Usuario"];
    
    usuario = [[context executeFetchRequest:request error:nil]mutableCopy];
    
    NSManagedObject * contat=[usuario objectAtIndex:0];
    
    NSString *id = [NSString stringWithFormat:@"%@", [contat valueForKey:@"idUsuario"]];
    
    
    NSString *caminho = [NSString stringWithFormat:@"http://177.140.236.133:7024/Restful/veiculo/listarMeusVeiculos/%@",id];
    
    NSLog(caminho);
    
    NSURL *url = [NSURL URLWithString:caminho];
    
    //criando o NSData e fazendo um request
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    //transformando o NSDATA para NSDICTIONARY, o NSJSONSerialization faz o Parser do JSON
    NSError *error;
    NSDictionary *json=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error ];
    
    //caso precise isto vai exibir o conteÃºdo do dicionÃ¡rio e assim Ã© possÃvel identificar os nomes das chaves
    NSLog(@"Json %@", json);
    
   modeloArray = [[NSMutableArray alloc]init];
    placaArray = [[NSMutableArray alloc]init];
    apelidoArray = [[NSMutableArray alloc]init];
    
    NSArray *wrapper= [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSDictionary *veiculo = [wrapper objectAtIndex:0];
 
//    NSDictionary *veiculos = [json objectForKey:@"veiculo"];
     NSLog(@" criou o array de veiculos ");
 //   for (NSDictionary *veiculo in veiculos) {
    NSLog(@"entrou no for");
    NSString *modelo = veiculo[@"modelo"];
    NSString *placa = veiculo[@"placa"];
    NSString *apelido = veiculo[@"apelido"];
    NSLog(@"Rafael Viado %@ %@ %@", modelo, placa, apelido);
     /*  [modeloArray addObject:[[veiculos objectForKey:veiculo]objectForKey:@"modelo"]];;
       [placaArray addObject:[[veiculos objectForKey:veiculo]objectForKey:@"placa"]];
        [apelidoArray addObject:[[veiculos objectForKey:veiculo]objectForKey:@"apelido"]];
        NSLog(@"saiu do for");
        // THE REST OF YOUR CODE
    }*/
    
   /* for (NSDictionary *tempDic in veiculo){
        [modeloArray addObject:[[veiculo objectForKey:tempDic]objectForKey:@"modelo"]];
        [placaArray addObject:[[veiculo objectForKey:tempDic]objectForKey:@"placa"]];
        [apelidoArray addObject:[[veiculo objectForKey:tempDic]objectForKey:@"apelido"]];
    }*/
    
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
    return [modeloArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseidentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = modeloArray[indexPath.row];
    cell.detailTextLabel.text = placaArray [indexPath.row];
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
