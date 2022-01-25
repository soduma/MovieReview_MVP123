//
//  MovieDetailViewController.swift
//  MovieReview_MVP
//
//  Created by 장기화 on 2022/01/25.
//

import UIKit
import SnapKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    private var presenter: MovieDetailPresenter!
    private lazy var rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(tapRightButtonItem))
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()
    
    init(movie: Movie) {
        super.init(nibName: nil, bundle: nil)
        
        presenter = MovieDetailPresenter(viewController: self, movie: movie)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension MovieDetailViewController: MovieDetailProtocol {
    func setUpLayout(with movie: Movie) {
        view.backgroundColor = .systemBackground
        navigationItem.title = movie.title
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        let ratingStackView = MovieDetailStackView(title: "평점", content: movie.userRating)
        let actorStackView = MovieDetailStackView(title: "배우", content: movie.actor)
        let directorStackView = MovieDetailStackView(title: "감독", content: movie.director)
        let pubDateStackView = MovieDetailStackView(title: "제작년도", content: movie.pubDate)
        
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 8
        
        [ratingStackView, actorStackView, directorStackView, pubDateStackView]
            .forEach { contentStackView.addArrangedSubview($0) }
        
        [imageView, contentStackView]
            .forEach { view.addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(imageView.snp.width)
        }
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        if let imageURL = movie.imageURL {
            imageView.kf.setImage(with: imageURL)
        }
    }
    
    func setRightBarButton(with isLiked: Bool) {
        let imageName = isLiked ? "star.fill" : "star"
        rightBarButtonItem.image = UIImage(systemName: imageName)
    }
}

private extension MovieDetailViewController {
    @objc func tapRightButtonItem() {
        presenter.tapRightButtonItem()
    }
}
