//
//  FeeDetailView.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class FeeDetailView: UIView {
    var titleLabel: UILabel = UILabel().then { label in
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .systemGray2
        label.numberOfLines = 1
    }
    var subTitleLabel: UILabel = UILabel().then { label in
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 1
        label.textColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        subTitleLabel.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
    }
    
    func setup(title: String, subTitle: String) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
}
