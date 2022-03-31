//
//  SwiftMockyTestsTests.swift
//  SwiftMockyTestsTests
//
//  Created by Björn Roßborsky-Stoß on 31.03.22.
//

import XCTest
import SwiftyMocky
@testable import SwiftMockyTests

class SwiftMockyTestsTests: XCTestCase {

    func testNetwork() async {
        
        let mock = NetworkProtocolMock()
        
        Verify(mock, 0, .asyncLoad())
        
        do {
            try await mock.asyncLoad()
        } catch {
            XCTFail("")
        }
        
        Verify(mock, 1, .asyncLoad())

    }
}
