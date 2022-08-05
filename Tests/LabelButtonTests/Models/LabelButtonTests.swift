//
//  LabelButtonTests.swift
//
//
//  Created by Marcos Morais on 05/08/22.
//

import XCTest
@testable import LabelButton

final class LabelButtonTests: XCTestCase {
    func test_init_whenDefaultInitializer_shouldSucceed() {
        
        let sut = LabelButton()
        let expected = String(localized: "Directions")
        
        XCTAssertEqual(sut.text, expected)
        
    }
    
    func test_init_whenDefaultInitializer_shouldFail() {
        
        let sut = LabelButton()
        let expected = String(localized: "Direction")
        
        XCTAssertNotEqual(sut.text, expected)
        
    }
}
