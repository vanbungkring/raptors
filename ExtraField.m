//
//  ExtraField.m
//
//  Created by Ratna Kumalasari on 6/15/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ExtraField.h"


NSString *const kExtraFieldOnmousedown = @"onmousedown";
NSString *const kExtraFieldState = @"state";
NSString *const kExtraFieldSponsored = @"sponsored";
NSString *const kExtraFieldIndeedApply = @"indeedApply";
NSString *const kExtraFieldExpired = @"expired";
NSString *const kExtraFieldFormattedLocation = @"formattedLocation";
NSString *const kExtraFieldJobkey = @"jobkey";
NSString *const kExtraFieldLongitude = @"longitude";
NSString *const kExtraFieldLatitude = @"latitude";
NSString *const kExtraFieldFormattedLocationFull = @"formattedLocationFull";
NSString *const kExtraFieldFormattedRelativeTime = @"formattedRelativeTime";
NSString *const kExtraFieldCountry = @"country";


@interface ExtraField ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ExtraField

@synthesize onmousedown = _onmousedown;
@synthesize state = _state;
@synthesize sponsored = _sponsored;
@synthesize indeedApply = _indeedApply;
@synthesize expired = _expired;
@synthesize formattedLocation = _formattedLocation;
@synthesize jobkey = _jobkey;
@synthesize longitude = _longitude;
@synthesize latitude = _latitude;
@synthesize formattedLocationFull = _formattedLocationFull;
@synthesize formattedRelativeTime = _formattedRelativeTime;
@synthesize country = _country;


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
            self.onmousedown = [self objectOrNilForKey:kExtraFieldOnmousedown fromDictionary:dict];
            self.state = [self objectOrNilForKey:kExtraFieldState fromDictionary:dict];
            self.sponsored = [[self objectOrNilForKey:kExtraFieldSponsored fromDictionary:dict] boolValue];
            self.indeedApply = [[self objectOrNilForKey:kExtraFieldIndeedApply fromDictionary:dict] boolValue];
            self.expired = [[self objectOrNilForKey:kExtraFieldExpired fromDictionary:dict] boolValue];
            self.formattedLocation = [self objectOrNilForKey:kExtraFieldFormattedLocation fromDictionary:dict];
            self.jobkey = [self objectOrNilForKey:kExtraFieldJobkey fromDictionary:dict];
            self.longitude = [[self objectOrNilForKey:kExtraFieldLongitude fromDictionary:dict] doubleValue];
            self.latitude = [[self objectOrNilForKey:kExtraFieldLatitude fromDictionary:dict] doubleValue];
            self.formattedLocationFull = [self objectOrNilForKey:kExtraFieldFormattedLocationFull fromDictionary:dict];
            self.formattedRelativeTime = [self objectOrNilForKey:kExtraFieldFormattedRelativeTime fromDictionary:dict];
            self.country = [self objectOrNilForKey:kExtraFieldCountry fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.onmousedown forKey:kExtraFieldOnmousedown];
    [mutableDict setValue:self.state forKey:kExtraFieldState];
    [mutableDict setValue:[NSNumber numberWithBool:self.sponsored] forKey:kExtraFieldSponsored];
    [mutableDict setValue:[NSNumber numberWithBool:self.indeedApply] forKey:kExtraFieldIndeedApply];
    [mutableDict setValue:[NSNumber numberWithBool:self.expired] forKey:kExtraFieldExpired];
    [mutableDict setValue:self.formattedLocation forKey:kExtraFieldFormattedLocation];
    [mutableDict setValue:self.jobkey forKey:kExtraFieldJobkey];
    [mutableDict setValue:[NSNumber numberWithDouble:self.longitude] forKey:kExtraFieldLongitude];
    [mutableDict setValue:[NSNumber numberWithDouble:self.latitude] forKey:kExtraFieldLatitude];
    [mutableDict setValue:self.formattedLocationFull forKey:kExtraFieldFormattedLocationFull];
    [mutableDict setValue:self.formattedRelativeTime forKey:kExtraFieldFormattedRelativeTime];
    [mutableDict setValue:self.country forKey:kExtraFieldCountry];

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

    self.onmousedown = [aDecoder decodeObjectForKey:kExtraFieldOnmousedown];
    self.state = [aDecoder decodeObjectForKey:kExtraFieldState];
    self.sponsored = [aDecoder decodeBoolForKey:kExtraFieldSponsored];
    self.indeedApply = [aDecoder decodeBoolForKey:kExtraFieldIndeedApply];
    self.expired = [aDecoder decodeBoolForKey:kExtraFieldExpired];
    self.formattedLocation = [aDecoder decodeObjectForKey:kExtraFieldFormattedLocation];
    self.jobkey = [aDecoder decodeObjectForKey:kExtraFieldJobkey];
    self.longitude = [aDecoder decodeDoubleForKey:kExtraFieldLongitude];
    self.latitude = [aDecoder decodeDoubleForKey:kExtraFieldLatitude];
    self.formattedLocationFull = [aDecoder decodeObjectForKey:kExtraFieldFormattedLocationFull];
    self.formattedRelativeTime = [aDecoder decodeObjectForKey:kExtraFieldFormattedRelativeTime];
    self.country = [aDecoder decodeObjectForKey:kExtraFieldCountry];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_onmousedown forKey:kExtraFieldOnmousedown];
    [aCoder encodeObject:_state forKey:kExtraFieldState];
    [aCoder encodeBool:_sponsored forKey:kExtraFieldSponsored];
    [aCoder encodeBool:_indeedApply forKey:kExtraFieldIndeedApply];
    [aCoder encodeBool:_expired forKey:kExtraFieldExpired];
    [aCoder encodeObject:_formattedLocation forKey:kExtraFieldFormattedLocation];
    [aCoder encodeObject:_jobkey forKey:kExtraFieldJobkey];
    [aCoder encodeDouble:_longitude forKey:kExtraFieldLongitude];
    [aCoder encodeDouble:_latitude forKey:kExtraFieldLatitude];
    [aCoder encodeObject:_formattedLocationFull forKey:kExtraFieldFormattedLocationFull];
    [aCoder encodeObject:_formattedRelativeTime forKey:kExtraFieldFormattedRelativeTime];
    [aCoder encodeObject:_country forKey:kExtraFieldCountry];
}

- (id)copyWithZone:(NSZone *)zone
{
    ExtraField *copy = [[ExtraField alloc] init];
    
    if (copy) {

        copy.onmousedown = [self.onmousedown copyWithZone:zone];
        copy.state = [self.state copyWithZone:zone];
        copy.sponsored = self.sponsored;
        copy.indeedApply = self.indeedApply;
        copy.expired = self.expired;
        copy.formattedLocation = [self.formattedLocation copyWithZone:zone];
        copy.jobkey = [self.jobkey copyWithZone:zone];
        copy.longitude = self.longitude;
        copy.latitude = self.latitude;
        copy.formattedLocationFull = [self.formattedLocationFull copyWithZone:zone];
        copy.formattedRelativeTime = [self.formattedRelativeTime copyWithZone:zone];
        copy.country = [self.country copyWithZone:zone];
    }
    
    return copy;
}


@end
