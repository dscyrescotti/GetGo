//
//  CustomLabelView.swift
//  GetGo
//
//  Created by Dscyre Scotti on 10/10/2021.
//

import UIKit
import Then

class CustomLabelView: UIView {
    var imageView: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel().then { label in
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .systemGray2
        label.numberOfLines = 1
    }
    var subTitleLabel: UILabel = UILabel().then { label in
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        backgroundColor = .systemBackground
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
            make.size.equalTo(30)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(15)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(15)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
    }
    
    func setup(title: String, subTitle: String, icon: String) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
        imageView.image = UIImage(named: icon)
    }
}
