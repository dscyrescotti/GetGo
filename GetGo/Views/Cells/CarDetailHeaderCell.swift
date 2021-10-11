//
//  CarDetailHeaderCell.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class CarDetailHeaderCell: UITableViewCell {
    static let identifier = "CarDetailHeaderCell"
    var modelNameLabel: UILabel = .init().then { label in
        label.text = "Mazda 3"
        label.font = .boldSystemFont(ofSize: 30)
    }
    var modelCodeLabel: UILabel = .init().then { label in
        label.text = "SMS10000Z"
        label.font = .systemFont(ofSize: 16)
    }
    var confirmLabel: CornerRadiusLabel = .init().then { view in
        view.setup(title: "CONFIRMED")
    }
    var startDateLabel: DateLabelView = .init().then { view in
        view.setup(title: "Start date", date: "Mon, 1 Nov 20", time: "11:45am")
    }
    var endDateLabel: DateLabelView = .init().then { view in
        view.setup(title: "End date", date: "Tue, 2 Nov 20", time: "11:45am")
    }
    var addToCalendarButton: IconLabelButton = .init().then { view in
        view.setup(title: "Add to calendar", icon: "plus")
    }
    var extendButton: IconLabelButton = .init().then { view in
        view.setup(title: "Extend", icon: "clock")
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
        addSubview(modelNameLabel)
        modelNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
        }
        addSubview(modelCodeLabel)
        modelCodeLabel.snp.makeConstraints { make in
            make.top.equalTo(modelNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(modelNameLabel)
        }
        addSubview(confirmLabel)
        confirmLabel.snp.makeConstraints { make in
            make.leading.equalTo(modelCodeLabel.snp.trailing).offset(10)
            make.centerY.equalTo(modelCodeLabel)
        }
        addSubview(startDateLabel)
        startDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(modelNameLabel)
            make.top.equalTo(modelCodeLabel.snp.bottom).offset(20)
        }
        addSubview(endDateLabel)
        endDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(startDateLabel.snp.trailing).offset(30)
            make.centerY.equalTo(startDateLabel)
        }
        let hStack = UIStackView()
        hStack.spacing = 20
        hStack.distribution = .fillEqually
        hStack.addArrangedSubview(addToCalendarButton)
        hStack.addArrangedSubview(extendButton)
        addSubview(hStack)
        hStack.snp.makeConstraints { make in
            make.leading.trailing.equalTo(modelNameLabel)
            make.top.equalTo(startDateLabel.snp.bottom).offset(25)
            make.bottom.equalToSuperview().inset(20)
        }
//        addSubview(addToCalendarButton)
//        addToCalendarButton.snp.makeConstraints { make in
//            make.leading.equalTo(modelNameLabel)
//            make.top.equalTo(startDateLabel.snp.bottom).offset(25)
//            make.bottom.equalToSuperview().offset(-20)
//        }
//        addSubview(extendButton)
//        extendButton.snp.makeConstraints { make in
//            make.trailing.equalTo(modelNameLabel)
//            make.leading.equalTo(addToCalendarButton.snp.trailing).offset(20)
//            make.top.bottom.equalTo(addToCalendarButton)
//        }
    }
}
