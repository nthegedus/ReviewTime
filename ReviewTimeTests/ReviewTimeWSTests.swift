//
//  ReviewTimeWSTests.swift
//  ReviewTime
//
//  Created by Nathan Hegedus on 31/08/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit
import XCTest
import OHHTTPStubs

class ReviewTimeWSTests: XCTestCase {

    func testShouldBeAbleToFetchDataAndConvertCorrectly() {
        let stub: OHHTTPStubsDescriptor = OHHTTPStubs.stubRequestsPassingTest({ (request) -> Bool in
            let containsReviewTimeURL = request.URL?.absoluteString?.hasSuffix("reviewTime.json")
            XCTAssertTrue(containsReviewTimeURL!, "doens't have URL")
            XCTAssertEqual("GET", request.HTTPMethod!, "Methods aren't equals")
            XCTAssertNil(request.HTTPBody, "body's nil")
            return containsReviewTimeURL!
        }, withStubResponse: { (request) -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(fileAtPath: OHPathForFile("reviewTime.json", self.classForCoder)!, statusCode: 200, headers: ["Content-Type": "application/json"])
        })
        
        let expectation: XCTestExpectation = self.expectationWithDescription("Expectation for ReviewTime request")
        let request = ReviewTimeWS.fetchReviewTimeData { (reviewTime, error) -> Void in
            XCTAssertNil(error, "error's not nil")
            XCTAssertNotNil(reviewTime, "doesn't have reviewTime")
        }
        
        expectation.fulfill()
        self.waitForExpectationsWithTimeout(request.task.originalRequest.timeoutInterval, handler: { (error) -> Void in
            OHHTTPStubs.removeStub(stub)
        })

    }

}
