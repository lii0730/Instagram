//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by LeeHsss on 2022/02/26.
//

import Foundation
import UIKit
import SnapKit

final class FeedTableViewCell: UITableViewCell {
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "heart")
        
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "message")
        
        return button
    }()
    
    private lazy var directMessageButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "paperplane")
        
        return button
    }()
    
    private lazy var bookMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        
        return button
    }()
    
    private lazy var currentLikedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "홍길동님 외 32명이 좋아합니다."
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.numberOfLines = 5
        label.text = "홍길동님 외 32명이 좋아합니다. 홍길동님 외 32명이 좋아합니다. 홍길동님 외 32명이 좋아합니다. 홍길동님 외 32명이 좋아합니다. 홍길동님 외 32명이 좋아합니다. "
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.numberOfLines = 5
        label.text = "1일 전"
        
        return label
    }()
    
    func setup() {
        [postImageView, likeButton, commentButton, directMessageButton, bookMarkButton, currentLikedCountLabel, contentsLabel, dateLabel].forEach {
            addSubview($0)
        }
        
        postImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }
        postImageView.backgroundColor = .red
        
        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0
        
        likeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        commentButton.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        directMessageButton.snp.makeConstraints {
            $0.leading.equalTo(commentButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        bookMarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        currentLikedCountLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookMarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookMarkButton.snp.trailing)
            $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(8.0)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookMarkButton.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
}
