//
//  CircleButton.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class CircleButton: UIView {
    let containerView: UIView = .init()
    let button: UIButton = .init(type: .custom)
    
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
            make.size.equalTo(60)
            make.edges.equalToSuperview()
        }
        containerView.addSubview(button)
        button.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.center.equalToSuperview()
        }
        
        containerView.layer.cornerRadius = 30
        containerView.layer.masksToBounds = true
        dropShadow()
    }
    
    func dropShadow() {
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
    }
    
    func setup(icon: String) {
        button.setImage(UIImage(named: icon), for: .normal)
    }
}
