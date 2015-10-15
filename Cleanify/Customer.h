//
//  Customer.h
//  Cleanify
//
//  Created by Jonathan  on 10/11/15.
//  Copyright © 2015 jonathanlimsc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Customer : NSManagedObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *profilePicUrl;
@property (nonatomic) NSString *phoneNumber;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *startTime;
@property (nonatomic) NSString *endTime;
@property (nonatomic) NSNumber *bathroomNumber;
@property (nonatomic) NSNumber *bedroomNumber;
@property (nonatomic) NSString *extra;

-(instancetype)initWithEntity:(NSEntityDescription *)description insertIntoManagedObjectContext:(NSManagedObjectContext *)context;
@end
