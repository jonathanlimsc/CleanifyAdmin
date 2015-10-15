//
//  Customer.m
//  Cleanify
//
//  Created by Jonathan  on 10/11/15.
//  Copyright © 2015 jonathanlimsc. All rights reserved.
//

#import "Customer.h"

@implementation Customer

@dynamic name;
@dynamic email;
@dynamic profilePicUrl;
@dynamic startTime;
@dynamic endTime;
@dynamic extra;
@dynamic phoneNumber;
@dynamic bedroomNumber;
@dynamic bathroomNumber;
@dynamic address;

/*Customer managed objects should not override description method due to unpredictabilityu when a fault is fired
-(NSString *)description
{
    return [NSString stringWithFormat:@"Customer %@, appt from %@ to %@, %@ bedrooms, %@ bathrooms", self.name, self.startTime, self.endTime, self.bedroomNumber, self.bathroomNumber];
}
*/
-(instancetype)initWithEntity:(NSEntityDescription *)description insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
    self = [super initWithEntity:description insertIntoManagedObjectContext:context];
    if(!self){
        NSLog(@"Unable to init Customer into ManagedObject");
    }
    return self;
    
}

@end
