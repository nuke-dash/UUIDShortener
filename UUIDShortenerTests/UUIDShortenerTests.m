//
//  UUIDShortenerTests.m
//  UUIDShortenerTests
//
//  Created by kishikawa katsumi on 2013/10/31.
//  Copyright (c) 2013 kishikawa katsumi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UUIDShortener.h"

@interface UUIDShortenerTests : XCTestCase

@end

@implementation UUIDShortenerTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testShortenUUID
{
    NSUUID *UUID = [NSUUID UUID];
    NSString *UUIDString = UUID.UUIDString;
    
    NSString *shortUUIDString = [UUIDShortener shortenUUIDString:UUIDString];
    XCTAssertEqual(shortUUIDString.length, (NSUInteger)26);
    
    NSString *restoredString = [UUIDShortener UUIDStringFromShortUUIDString:shortUUIDString];
    XCTAssertEqualObjects(restoredString, UUIDString);
}

- (void)testShortenUUIDString
{
    NSString *UUIDString = @"D21ACF57-A8BB-488D-B5DD-DEAC94C9A6D1";
    NSString *shortUUIDString = [UUIDShortener shortenUUIDString:UUIDString];
    XCTAssertEqualObjects(shortUUIDString, @"2INM6V5IXNEI3NO532WJJSNG2E");
    
    NSString *restoredString = [UUIDShortener UUIDStringFromShortUUIDString:shortUUIDString];
    XCTAssertEqualObjects(restoredString, UUIDString);
}

- (void)testShortenUUIDStringWithoutDashes
{
    NSString *UUIDString = @"D21ACF57A8BB488DB5DDDEAC94C9A6D1";
    NSString *shortUUIDString = [UUIDShortener shortenUUIDString:UUIDString];
    XCTAssertEqualObjects(shortUUIDString, @"2INM6V5IXNEI3NO532WJJSNG2E");
    
    NSString *restoredString = [UUIDShortener UUIDStringFromShortUUIDString:shortUUIDString];
    XCTAssertEqualObjects(restoredString, @"D21ACF57-A8BB-488D-B5DD-DEAC94C9A6D1");
}

- (void)testNSUUIDCategoryMethods
{
    NSUUID *UUID = [NSUUID UUID];
    NSString *UUIDString = UUID.UUIDString;
    
    NSString *shortUUIDString = UUID.shortUUIDString;
    XCTAssertEqual(shortUUIDString.length, (NSUInteger)26);
    
    NSString *restoredString = [NSUUID UUIDStringFromShortUUIDString:shortUUIDString];
    XCTAssertEqualObjects(restoredString, UUIDString);
}

- (void)testInvalidUUIDString
{
    NSString *shortUUIDString = [UUIDShortener shortenUUIDString:@"1234567890"];
    XCTAssertNil(shortUUIDString);
}

@end
