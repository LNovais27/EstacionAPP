#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AppDelegate.h"

@interface UtilizaVagaViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
    
    IBOutlet UIPickerView *listaPlacas;
    IBOutlet UIPickerView *horas;
    
    NSArray *veiculos;
    
}
@property (strong) NSMutableArray * listaPlacasArray;
@property (strong) NSMutableArray * listaApelidosArray;
@property (weak, nonatomic) IBOutlet UILabel *lblSaldo;

@property (strong) NSMutableArray * listaHoras;
@property (strong) NSMutableArray *usuario;
- (IBAction)btnUtilizarVaga:(id)sender;
- (IBAction)btnPararVaga:(id)sender;


@end

