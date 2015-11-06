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

NSArray *_listaPlacasArray;


@implementation UtilizaVagaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    listaPlacas.delegate = self;
    listaPlacas.dataSource = self;
    
    _listaPlacasArray = @[@"ABC-1234",@"DEF-5678"];
    
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
    
    return _listaPlacasArray.count;
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
    
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return _listaPlacasArray[row];
    
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
    


@end
