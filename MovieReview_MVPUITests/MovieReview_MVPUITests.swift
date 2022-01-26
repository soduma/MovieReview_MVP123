//
//  MovieReview_MVPUITests.swift
//  MovieReview_MVPUITests
//
//  Created by 장기화 on 2022/01/20.
//

import XCTest

class MovieReviewMVPUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false // 하나만 실패해도 계속 진행되니까 멈추도록 함
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        
        app = nil
    }
    
    func test_navigationBar의title이영화평점으로설정되어있다() {
        let existNavigationBar = app.navigationBars["영화 평점"]
            .exists
        XCTAssertTrue(existNavigationBar)
    }
    
    func test_searchBar가존재한다() {
        let existSearchBar = app.navigationBars["영화 평점"]
            .searchFields["Search"] // placeholder
            .exists
        
        XCTAssertTrue(existSearchBar)
    }
    
    func test_searchBar에cancel버튼이존재한다() {
        let navigationBar = app.navigationBars["영화 평점"]
        navigationBar
            .searchFields["Search"]
            .tap()
        
        let existSearchBarCancelButton = navigationBar
            .buttons["Cancel"]
            .exists
        
        XCTAssertTrue(existSearchBarCancelButton)
    }
}
