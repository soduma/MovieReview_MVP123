//
//  MovieListPresenter.swift
//  MovieReview_MVP
//
//  Created by 장기화 on 2022/01/24.
//

import UIKit

protocol MovieListProtocol: AnyObject {
    func setUpNavigation()
    func setUpSearchBar()
    func setUpLayout()
    func updateTableView(isHidden: Bool)
}

class MovieListPresenter: NSObject {
    private weak var viewController: MovieListProtocol?
    private let movieManager: MovieManagerProtocol
    
    private var likedMovie: [Movie] = [
        Movie(title: "겨울왕국", imageURL: "", pubDate: "2021", director: "abc", actor: "abc", userRating: "5.0"),
        Movie(title: "겨울왕국", imageURL: "", pubDate: "2021", director: "abc", actor: "abc", userRating: "5.0"),
        Movie(title: "겨울왕국", imageURL: "", pubDate: "2021", director: "abc", actor: "abc", userRating: "5.0")
    ]
    
    private var currentMovieResult: [Movie] = []
    
    init(viewController: MovieListProtocol,
         movieManager: MovieManagerProtocol = MovieManager()) {
        self.viewController = viewController
        self.movieManager = movieManager
    }
    
    func viewDidLoad() {
        viewController?.setUpNavigation()
        viewController?.setUpSearchBar()
        viewController?.setUpLayout()
    }
}

extension MovieListPresenter: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewController?.updateTableView(isHidden: false)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentMovieResult = []
        viewController?.updateTableView(isHidden: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        movieManager.fetchMovie(from: searchText) { [weak self] movies in
            self?.currentMovieResult = movies
            self?.viewController?.updateTableView(isHidden: false)
        }
    }
}

extension MovieListPresenter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 16
        let width = collectionView.frame.width - spacing * 3
        return CGSize(width: width / 2, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}

extension MovieListPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likedMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MovieListCollectionViewCell.identifier, for: indexPath)
                as? MovieListCollectionViewCell else { return UICollectionViewCell() }
        
        let movie = likedMovie[indexPath.item]
        cell.update(movie)
        return cell
    }
}

extension MovieListPresenter: UITableViewDelegate {
    
}

extension MovieListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentMovieResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = currentMovieResult[indexPath.row].title
        return cell
    }
}
