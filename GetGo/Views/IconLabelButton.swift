//
//  IconLabelButton.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class IconLabelButton: UIView {
    let containerView: UIView = .init()
    let iconImage: UIImageView = UIImageView().then { view in
        view.tintColor = .black
    }
    let titleLabel: UILabel = UILabel().then { label in
        label.font = .systemFont(ofSize: 14)
    }
    let button: UIButton = UIButton()
    
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
        let hStack = UIStackView()
        hStack.spacing = 5
        hStack.distribution = .fill
        hStack.addArrangedSubview(iconImage)
        hStack.addArrangedSubview(titleLabel)
        addSubview(hStack)
        hStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
    }
    
    func setup(title: String, icon: String) {
        titleLabel.text = title
        iconImage.image = UIImage(systemName: icon)
    }
    
    func setup(title: String) {
        titleLabel.text = title
        iconImage.isHidden = true
    }
}
