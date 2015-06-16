//
//  Data.h
//
//  Created by Ratna Kumalasari on 6/15/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double total;
@property (nonatomic, assign) id maxScore;
@property (nonatomic, strong) NSArray *hits;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
