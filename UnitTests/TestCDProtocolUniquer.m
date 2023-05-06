//
//  TestCDProtocolUniquer.m
//  UnitTests
//
//  Created by Ryosuke Ito on 5/6/23.
//

#import <XCTest/XCTest.h>

#import "CDProtocolUniquer.h"
#import "CDOCProtocol.h"

@interface TestCDProtocolUniquer : XCTestCase
@end

@implementation TestCDProtocolUniquer

- (void)test_createUniquedProtocols_withNoProtocols {
    CDProtocolUniquer *uniquer = [[CDProtocolUniquer alloc] init];
    [uniquer createUniquedProtocols];
    XCTAssertEqual(uniquer.uniqueProtocolsSortedByName.count, 0);
}

- (void)test_createUniquedProtocols_withProtocol {
    CDProtocolUniquer *uniquer = [[CDProtocolUniquer alloc] init];
    CDOCProtocol *protocol = [[CDOCProtocol alloc] init];
    protocol.name = @"Foo";
    [uniquer setProtocol:protocol withAddress:0x8];
    [uniquer createUniquedProtocols];
    XCTAssertEqual(uniquer.uniqueProtocolsSortedByName.count, 1);
}

@end
