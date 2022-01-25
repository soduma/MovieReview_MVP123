//
//  MovieDetailStackView.swift
//  MovieReview_MVP
//
//  Created by 장기화 on 2022/01/25.
//

import UIKit
import SnapKit

class MovieDetailStackView: UIStackView {
    private let title: String
    private let content: String
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = title
        return label
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = content
        return label
    }()
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
        
        super.init(frame: .zero)
        
        axis = .horizontal
        
        [titleLabel, contentLabel]
            .forEach { addArrangedSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(80)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
