//
//  MockMovieDetailViewController.swift
//  MovieReview_MVPTests
//
//  Created by 장기화 on 2022/01/26.
//

import Foundation
@testable import MovieReview_MVP

final class MockMovieDetailViewController: MovieDetailProtocol {
    var isCalledSetUpLayout = false
    var isCalledSetRightBarButton = false
    
    var settedIsLiked = false
    
    func setUpLayout(with movie: Movie) {
        isCalledSetUpLayout = true
    }
    
    func setRightBarButton(with isLiked: Bool) {
        settedIsLiked = isLiked
        isCalledSetRightBarButton = true
    }
}
