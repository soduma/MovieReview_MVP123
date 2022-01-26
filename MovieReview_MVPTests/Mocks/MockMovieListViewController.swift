//
//  MockMovieListViewController.swift
//  MovieReview_MVPTests
//
//  Created by 장기화 on 2022/01/26.
//

import Foundation
@testable import MovieReview_MVP

final class MockMovieListViewController: MovieListProtocol {
    var isCalledSetUpNavigation = false
    var isCalledSetUpSearchBar = false
    var isCalledSetUpLayout = false
    var isCalledUpdateTableView = false
    var isCalledPushToMovieDetailViewController = false
    var isCalledUpdateCollectionView = false

    func setUpNavigation() {
        isCalledSetUpNavigation = true
    }
    
    func setUpSearchBar() {
        isCalledSetUpSearchBar = true
    }
    
    func setUpLayout() {
        isCalledSetUpLayout = true
    }
    
    func updateTableView(isHidden: Bool) {
        isCalledUpdateTableView = true
    }
    
    func pushToMovieDetailViewController(with movie: Movie) {
        isCalledPushToMovieDetailViewController = true
    }
    
    func updateCollectionView() {
        isCalledUpdateCollectionView = true
    }
}
