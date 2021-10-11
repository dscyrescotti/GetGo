//
//  CornerRadiusButton.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class CornerRadiusButton: UIView {
    let containerView: UIView = .init()
    let button: UIButton = .init(type: .custom).then { button in
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(50)
        }
        
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
    }
    
    func setup(title: String) {
        button.setTitle(title, for: .normal)
    }
}
