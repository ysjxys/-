//
//  MHConcreteSourceOperation.m
//  MHImportBuster
//
//  Created by Marko Hlebar on 09/02/2014.
//  Copyright (c) 2014 Marko Hlebar. All rights reserved.
//

#import "MHConcreteSourceOperation.h"

@implementation MHConcreteSourceOperation

+ (instancetype)operationWithSource:(NSTextStorage *)source{
    return [(MHConcreteSourceOperation*)[self alloc] initWithSource:source];
}

- (instancetype)initWithSource:(NSTextStorage *)source
{
    self = [super init];
    if (self) {
        _source = source;
    }
    return self;
}

@end
