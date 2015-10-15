//
//  CustDetailViewController.m
//  Cleanify
//
//  Created by Jonathan  on 10/11/15.
//  Copyright © 2015 jonathanlimsc. All rights reserved.
//

#import "CustDetailViewController.h"

@interface CustDetailViewController ()
{
    NSDateFormatter *_dateFormatter;

}
@end

@implementation CustDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Initialise all fields
    self.title = self.customer.name;
    
    //Display Map
    CLLocationCoordinate2D initialLocale;
    initialLocale.latitude = [self.customer.latitude doubleValue];
    initialLocale.longitude = [self.customer.longitude doubleValue];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(initialLocale,800,800);
    
    self.mapView.delegate = self;
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
    point.coordinate = initialLocale;
    point.title = @"Location";
    point.subtitle = self.customer.address;
    [self.mapView addAnnotation:point];
    
    //Set Date Formatter
    _dateFormatter =[[NSDateFormatter alloc]init];
    [_dateFormatter setDateFormat:@"MM-dd-yyyy HH-mm"];
    
    //Convert date strings in customer to NSDate
    NSDate *startTime = [_dateFormatter dateFromString:self.customer.startTime];
    NSDate *endTime = [_dateFormatter dateFromString:self.customer.endTime];
    
    //Get duration
    NSTimeInterval minutes = [endTime timeIntervalSinceDate:startTime]/60;
    self.durationLabel.text = [NSString stringWithFormat:@"%d minutes", (int)minutes];
    
    //Set displayed date on DatePicker
    self.startTime.date = startTime;
    self.endTime.date = endTime;
    
    //Set displayed bedroom and bathroom number
    self.bedroomNumberLabel.text = [self.customer.bedroomNumber stringValue];
    NSLog(@"Bedroom number in CustDetailVC: %@", self.customer.bedroomNumber.stringValue);
    self.bedroomNumberStepper.value = [self.customer.bedroomNumber doubleValue];
    self.bathroomNumberLabel.text = [self.customer.bathroomNumber stringValue];
    self.bathroomNumberStepper.value = [self.customer.bathroomNumber doubleValue];
    
    //Display phone
    self.phoneField.text = self.customer.phoneNumber;
    
    //Display email
    self.emailField.text = self.customer.email;
    
    //Display address
    self.addressField.text = self.customer.address;
    
    //Display extras
    self.extraField.text = self.customer.extra;
    
    //Display cleaner
    self.cleanerField.text = self.customer.cleaner;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Save all the details
    self.customer.phoneNumber = self.phoneField.text;
    self.customer.email = self.emailField.text;
    self.customer.address = self.addressField.text;
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc]init];
    numFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    self.customer.bedroomNumber = [numFormatter numberFromString:self.bedroomNumberLabel.text];
    self.customer.bathroomNumber = [numFormatter numberFromString:self.bathroomNumberLabel.text];
    self.customer.startTime = [_dateFormatter stringFromDate:self.startTime.date];
    self.customer.endTime = [_dateFormatter stringFromDate:self.endTime.date];
    self.customer.extra = self.extraField.text;
    self.customer.cleaner = self.cleanerField.text;
    
        //Save into DB
        //Grab the delegate
        id delegate = [[UIApplication sharedApplication]delegate];
        NSManagedObjectContext *moc = [delegate managedObjectContext];
        NSError *error = nil;
        [moc save:&error];
        if(error){
            NSLog(@"Error saving to DB: %@", [error localizedDescription]);
        }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateBedroomNumber:(UIStepper *)sender
{
    self.bedroomNumberLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

-(void)updateBathroomNumber:(UIStepper *)sender
{
    self.bathroomNumberLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

@end
