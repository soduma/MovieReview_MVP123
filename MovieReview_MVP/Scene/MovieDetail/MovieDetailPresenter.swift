//
//  MovieDetailPresenter.swift
//  MovieReview_MVP
//
//  Created by 장기화 on 2022/01/25.
//

import Foundation

protocol MovieDetailProtocol: AnyObject {
    func setUpLayout(with movie: Movie)
    func setRightBarButton(with isLiked: Bool)
}

class MovieDetailPresenter {
    private weak var viewController: MovieDetailProtocol?
    private let userDefaultsManager: UserDefaultsManagerProtocol
    private var movie: Movie
    
    init(viewController: MovieDetailProtocol, userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager(), movie: Movie) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
        self.movie = movie
    }
    
    func viewDidLoad() {
        viewController?.setUpLayout(with: movie)
        viewController?.setRightBarButton(with: movie.isLiked)
    }
    
    func tapRightButtonItem() {
        movie.isLiked.toggle()
        
        if movie.isLiked {
            userDefaultsManager.addMovie(movie)
        } else {
            userDefaultsManager.removeMovie(movie)
        }
        viewController?.setRightBarButton(with: movie.isLiked)
    }
}
