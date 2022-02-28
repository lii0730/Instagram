//
//  UploadViewController.swift
//  Instagram
//
//  Created by LeeHsss on 2022/02/27.
//

import UIKit
import SnapKit

final class UploadViewController: UIViewController {
    private let uploadImage: UIImage
    
    private let imageView = UIImageView()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        textView.text = "문구 입력..."
        textView.textColor = .secondaryLabel
        textView.delegate = self
        textView.font = .systemFont(ofSize: 15.0)
        return textView
    }()
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setNavigationBar()
        setUpLayout()
        
        imageView.image = uploadImage
    }
    
    
}

private extension UploadViewController {
    func setNavigationBar() {
        navigationItem.title = "새 게시글"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "취소",
            style: .plain,
            target: self,
            action: #selector(clickedLeftBarButton)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "공유",
            style: .plain,
            target: self,
            action: #selector(clickedRightBarButton)
        )
    }
    
    @objc func clickedLeftBarButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func clickedRightBarButton() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func setUpLayout() {
        [imageView, textView].forEach {
            view.addSubview($0)
        }
        
        let imageViewInset: CGFloat = 16.0
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(imageViewInset)
            $0.leading.equalToSuperview().inset(imageViewInset)
            $0.width.equalTo(100)
            $0.height.equalTo(imageView.snp.width)
        }
        
        textView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(imageViewInset)
            $0.trailing.equalToSuperview().inset(imageViewInset)
            $0.top.equalTo(imageView.snp.top)
            $0.bottom.equalTo(imageView.snp.bottom)
        }
        
        imageView.backgroundColor = .red
//        textView.text = "Hello~"
    }
}

extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .label
    }
}
