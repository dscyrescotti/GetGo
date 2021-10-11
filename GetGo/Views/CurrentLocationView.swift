//
//  CurrentLocationView.swift
//  GetGo
//
//  Created by Dscyre Scotti on 10/10/2021.
//

import UIKit

class CurrentLocationView: UIView {
    let containerView = UIView()
    let vStack: UIStackView = .init().then { stack in
        stack.axis = .vertical
        stack.spacing = 1
        stack.distribution = .fillEqually
    }
    let hStack: UIStackView = .init().then { stack in
        stack.axis = .horizontal
        stack.spacing = 1
        stack.distribution = .fillEqually
    }
    let locationLabelView: CustomLabelView = .init().then { view in
        view.setup(title: "Location", subTitle: "Current Location", icon: "icoAddress")
    }
    let dateTimeLabelView: CustomLabelView = .init().then { view in
        view.setup(title: "Date & Time", subTitle: "Now", icon: "icoDateD")
    }
    let durationLabelView: CustomLabelView = .init().then { view in
        view.setup(title: "Duration", subTitle: "1 hr", icon: "icoTime")
    }
    var goLabel: UILabel = .init().then { label in
        label.font = .preferredFont(forTextStyle: .title3)
        label.backgroundColor = UIColor(named: "green")
        label.text = "Go"
        label.textAlignment = .center
    }
    var isShowsGo: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    convenience init(isShowsGo: Bool = true) {
        self.init(frame: .zero)
        self.isShowsGo = isShowsGo
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        backgroundColor = .systemGray
        addSubview(containerView)
        containerView.addSubview(vStack)
        vStack.addArrangedSubview(locationLabelView)
        vStack.addArrangedSubview(hStack)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        vStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        hStack.addArrangedSubview(dateTimeLabelView)
        hStack.addArrangedSubview(durationLabelView)
        if isShowsGo {
            hStack.snp.makeConstraints { make in
                make.trailing.equalTo(snp.trailing).offset(-60)
            }
            containerView.addSubview(goLabel)
            goLabel.snp.makeConstraints { make in
                make.trailing.bottom.equalToSuperview()
                make.top.equalTo(locationLabelView.snp.bottom)
                make.leading.equalTo(durationLabelView.snp.trailing)
            }
        }
    }
    
    func dropShadow() {
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
    }
    
    func makeCornersRadius(_ radius: CGFloat) {
        containerView.layer.cornerRadius = radius
        containerView.layer.masksToBounds = true
    }

}
