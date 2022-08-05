//
//  LabelButtonListViewTests.swift
//  
//
//  Created by Marcos Morais on 05/08/22.
//

import XCTest
import ViewInspector
@testable import LabelButtonKit

class LabelButtonListViewTests: XCTestCase {
    
    // MARK: Properties

    var sut: LabelButtonListView!
    var labelButton: LabelButton!
    
    // MARK: Setup
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.labelButton = LabelButton.default
        self.sut = LabelButtonListView(data: [labelButton])
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.sut = nil
    }
    
    // MARK: Initializers Tests

    func test_init_shouldHaveAtLeastOneButton() {
        
        let count = sut.data.count
        let expected = 1
        
        XCTAssertEqual(count, expected)
        
    }
    
    func test_init_whenInitializing_shouldHaveHStack() throws {
                
        let hasHStack = try sut
            .inspect()
            .find(LabelButtonListView.self)
            .hStack()
            .isAbsent

        XCTAssertFalse(hasHStack)
        
    }
    
    func test_init_whenInitializing_shouldHaveALabelButton() throws {
                
        let hasLabelButton = try sut
            .inspect()
            .find(LabelButtonListView.self)
            .hStack()
            .find(LabelButtonView.self)
            .isAbsent

        XCTAssertFalse(hasLabelButton)
        
    }
    
    // MARK: Adding Labels Tests
    
    func test_whenAddingMoreLabelButtons_shouldSucceed() throws {
        
        let additionalLabelButton = LabelButton.default
        let expected = 2
        
        sut.data.append(additionalLabelButton)
        
        XCTAssertEqual(sut.data.count, expected)
        
    }

}

extension LabelButtonListView: Inspectable { }
