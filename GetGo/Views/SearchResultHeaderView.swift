//
//  SearchResultHeaderView.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class SearchResultHeaderView: UIView {
    var resultNumberLabel: UILabel = .init().then { label in
        label.text = "300+"
        label.textColor = .systemPink
        label.font = .systemFont(ofSize: 16)
    }
    var foundLabel: UILabel = .init().then { label in
        label.text = "car found"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
    }
    var filterButton: CornerRadiusButton = .init().then { view in
        view.setup(title: "Filter")
    }
    var mapButton: CornerRadiusButton = .init().then { view in
        view.setup(title: "Map")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        backgroundColor = UIColor(named: "backgroundColor")
        addSubview(resultNumberLabel)
        resultNumberLabel.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.bottom.equalToSuperview().inset(10)
        }
        addSubview(foundLabel)
        foundLabel.snp.makeConstraints { make in
            make.leading.equalTo(resultNumberLabel.snp.trailing).offset(5)
            make.centerY.equalTo(resultNumberLabel)
        }
        addSubview(mapButton)
        mapButton.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.bottom.equalToSuperview().inset(10)
        }
        addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.trailing.equalTo(mapButton.snp.leading).inset(-10)
            make.centerY.equalTo(mapButton)
        }
    }
}
