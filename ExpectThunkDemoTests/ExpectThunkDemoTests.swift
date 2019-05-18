//
//  ExpectThunkDemoTests.swift
//  ExpectThunkDemoTests
//
//  Created by Jason Prasad on 2/19/19.
//  Copyright © 2019 jjgp. All rights reserved.
//

import XCTest
import ReSwift
import ReSwiftThunk
@testable import ExpectThunkDemo

class ExpectThunkDemoTests: XCTestCase {
    
    func testExpectThunk() {
        ExpectThunk(thunk)
            .getsState(FakeState())
            .dispatches(FakeAction())
            .getsState(FakeState())
            .dispatches {
                XCTAssert($0 as? FakeAction == FakeAction())
            }
            .dispatches(AnotherFakeAction())
            .wait()
    }
    
    func testExpectThunkNeverHappened() {
        ExpectThunk(thunk)
            .getsState(FakeState())
            .dispatches(FakeAction())
            .getsState(FakeState())
            .dispatches {
                XCTAssert($0 as? FakeAction == FakeAction())
            }
            .dispatches(AnotherFakeAction())
            // This never happened
            .dispatches(AnotherFakeAction())
            .wait()
    }
    
}
