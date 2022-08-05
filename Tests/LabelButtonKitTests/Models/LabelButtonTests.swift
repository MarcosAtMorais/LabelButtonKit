//
//  LabelButtonTests.swift
//
//
//  Created by Marcos Morais on 05/08/22.
//

import XCTest
import SwiftUI
@testable import LabelButtonKit

final class LabelButtonTests: XCTestCase {
    
    // MARK: Initializers Tests
    
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
    
    // MARK: Icon Tests
    
    func test_icon_whenHavingAnIconTextCreatingAnImage_shouldSucceed() {
        
        let sut = LabelButton()
        let image = Image(systemName: sut.icon)
        
        XCTAssertNotNil(image)
        
    }
}
