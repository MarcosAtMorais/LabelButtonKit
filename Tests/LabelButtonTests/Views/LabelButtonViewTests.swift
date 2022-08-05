//
//  LabelButtonViewTests.swift
//  
//
//  Created by Marcos Morais on 05/08/22.
//

import XCTest
import ViewInspector
import SwiftUI
@testable import LabelButton

class LabelButtonViewTests: XCTestCase {

    // MARK: Properties
    
    var sut: LabelButtonView!
    var label: LabelButton!
    
    // MARK: Setup
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.label = LabelButton.default
        self.sut = LabelButtonView(label: self.label)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.sut = nil
        self.label = nil
    }

    // MARK: Initializers Tests
    
    func test_init_whenDefaultAccessibilityTrait_shouldHaveVStack() throws {
                
        let hasVStack = try sut
            .inspect()
            .find(LabelButtonVStackContentView.self)
            .isAbsent
        
        XCTAssertFalse(hasVStack)
        
    }
    
    func test_init_whenInitializing_shouldHaveIconImage() throws {
                
        let vStack = try sut
            .inspect()
            .find(ViewType.VStack.self)
        
        let hasImage = try vStack
            .find(ViewType.Image.self)
            .isAbsent
        
        XCTAssertFalse(hasImage)
        
    }
    
    func test_init_whenInitializing_shouldHaveText() throws {
                
        let vStack = try sut
            .inspect()
            .find(ViewType.VStack.self)
        
        let hasText = try vStack
            .find(ViewType.Text.self)
            .isAbsent
        
        XCTAssertFalse(hasText)
        
    }
    
    func test_init_whenInitializing_shouldHaveExpectedText() throws {
        
        let expected = String(localized: "Directions")
        
        let vStack = try sut
            .inspect()
            .find(ViewType.VStack.self)
        
        let label = try vStack.find(ViewType.Text.self, where: { view in
            let label = try view
                .string()
            return label == expected
        })
        
        XCTAssertFalse(label.isAbsent)
        
    }
    
    // MARK: Action Tests

    func test_action_whenTapping_shouldSucceed() throws {
        
        var expected = 1
        
        let labelButton = LabelButton(action: {
            expected += 1
        })
        
        let labelButtonView = LabelButtonView(label: labelButton)
                
        try labelButtonView
            .inspect()
            .find(ViewType.Button.self)
            .tap()
        
        XCTAssertEqual(expected, 2)
        
    }
    
    func test_action_whenTapping_shouldFail() throws {
        
        var expected = 1
        
        let labelButton = LabelButton(action: {
            expected += 1
        })
        
        let labelButtonView = LabelButtonView(label: labelButton)
                
        try labelButtonView
            .inspect()
            .find(ViewType.Button.self)
            .tap()
        
        try labelButtonView
            .inspect()
            .find(ViewType.Button.self)
            .tap()
        
        XCTAssertNotEqual(expected, 2)
        
    }
    
}

extension LabelButtonView: Inspectable { }

extension LabelButtonHStackContentView: Inspectable { }

extension LabelButtonVStackContentView: Inspectable { }


extension LabelButtonView {
    func tapButtonWith(name: String) throws {
        try inspect()
            .find(ViewType.Button.self, where: { view in
                let label = try view
                    .labelView()
                    .text()
                    .string()
                return label == name
            })
            .tap()
    }
}
