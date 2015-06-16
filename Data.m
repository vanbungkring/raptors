//
//  Data.m
//
//  Created by Ratna Kumalasari on 6/15/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "Hits.h"


NSString *const kDataTotal = @"total";
NSString *const kDataMaxScore = @"max_score";
NSString *const kDataHits = @"hits";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize total = _total;
@synthesize maxScore = _maxScore;
@synthesize hits = _hits;


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
            self.total = [[self objectOrNilForKey:kDataTotal fromDictionary:dict] doubleValue];
            self.maxScore = [self objectOrNilForKey:kDataMaxScore fromDictionary:dict];
    NSObject *receivedHits = [dict objectForKey:kDataHits];
    NSMutableArray *parsedHits = [NSMutableArray array];
    if ([receivedHits isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHits) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHits addObject:[Hits modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHits isKindOfClass:[NSDictionary class]]) {
       [parsedHits addObject:[Hits modelObjectWithDictionary:(NSDictionary *)receivedHits]];
    }

    self.hits = [NSArray arrayWithArray:parsedHits];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kDataTotal];
    [mutableDict setValue:self.maxScore forKey:kDataMaxScore];
    NSMutableArray *tempArrayForHits = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hits) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHits addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHits addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHits] forKey:kDataHits];

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

    self.total = [aDecoder decodeDoubleForKey:kDataTotal];
    self.maxScore = [aDecoder decodeObjectForKey:kDataMaxScore];
    self.hits = [aDecoder decodeObjectForKey:kDataHits];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kDataTotal];
    [aCoder encodeObject:_maxScore forKey:kDataMaxScore];
    [aCoder encodeObject:_hits forKey:kDataHits];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.maxScore = [self.maxScore copyWithZone:zone];
        copy.hits = [self.hits copyWithZone:zone];
    }
    
    return copy;
}


@end
