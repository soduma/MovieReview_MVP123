//
//  MovieListCollectionViewCell.swift
//  MovieReview_MVP
//
//  Created by 장기화 on 2022/01/24.
//

import UIKit
import SnapKit
import Kingfisher

class MovieListCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieListCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 8
        backgroundColor = .systemBackground
        
        [imageView, titleLabel, ratingLabel]
            .forEach { addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(imageView.snp.width)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(imageView)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(imageView)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
    
    func update(_ movie: Movie) {
        imageView.kf.setImage(with: movie.imageURL)
        titleLabel.text = movie.title
        ratingLabel.text = "⭐️\(movie.userRating)"
    }
}
