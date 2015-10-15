//
//  ViewController.m
//  Cleanify
//
//  Created by Jonathan  on 10/10/15.
//  Copyright © 2015 jonathanlimsc. All rights reserved.
//

#import "CustListViewController.h"
#import "CustDetailViewController.h"
#import "CustomerBuilder.h"
#import "Customer.h"
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface CustListViewController () {
    NSArray *_customers; //private instance variables using class extension
    NSManagedObjectContext *_moc;

}
@end

@implementation CustListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Customers";
    
    //Fetch data from Core Data
    id delegate = [[UIApplication sharedApplication]delegate];
    _moc = [delegate managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Customer"];
    NSError *error = nil;
    _customers = [_moc executeFetchRequest:request error:&error];
    if(error){
        NSLog(@"Error fetching data from DB: %@", [error localizedDescription]);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_customers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"CustomerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
        Customer *cust = [_customers objectAtIndex:indexPath.row];
        cell.textLabel.text = cust.name;
        cell.detailTextLabel.text = cust.startTime;
    cell.imageView.image = [UIImage imageNamed:cust.profilePicUrl];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"viewCustomerDetails"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow]; //grab selected index path
        UINavigationController *navVC = segue.destinationViewController;
        CustDetailViewController *destinationVC = [navVC.viewControllers objectAtIndex:0]; //grab the rootVC
        destinationVC.customer = [_customers objectAtIndex:indexPath.row]; //pass customer to detailVC
    }
}

-(IBAction)cancelToCustListVC:(UIStoryboardSegue *)segue
{
    
}

-(IBAction)saveToCustListViewVC:(UIStoryboardSegue *)segue
{

}
#pragma mark - Managed object context
-(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}
@end
