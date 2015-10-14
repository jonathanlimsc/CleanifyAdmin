//
//  CustDetailViewController.m
//  Cleanify
//
//  Created by Jonathan  on 10/11/15.
//  Copyright © 2015 jonathanlimsc. All rights reserved.
//

#import "CustDetailViewController.h"

@interface CustDetailViewController ()

@end

@implementation CustDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Initialise all fields
    self.title = self.customer.name;
    
    //Set Date Formatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM-dd-yyyy HH-mm"];
    
    //Convert date strings in customer to NSDate
    NSDate *startTime = [formatter dateFromString:self.customer.startTime];
    NSDate *endTime = [formatter dateFromString:self.customer.endTime];
    
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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
