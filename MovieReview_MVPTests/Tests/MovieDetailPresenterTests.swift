//
//  MovieDetailPresenterTests.swift
//  MovieReview_MVPTests
//
//  Created by 장기화 on 2022/01/26.
//

import XCTest
@testable import MovieReview_MVP

class MovieDetailPresenterTests: XCTestCase {
    var sut: MovieDetailPresenter!
    
    var viewController: MockMovieDetailViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    var movie: Movie!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockMovieDetailViewController()
        userDefaultsManager = MockUserDefaultsManager()
        movie = Movie(title: "", imageURL: "", pubDate: "", director: "", actor: "", userRating: "")
        sut = MovieDetailPresenter(viewController: viewController, userDefaultsManager: userDefaultsManager, movie: movie)
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
        
        viewController = nil
        userDefaultsManager = nil
        movie = nil
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetUpLayout)
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
    }
    
    // isLiked == true
    func test_tapRightButtonItem이호출될때isLiked가true가되면() {
        movie.isLiked = false
        
        sut = MovieDetailPresenter(viewController: viewController, userDefaultsManager: userDefaultsManager, movie: movie)
        
        sut.tapRightButtonItem()
        
        XCTAssertTrue(userDefaultsManager.isCalledAddMovie)
        XCTAssertFalse(userDefaultsManager.isCalledRemoveMovie)
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
    }
    
    // isLiked == false
    func test_tapRightButtonItem이호출될때isLiked가false가되면() {
        movie.isLiked = true
        
        sut = MovieDetailPresenter(viewController: viewController, userDefaultsManager: userDefaultsManager, movie: movie)
        
        sut.tapRightButtonItem()
        
        XCTAssertFalse(userDefaultsManager.isCalledAddMovie)
        XCTAssertTrue(userDefaultsManager.isCalledRemoveMovie)
        XCTAssertTrue(viewController.isCalledSetRightBarButton)
    }
}
