//
//  MovieListPresenterTests.swift
//  MovieReview_MVPTests
//
//  Created by 장기화 on 2022/01/20.
//

import XCTest
@testable import MovieReview_MVP

class MovieListPresenterTests: XCTestCase {
    var sut: MovieListPresenter!
    var viewController: MockMovieListViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    var movieManager: MockMovieManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockMovieListViewController()
        userDefaultsManager = MockUserDefaultsManager()
        movieManager = MockMovieManager()
        
        sut = MovieListPresenter(viewController: viewController, movieManager: movieManager, userDefaultsManager: userDefaultsManager)
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
        
        viewController = nil
        userDefaultsManager = nil
        movieManager = nil
    }

//MARK: - BDD
    // fetchMovie메소드가 성공하면 updateTableView가 실행되고
    func test_searchBar_textDidChange가호출될때fetchMovie가성공하면() {
        movieManager.needToSuccessFetch = true
        sut.searchBar(UISearchBar(), textDidChange: "")
        
        XCTAssertTrue(viewController.isCalledUpdateTableView, "updateTableView가 실행된다.")
    }
    
    // fetchMovie메소드가 실패하면 updateTableView가 실행되지 않음
    func test_searchBar_textDidChange가호출될때fetchMovie가실패하면() {
        movieManager.needToSuccessFetch = false
        sut.searchBar(UISearchBar(), textDidChange: "")
        
        XCTAssertFalse(viewController.isCalledUpdateTableView, "updateTableView가 실행되지 않는다.")
    }
    
    func test_viewDidLoad가호출되면() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetUpNavigation)
        XCTAssertTrue(viewController.isCalledSetUpSearchBar)
        XCTAssertTrue(viewController.isCalledSetUpLayout)
    }
    
    func test_viewWillAppear가호출되면() {
        sut.viewWillAppear()
        
        XCTAssertTrue(userDefaultsManager.isCalledGetMovies)
        XCTAssertTrue(viewController.isCalledUpdateCollectionView)
    }
    
    func test_searchBarTextDidBeginEditing이호출되면() {
        sut.searchBarTextDidBeginEditing(UISearchBar())
        
        XCTAssertTrue(viewController.isCalledUpdateTableView)
    }
    
    func test_searchBarCancelButtonClicked가호출되면() {
        sut.searchBarCancelButtonClicked(UISearchBar())
        
        XCTAssertTrue(viewController.isCalledUpdateTableView)
    }
}
