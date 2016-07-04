//
//  MHLOCParserSpec.m
//  MHImportBuster
//
//  Created by marko.hlebar on 27/12/13.
//  Copyright 2013 Marko Hlebar. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "MHStatementParser.h"
#import "MHImportStatement.h"

SPEC_BEGIN(MHStatementParserSpec)

describe(@"Fake file", ^{
    __block MHStatementParser *parser = nil;
    __block NSString *fakeFilePath = @"fakeFilePath";
    __block NSNumber *isSuccessInvoked = @NO;
    __block NSNumber *isErrorInvoked = @NO;
    __block NSError *outError = nil;
    
    MHArrayBlock successBlock = ^(NSArray *array){
        isSuccessInvoked = @YES;
    };
    MHErrorBlock errorBlock = ^(NSError *error){
        outError = error;
        isErrorInvoked = @YES;
    };
    
    beforeEach(^{
        parser = [MHStatementParser parseFileAtPath:fakeFilePath
                                            success:successBlock
                                              error:errorBlock];
    });
    
    it(@"Should invoke an errorBlock if filePath is bad and the error should be correct", ^{
        [[expectFutureValue(outError) shouldEventually] beNonNil];
        [[expectFutureValue([NSNumber numberWithInteger: outError.code]) shouldEventually]
         equal:[NSNumber numberWithInteger:MHImportBusterFileDoesntExistAtPath]];
    });
});

describe(@"Parsing interface file", ^{
    __block MHStatementParser *parser = nil;
    __block NSString *filePath = [[NSBundle bundleForClass:self.class] pathForResource:@"MyClass" ofType:@"h"];
    
    __block NSNumber *isSuccessInvoked = @NO;
    __block NSNumber *isErrorInvoked = @NO;
    __block NSArray *outArray = nil;
    
    MHArrayBlock successBlock = ^(NSArray *array){
        outArray = array;
        isSuccessInvoked = @YES;
    };
    MHErrorBlock errorBlock = ^(NSError *error){
        isErrorInvoked = @YES;
    };
    
    beforeEach(^{
        parser = [MHStatementParser parseFileAtPath:filePath
                                            success:successBlock
                                              error:errorBlock];
    });
    
    it(@"Should return array with 3 root statements", ^{
        [[expectFutureValue(outArray) shouldEventually] haveCountOf:3];
    });
});

describe(@"Parsing implementation file", ^{
    __block MHStatementParser *parser = nil;
    __block NSString *filePath = [[NSBundle bundleForClass:self.class] pathForResource:@"MyClass" ofType:@"m"];
    
    __block NSNumber *isSuccessInvoked = @NO;
    __block NSNumber *isErrorInvoked = @NO;
    __block NSArray *outArray = nil;
    
    MHArrayBlock successBlock = ^(NSArray *array){
        outArray = array;
        isSuccessInvoked = @YES;
    };
    MHErrorBlock errorBlock = ^(NSError *error){
        isErrorInvoked = @YES;
    };
    beforeEach(^{
        parser = [MHStatementParser parseFileAtPath:filePath
                                            success:successBlock
                                              error:errorBlock];
    });
    
    it(@"Should be able to initialize with a file path", ^{
        [[parser should] beNonNil];
    });
    
    it(@"Should eventually invoke a successBlock with array", ^{
        [[isSuccessInvoked shouldEventually] equal:@YES];
        [[expectFutureValue(outArray) shouldEventually] beKindOfClass:[NSArray class]];
    });
    
    it(@"Should not invoke error if there is no error", ^{
        [[isSuccessInvoked shouldEventually] equal:@YES];
        [[isErrorInvoked shouldEventually] equal:@NO];
    });
    
    it(@"Should return array with 1 root statement", ^{
        [[expectFutureValue(outArray) shouldEventually] haveCountOfAtLeast:1];
    });
});

describe(@"Bug_1", ^{
    __block NSArray *statements = nil;
    __block MHStatementParser *parser = nil;
    
    beforeEach(^{
        parser = [MHStatementParser new];
    });
    
    it(@"Should find a header if a static string is above the header statement", ^{
        NSString *filePath = [[NSBundle bundleForClass:self.class] pathForResource:@"Bug_1" ofType:@"m"];
        NSString *text = [NSString stringWithContentsOfFile:filePath
                                                   encoding:NSUTF8StringEncoding
                                                      error:nil];
        statements = [parser parseText:text
                                 error:nil
                      statementClasses:@[[MHProjectImportStatement class], [MHFrameworkImportStatement class]]];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF isKindOfClass: %@", [MHImportStatement class]];
        [[[statements filteredArrayUsingPredicate:predicate] should] haveCountOf:1];
    });
});

describe(@"Bug_2", ^{
    __block NSArray *statements = nil;
    __block MHStatementParser *parser = nil;
    
    beforeEach(^{
        parser = [MHStatementParser new];
    });
    
    it(@"Should find a header if a static string is above the header statement", ^{
        NSString *filePath = [[NSBundle bundleForClass:self.class] pathForResource:@"Bug_2" ofType:@"m"];
        NSString *text = [NSString stringWithContentsOfFile:filePath
                                                   encoding:NSUTF8StringEncoding
                                                      error:nil];
        statements = [parser parseText:text
                                 error:nil
                      statementClasses:@[[MHProjectImportStatement class], [MHFrameworkImportStatement class]]];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF isKindOfClass: %@", [MHImportStatement class]];
        [[[statements filteredArrayUsingPredicate:predicate] should] haveCountOf:1];
    });
});

describe(@"Bug_3", ^{
    __block NSArray *statements = nil;
    __block MHStatementParser *parser = nil;
    
    beforeEach(^{
        parser = [MHStatementParser new];
    });
    
    it(@"Should find a header if a static string is above the header statement", ^{
        NSString *filePath = [[NSBundle bundleForClass:self.class] pathForResource:@"Bug_3" ofType:@"m"];
        NSString *text = [NSString stringWithContentsOfFile:filePath
                                                   encoding:NSUTF8StringEncoding
                                                      error:nil];
        statements = [parser parseText:text
                                 error:nil
                      statementClasses:@[[MHProjectImportStatement class], [MHFrameworkImportStatement class]]];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF isKindOfClass: %@", [MHImportStatement class]];
        [[[statements filteredArrayUsingPredicate:predicate] should] haveCountOf:1];
    });
});

SPEC_END
