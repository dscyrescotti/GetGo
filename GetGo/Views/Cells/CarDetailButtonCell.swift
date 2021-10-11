//
//  CarDetailButtonCell.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class CarDetailButtonCell: UITableViewCell {
    
    static let identifier = "CarDetailButtonCell"
    
    let titleLabel: UILabel = UILabel().then { label in
        label.font = .systemFont(ofSize: 17, weight: .bold)
    }
    
    let subTitleLabel: UILabel = UILabel().then { label in
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray2
    }
    
    let descriptionLabel: UILabel = UILabel().then { label in
        label.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    let iconImage: UIImageView = UIImageView().then { imageView in
        imageView.tintColor = .black
    }
    
    let barView: UIView = UIView().then { view in
        view.backgroundColor = .systemGray2
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        selectionStyle = .none
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fill
        vStack.spacing = 5
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(subTitleLabel)
        addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(20)
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
        }
        addSubview(iconImage)
        addSubview(descriptionLabel)
        iconImage.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.centerY.equalTo(vStack)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImage)
            make.trailing.equalTo(iconImage.snp.leading).offset(-15)
        }
        addSubview(barView)
        barView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    
    func setup(title: String, icon: String) {
        titleLabel.text = title
        iconImage.image = UIImage(named: icon)
        subTitleLabel.isHidden = true
        descriptionLabel.isHidden = true
    }
    
    func setup(title: String, subTitle: String, description: String, icon: String) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
        descriptionLabel.text = description
        iconImage.image = UIImage(systemName: icon)
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
        iconImage.image = nil
        subTitleLabel.text = nil
        subTitleLabel.isHidden = false
        descriptionLabel.text = nil
        descriptionLabel.isHidden = false
        super.prepareForReuse()
    }
}
