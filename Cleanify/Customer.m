//
//  Customer.m
//  Cleanify
//
//  Created by Jonathan  on 10/11/15.
//  Copyright © 2015 jonathanlimsc. All rights reserved.
//

#import "Customer.h"

@implementation Customer

-(NSString *)description
{
    return [NSString stringWithFormat:@"Customer %@, appt from %@ to %@, %@ bedrooms, %@ bathrooms", self.name, self.startTime, self.endTime, self.bedroomNumber, self.bathroomNumber];
}
@end
