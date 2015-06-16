//
//  Jobs.m
//
//  Created by Ratna Kumalasari on 6/15/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Jobs.h"
#import "Data.h"


NSString *const kJobsId = @"id";
NSString *const kJobsStatus = @"status";
NSString *const kJobsData = @"data";


@interface Jobs ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Jobs

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize status = _status;
@synthesize data = _data;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kJobsId fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kJobsStatus fromDictionary:dict] doubleValue];
            self.data = [Data modelObjectWithDictionary:[dict objectForKey:kJobsData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kJobsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kJobsStatus];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kJobsData];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kJobsId];
    self.status = [aDecoder decodeDoubleForKey:kJobsStatus];
    self.data = [aDecoder decodeObjectForKey:kJobsData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kJobsId];
    [aCoder encodeDouble:_status forKey:kJobsStatus];
    [aCoder encodeObject:_data forKey:kJobsData];
}

- (id)copyWithZone:(NSZone *)zone
{
    Jobs *copy = [[Jobs alloc] init];
    
    if (copy) {

        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.status = self.status;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
