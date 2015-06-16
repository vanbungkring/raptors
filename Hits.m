//
//  Hits.m
//
//  Created by Ratna Kumalasari on 6/15/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Hits.h"
#import "ExtraField.h"


NSString *const kHitsDescription = @"description";
NSString *const kHitsJobLink = @"job_link";
NSString *const kHitsJobFunction = @"job_function";
NSString *const kHitsUpdatedAt = @"updatedAt";
NSString *const kHitsCompanyLogo = @"company_logo";
NSString *const kHitsJobIndustry = @"job_industry";
NSString *const kHitsId = @"_id";
NSString *const kHitsCompanyName = @"company_name";
NSString *const kHitsJobLocation = @"job_location";
NSString *const kHitsExtraField = @"extra_field";
NSString *const kHitsCompanyLink = @"company_link";
NSString *const kHitsPostDate = @"post_date";
NSString *const kHitsCreatedAt = @"createdAt";
NSString *const kHitsName = @"name";
NSString *const kHitsJobSource = @"job_source";


@interface Hits ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Hits

@synthesize hitsDescription = _hitsDescription;
@synthesize jobLink = _jobLink;
@synthesize jobFunction = _jobFunction;
@synthesize updatedAt = _updatedAt;
@synthesize companyLogo = _companyLogo;
@synthesize jobIndustry = _jobIndustry;
@synthesize hitsIdentifier = _hitsIdentifier;
@synthesize companyName = _companyName;
@synthesize jobLocation = _jobLocation;
@synthesize extraField = _extraField;
@synthesize companyLink = _companyLink;
@synthesize postDate = _postDate;
@synthesize createdAt = _createdAt;
@synthesize name = _name;
@synthesize jobSource = _jobSource;


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
            self.hitsDescription = [self objectOrNilForKey:kHitsDescription fromDictionary:dict];
            self.jobLink = [self objectOrNilForKey:kHitsJobLink fromDictionary:dict];
            self.jobFunction = [self objectOrNilForKey:kHitsJobFunction fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kHitsUpdatedAt fromDictionary:dict];
            self.companyLogo = [self objectOrNilForKey:kHitsCompanyLogo fromDictionary:dict];
            self.jobIndustry = [self objectOrNilForKey:kHitsJobIndustry fromDictionary:dict];
            self.hitsIdentifier = [self objectOrNilForKey:kHitsId fromDictionary:dict];
            self.companyName = [self objectOrNilForKey:kHitsCompanyName fromDictionary:dict];
            self.jobLocation = [self objectOrNilForKey:kHitsJobLocation fromDictionary:dict];
            self.extraField = [ExtraField modelObjectWithDictionary:[dict objectForKey:kHitsExtraField]];
            self.companyLink = [self objectOrNilForKey:kHitsCompanyLink fromDictionary:dict];
            self.postDate = [self objectOrNilForKey:kHitsPostDate fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kHitsCreatedAt fromDictionary:dict];
            self.name = [self objectOrNilForKey:kHitsName fromDictionary:dict];
            self.jobSource = [self objectOrNilForKey:kHitsJobSource fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hitsDescription forKey:kHitsDescription];
    [mutableDict setValue:self.jobLink forKey:kHitsJobLink];
    [mutableDict setValue:self.jobFunction forKey:kHitsJobFunction];
    [mutableDict setValue:self.updatedAt forKey:kHitsUpdatedAt];
    [mutableDict setValue:self.companyLogo forKey:kHitsCompanyLogo];
    [mutableDict setValue:self.jobIndustry forKey:kHitsJobIndustry];
    [mutableDict setValue:self.hitsIdentifier forKey:kHitsId];
    [mutableDict setValue:self.companyName forKey:kHitsCompanyName];
    [mutableDict setValue:self.jobLocation forKey:kHitsJobLocation];
    [mutableDict setValue:[self.extraField dictionaryRepresentation] forKey:kHitsExtraField];
    [mutableDict setValue:self.companyLink forKey:kHitsCompanyLink];
    [mutableDict setValue:self.postDate forKey:kHitsPostDate];
    [mutableDict setValue:self.createdAt forKey:kHitsCreatedAt];
    [mutableDict setValue:self.name forKey:kHitsName];
    [mutableDict setValue:self.jobSource forKey:kHitsJobSource];

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

    self.hitsDescription = [aDecoder decodeObjectForKey:kHitsDescription];
    self.jobLink = [aDecoder decodeObjectForKey:kHitsJobLink];
    self.jobFunction = [aDecoder decodeObjectForKey:kHitsJobFunction];
    self.updatedAt = [aDecoder decodeObjectForKey:kHitsUpdatedAt];
    self.companyLogo = [aDecoder decodeObjectForKey:kHitsCompanyLogo];
    self.jobIndustry = [aDecoder decodeObjectForKey:kHitsJobIndustry];
    self.hitsIdentifier = [aDecoder decodeObjectForKey:kHitsId];
    self.companyName = [aDecoder decodeObjectForKey:kHitsCompanyName];
    self.jobLocation = [aDecoder decodeObjectForKey:kHitsJobLocation];
    self.extraField = [aDecoder decodeObjectForKey:kHitsExtraField];
    self.companyLink = [aDecoder decodeObjectForKey:kHitsCompanyLink];
    self.postDate = [aDecoder decodeObjectForKey:kHitsPostDate];
    self.createdAt = [aDecoder decodeObjectForKey:kHitsCreatedAt];
    self.name = [aDecoder decodeObjectForKey:kHitsName];
    self.jobSource = [aDecoder decodeObjectForKey:kHitsJobSource];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hitsDescription forKey:kHitsDescription];
    [aCoder encodeObject:_jobLink forKey:kHitsJobLink];
    [aCoder encodeObject:_jobFunction forKey:kHitsJobFunction];
    [aCoder encodeObject:_updatedAt forKey:kHitsUpdatedAt];
    [aCoder encodeObject:_companyLogo forKey:kHitsCompanyLogo];
    [aCoder encodeObject:_jobIndustry forKey:kHitsJobIndustry];
    [aCoder encodeObject:_hitsIdentifier forKey:kHitsId];
    [aCoder encodeObject:_companyName forKey:kHitsCompanyName];
    [aCoder encodeObject:_jobLocation forKey:kHitsJobLocation];
    [aCoder encodeObject:_extraField forKey:kHitsExtraField];
    [aCoder encodeObject:_companyLink forKey:kHitsCompanyLink];
    [aCoder encodeObject:_postDate forKey:kHitsPostDate];
    [aCoder encodeObject:_createdAt forKey:kHitsCreatedAt];
    [aCoder encodeObject:_name forKey:kHitsName];
    [aCoder encodeObject:_jobSource forKey:kHitsJobSource];
}

- (id)copyWithZone:(NSZone *)zone
{
    Hits *copy = [[Hits alloc] init];
    
    if (copy) {

        copy.hitsDescription = [self.hitsDescription copyWithZone:zone];
        copy.jobLink = [self.jobLink copyWithZone:zone];
        copy.jobFunction = [self.jobFunction copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.companyLogo = [self.companyLogo copyWithZone:zone];
        copy.jobIndustry = [self.jobIndustry copyWithZone:zone];
        copy.hitsIdentifier = [self.hitsIdentifier copyWithZone:zone];
        copy.companyName = [self.companyName copyWithZone:zone];
        copy.jobLocation = [self.jobLocation copyWithZone:zone];
        copy.extraField = [self.extraField copyWithZone:zone];
        copy.companyLink = [self.companyLink copyWithZone:zone];
        copy.postDate = [self.postDate copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.jobSource = [self.jobSource copyWithZone:zone];
    }
    
    return copy;
}


@end
