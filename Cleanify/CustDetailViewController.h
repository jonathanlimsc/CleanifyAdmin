//
//  CustDetailViewController.h
//  Cleanify
//
//  Created by Jonathan  on 10/11/15.
//  Copyright © 2015 jonathanlimsc. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import "Customer.h"

@interface CustDetailViewController : UITableViewController <MKMapViewDelegate>

@property (nonatomic) Customer *customer;
@property (weak, nonatomic) IBOutlet UITextField *cleanerName;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UILabel *bedroomNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *bathroomNumberLabel;
@property (weak, nonatomic) IBOutlet UIStepper *bedroomNumberStepper;
@property (weak, nonatomic) IBOutlet UIStepper *bathroomNumberStepper;
@property (weak, nonatomic) IBOutlet UIDatePicker *startTime;
@property (weak, nonatomic) IBOutlet UIDatePicker *endTime;
@property (weak, nonatomic) IBOutlet UITextView *addressField;
@property (weak, nonatomic) IBOutlet UITextView *extraField;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UITextField *cleanerField;

-(IBAction)updateBedroomNumber: (UIStepper *)sender;
-(IBAction)updateBathroomNumber:(UIStepper *)sender;

@end
