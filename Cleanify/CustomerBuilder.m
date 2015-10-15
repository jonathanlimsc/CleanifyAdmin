//
//  CustomerConverter.m
//  Cleanify
//
//  Created by Jonathan  on 10/11/15.
//  Copyright © 2015 jonathanlimsc. All rights reserved.
//

#import "CustomerBuilder.h"
#import "Customer.h"
#import <UIKit/UIKit.h>

@implementation CustomerBuilder

+(void)parseJsonFile
{
    //Reading from file
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"json"];//data.json
    NSError *error;
    
   /* NSString *jsonStr = [[NSString alloc]initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if(error){
        NSLog(@"Error in parseJSONFile: %@", error);
    }
    */
    NSData *dataFromFile = [[NSData alloc]initWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    if(error){
        NSLog(@"Error in parseJSONFile: %@", error);
        error = nil;
    }
    //Check if JSON is valid
    BOOL isJsonValid = [NSJSONSerialization isValidJSONObject:dataFromFile];
    NSLog(@"Json is valid: %hhd", isJsonValid);
    
    //Generating JSON
    NSArray *json = [NSJSONSerialization JSONObjectWithData:dataFromFile options:kNilOptions error:&error];
    if(error){
        NSLog(@"Error in parseJSONFile json: %@", error);
        error = nil;
    }
    
    //Generating customers array
    NSArray *customers = [[NSMutableArray alloc]init];
    
    id delegate = [[UIApplication sharedApplication]delegate]; //grab App Delegate
    NSManagedObjectContext *moc = [delegate managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Customer"];
    customers = [moc executeFetchRequest:request error:&error];
    if(error){
        NSLog(@"Error fetching data from DB: %@", [error localizedDescription]);
        error = nil;
    }
    
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Customer" inManagedObjectContext:moc];
    
    for(NSDictionary *item in json){
        Customer *newCustomer = [[Customer alloc]initWithEntity:description insertIntoManagedObjectContext:moc];
        for(NSString *key in item){
            NSLog(@"Parsed %@: %@", key, item[key] );
            if([key isEqualToString:@"name"]){
                newCustomer.name = item[key];
                NSLog(@"Name: %@", item[key]);
            }
            if([key isEqualToString:@"profilepic"]){
                newCustomer.profilePicUrl = item[key];
                NSLog(@"Profile pic url: %@", item[key]);
            }
            if([key isEqualToString:@"phone"]){
                newCustomer.phoneNumber = item[key];
                NSLog(@"Phone number: %@", item[key]);
            }
            if([key isEqualToString:@"email"]){
                newCustomer.email = item[key];
                NSLog(@"Email: %@", item[key]);
            }
            if([key isEqualToString:@"address"]){
                newCustomer.address = item[key];
                NSLog(@"Address: %@", item[key]);
            }
            if([key isEqualToString:@"startTime"]){
                newCustomer.startTime = item[key];
                NSLog(@"Start time: %@", item[key]);
            }
            if([key isEqualToString:@"endTime"]){
                newCustomer.endTime = item[key];
                NSLog(@"End time: %@", item[key]);
            }
            if([key isEqualToString:@"bathroomNumber"]){
                newCustomer.bathroomNumber = (NSNumber *)item[key];
                NSLog(@"No. of bathrooms: %@", item[key]);
            }
            if([key isEqualToString:@"bedroomNumber"]){
                newCustomer.bedroomNumber = (NSNumber *)item[key];
                NSLog(@"No. of bedrooms: %@", item[key]);
            }
            if([key isEqualToString:@"extra"]){
                newCustomer.extra = item[key];
                NSLog(@"Extra request: %@", item[key]);
            }
        }
        [moc save:&error];
        if(error){
            NSLog(@"%@", [error localizedDescription]);
        }
        NSLog(@"Customer added: %@", newCustomer);
    }
    
    /*For deleting all objects in Core Data
     for(Customer *cust in customers){
     if(cust){
     [moc deleteObject:cust];
     }
     }
     [moc save:&error];
     if(error){
     NSLog(@"%@", [error localizedDescription]);
     }
     */
     
}

@end
