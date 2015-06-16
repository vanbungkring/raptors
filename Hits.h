//
//  Hits.h
//
//  Created by Ratna Kumalasari on 6/15/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ExtraField;

@interface Hits : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *hitsDescription;
@property (nonatomic, strong) NSString *jobLink;
@property (nonatomic, strong) NSString *jobFunction;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *companyLogo;
@property (nonatomic, strong) NSString *jobIndustry;
@property (nonatomic, strong) NSString *hitsIdentifier;
@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *jobLocation;
@property (nonatomic, strong) ExtraField *extraField;
@property (nonatomic, strong) NSString *companyLink;
@property (nonatomic, strong) NSString *postDate;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *jobSource;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
