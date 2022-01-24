//
//  MovieListViewController.swift
//  MovieReview_MVP
//
//  Created by 장기화 on 2022/01/20.
//

import UIKit
import SnapKit

class MovieListViewController: UIViewController {
    private lazy var presenter = MovieListPresenter(viewController: self)
    private let searchController = UISearchController()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = presenter
        collectionView.dataSource = presenter
        collectionView.register(MovieListCollectionViewCell.self, forCellWithReuseIdentifier: MovieListCollectionViewCell.identifier)
        return collectionView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = presenter
        tableView.dataSource = presenter
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        MovieManager().fetchMovie(from: "겨울왕국") { movies in
            print(movies)
        }
    }
}

extension MovieListViewController: MovieListProtocol {
    func setUpNavigation() {
        navigationItem.title = "영화 평점"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func setUpSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = presenter
        navigationItem.searchController = searchController
    }
    
    func setUpLayout() {
        [collectionView, tableView]
            .forEach{ view.addSubview($0) }
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.isHidden = true
    }
    
    func updateTableView(isHidden: Bool) {
        tableView.isHidden = isHidden
        tableView.reloadData()
    }
}
