//
//  DateLabelView.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class DateLabelView: UIView {
    var titleLabel: UILabel = UILabel().then { label in
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .systemGray2
        label.numberOfLines = 1
    }
    var dateLabel: UILabel = UILabel().then { label in
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 1
    }
    var timeLabel: UILabel = UILabel().then { label in
        label.font = .preferredFont(forTextStyle: .subheadline)
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
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(timeLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        dateLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func setup(title: String, date: String, time: String) {
        titleLabel.text = title
        dateLabel.text = date
        timeLabel.text = time
    }
}

