//
//  ViewController.m
//  MyMapView Project
//
//  Created by Himal Madhushan on 7/29/15.
//  Copyright (c) 2015 Himal Madhushan. All rights reserved.
//

#import "UtilizaVagaViewController.h"

@interface UtilizaVagaViewController () <MKMapViewDelegate> {
    
    __weak IBOutlet MKMapView *myMapView;
    
    CLLocationManager *locatioManager;
}

@end

@implementation UtilizaVagaViewController
@synthesize usuario, listaPlacasArray, listaApelidosArray, listaHoras, lblSaldo;

NSString * valorPlaca;
NSString * valorHora;
NSString *idUsuarioBanco;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background APP.jpg"]];
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Usuario"];
    
    usuario = [[context executeFetchRequest:request error:nil]mutableCopy];
    
    NSManagedObject * contat=[usuario objectAtIndex:[usuario count] - 1];
    
    idUsuarioBanco = [NSString stringWithFormat:@"%@", [contat valueForKey:@"idUsuario"]];
    NSString *email = [NSString stringWithFormat:@"%@", [contat valueForKey:@"email"]];
    
    
    NSString *caminho1 = [NSString stringWithFormat:@"http://177.140.236.133:7024/Restful/usuario/fornecerInfo/%@",email];
    
    NSLog(caminho1);
    
    NSURL *url1 = [NSURL URLWithString:caminho1];
    
    //criando o NSData e fazendo um request
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    
    //transformando o NSDATA para NSDICTIONARY, o NSJSONSerialization faz o Parser do JSON
    NSError *error1;
    NSDictionary *json1=[NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error: &error1 ];
    
    //caso precise isto vai exibir o conteÃºdo do dicionÃ¡rio e assim Ã© possÃvel identificar os nomes das chaves
    NSLog(@"Json %@", json1);
    lblSaldo.text = [json1 objectForKey:@"saldo"];
    
    
    NSString *caminho = [NSString stringWithFormat:@"http://177.140.236.133:7024/Restful/veiculo/listarMeusVeiculos/%@",idUsuarioBanco];
    
    NSLog(caminho);
    
    NSURL *url = [NSURL URLWithString:caminho];
    
    //criando o NSData e fazendo um request
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    //transformando o NSDATA para NSDICTIONARY, o NSJSONSerialization faz o Parser do JSON
    NSError *error;
    NSDictionary *json=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: &error ];
    
    //caso precise isto vai exibir o conteÃºdo do dicionÃ¡rio e assim Ã© possÃvel identificar os nomes das chaves
    NSLog(@"Json %@", json);
    
    veiculos = [json valueForKey:@"veiculo"];
    listaPlacasArray = [[NSMutableArray alloc] init];
    listaApelidosArray = [[NSMutableArray alloc] init];
    
    [listaApelidosArray addObject:@"-----"];
    [listaPlacasArray addObject:@"-----"];
    
    for (int i=0; i<[veiculos count]; i++) {
        NSDictionary *veiculo = veiculos[i];
        
        [listaApelidosArray addObject:[veiculo objectForKey:@"apelido"]];
        [listaPlacasArray addObject:[veiculo objectForKey:@"placa"]];
    }
    
    
    listaHoras = @[@"--",@"1",@"2"];
    
    
    listaPlacas.tag = 1;
    horas.tag = 2;
    
    myMapView.showsUserLocation = YES;
    myMapView.showsBuildings = YES;
    myMapView.delegate = self;
    
    locatioManager = [CLLocationManager new];
    if ([locatioManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locatioManager requestWhenInUseAuthorization];
    }
    [locatioManager startUpdatingLocation];
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if ([pickerView tag] == 1)
        return listaApelidosArray.count - 1;
    else
        return listaHoras.count;
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if ([pickerView tag] == 1)
        return listaApelidosArray[row];
    else
        return listaHoras[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if ([pickerView tag] == 1)
        valorPlaca = [listaPlacasArray objectAtIndex:row];
    else
        valorHora = [listaHoras objectAtIndex:row];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion mapRegion;
    mapRegion.center = mapView.userLocation.coordinate;
    mapRegion.span.latitudeDelta = 0.001f;
    mapRegion.span.longitudeDelta = 0.001f;
    
    [mapView setRegion:mapRegion animated: YES];
}
/*-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
 
 [myMapView setRegion:MKCoordinateRegionMake(userLocation.coordinate, MKCoordinateSpanMake(0.1f, 0.1f)) animated:YES];
 
 MKMapCamera *camera = [MKMapCamera cameraLookingAtCenterCoordinate:userLocation.coordinate fromEyeCoordinate:CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude) eyeAltitude:10000];
 [mapView setCamera:camera animated:YES];*/



- (IBAction)btnUtilizarVaga:(id)sender {
    
    if ([valorHora isEqual:@"--"] || [valorPlaca isEqual:@"-----"] || valorHora == NULL || valorPlaca == NULL){
        
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"OPS!!" message:@"Selecione a Hora e o Veículo"                                                    delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alerta show];
    }
    
    else{
        NSString *caminho = [NSString stringWithFormat:@"http://177.140.236.133:7024/Restful/veiculo/estacionar/%@/%@",valorPlaca, valorHora];
        
        NSLog(caminho);
        
        NSURL *url = [NSURL URLWithString:caminho];
        
        //criando o NSData e fazendo um request
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        NSString *retorno = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"retorno da url %@", retorno);
        
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"" message:retorno                                                    delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alerta show];
    }
}

- (IBAction)btnPararVaga:(id)sender {
    
    NSString *caminho = [NSString stringWithFormat:@"http://177.140.236.133:7024/Restful/veiculo/pararCobranca/%@",valorPlaca];
    
    NSLog(caminho);
    
    NSURL *url = [NSURL URLWithString:caminho];
    
    //criando o NSData e fazendo um request
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSString *retorno = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"retorno da url %@", retorno);
    
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"" message:retorno                                                    delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alerta show];
    
}
@end
