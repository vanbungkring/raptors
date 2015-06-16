//
//  ExtraField.h
//
//  Created by Ratna Kumalasari on 6/15/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ExtraField : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *onmousedown;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, assign) BOOL sponsored;
@property (nonatomic, assign) BOOL indeedApply;
@property (nonatomic, assign) BOOL expired;
@property (nonatomic, strong) NSString *formattedLocation;
@property (nonatomic, strong) NSString *jobkey;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double latitude;
@property (nonatomic, strong) NSString *formattedLocationFull;
@property (nonatomic, strong) NSString *formattedRelativeTime;
@property (nonatomic, strong) NSString *country;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
