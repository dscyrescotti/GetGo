//
//  CornerRadiusLabel.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class CornerRadiusLabel: UIView {
    let containerView: UIView = .init()
    let label: UILabel = .init().then { label in
        label.font = .boldSystemFont(ofSize: 14)
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
        addSubview(containerView)
        containerView.backgroundColor = .systemBlue
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
    }
    
    func setup(title: String) {
        label.text = title
    }
}
