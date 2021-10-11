//
//  SearchResultCell.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class SearchResultCell: UITableViewCell {
    static let identifier = "SearchResultCell"
    var carImageView: UIImageView = .init().then { imageView in
        imageView.image = UIImage(named: "car-1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
    }
    var modelNameLabel: UILabel = .init().then { label in
        label.text = "Mazda 3"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
    }
    var modelCodeLabel: UILabel = .init().then { label in
        label.text = "SMS10000Z"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
    }
    var dotView: UIView = .init().then { view in
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 2
    }
    var seaterLabel: UILabel = .init().then { label in
        label.text = "5 Seater"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
    }
    var rentalFeeLabel: FeeDetailView = .init().then { view in
        view.setup(title: "Rental fee", subTitle: "Fr. $3.00/hr")
    }
    var milageFeeLabel: FeeDetailView = .init().then { view in
        view.setup(title: "Milage fee", subTitle: "$0.40/km")
    }
    var barView: UIView = .init().then { view in
        view.backgroundColor = .systemGray
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
        backgroundColor = UIColor(named: "backgroundColor")
        addSubview(carImageView)
        carImageView.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(130)
            make.leading.top.bottom.equalTo(safeAreaLayoutGuide).inset(20)
        }
        addSubview(modelNameLabel)
        modelNameLabel.snp.makeConstraints { make in
            make.top.equalTo(carImageView)
            make.leading.equalTo(carImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        addSubview(modelCodeLabel)
        modelCodeLabel.snp.makeConstraints { make in
            make.top.equalTo(modelNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(modelNameLabel)
        }
        addSubview(dotView)
        dotView.snp.makeConstraints { make in
            make.leading.equalTo(modelCodeLabel.snp.trailing).offset(5)
            make.centerY.equalTo(modelCodeLabel)
            make.size.equalTo(4)
        }
        addSubview(seaterLabel)
        seaterLabel.snp.makeConstraints { make in
            make.leading.equalTo(dotView.snp.trailing).offset(5)
            make.centerY.equalTo(modelCodeLabel)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(20).priority(1)
        }
        addSubview(rentalFeeLabel)
        rentalFeeLabel.snp.makeConstraints { make in
            make.leading.equalTo(modelNameLabel)
            make.top.equalTo(modelCodeLabel.snp.bottom).offset(5)
            make.bottom.equalTo(carImageView)
        }
        addSubview(milageFeeLabel)
        milageFeeLabel.snp.makeConstraints { make in
            make.leading.equalTo(rentalFeeLabel.snp.trailing).offset(10)
            make.centerY.equalTo(rentalFeeLabel)
        }
        addSubview(barView)
        barView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
