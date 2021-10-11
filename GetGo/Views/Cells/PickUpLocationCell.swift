//
//  PickUpLocationCell.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit
import MapKit

class PickUpLocationCell: UITableViewCell {
    static let identifier: String = "PickUpLocationCell"
    
    var titleLabel: UILabel = UILabel().then { label in
        label.text = "Pick up car at"
        label.textColor = .systemPink
    }
    var addressLabel: UILabel = UILabel().then { label in
        label.text = "194 Punggol Road P100 Multi Storey Car Park"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 2
    }
    var mapView: MKMapView = MKMapView()
    var barView: UIView = UIView().then { view in
        view.backgroundColor = .systemGray4
    }
    var buildingInfoLabel: UILabel = UILabel().then { label in
        label.text = "Level 4 / Lot 123 - 456"
        label.font = .systemFont(ofSize: 16, weight: .regular)
    }
    var getDirectionButton: IconLabelButton = IconLabelButton().then { view in
        view.setup(title: "Get Directions", icon: "arrowshape.turn.up.forward.fill")
    }
    var morePhotoButton: IconLabelButton = IconLabelButton().then { view in
        view.setup(title: "+10")
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
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.equalToSuperview().inset(10)
        }
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        let location = CLLocationCoordinate2D(latitude: 16.8409, longitude: 96.1735)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: CLLocationDistance(exactly: 800)!, longitudinalMeters: CLLocationDistance(exactly: 800)!)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
        mapView.layer.cornerRadius = 10
        mapView.layer.masksToBounds = true
        addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.height.equalTo(180)
            make.width.equalTo(130)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        addSubview(barView)
        barView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(mapView.snp.bottom).offset(20)
            make.height.equalTo(10)
            make.bottom.equalToSuperview()
        }
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.leading.equalTo(mapView.snp.trailing).offset(10)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            make.top.equalTo(mapView)
        }
        addSubview(buildingInfoLabel)
        buildingInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(addressLabel)
            make.top.equalTo(addressLabel.snp.bottom).offset(5)
        }
        addSubview(getDirectionButton)
        getDirectionButton.snp.makeConstraints { make in
            make.leading.equalTo(addressLabel)
            make.width.equalTo(150)
            make.top.equalTo(buildingInfoLabel.snp.bottom).offset(15)
        }
        morePhotoButton.snp.makeConstraints { make in
            make.size.equalTo(30)
        }
        let hStack = UIStackView()
        hStack.spacing = 8
        hStack.distribution = .fillEqually
        let view = UIView()
        view.backgroundColor = .systemGray
        hStack.addArrangedSubview(view)
        hStack.addArrangedSubview(morePhotoButton)
        addSubview(hStack)
        hStack.snp.makeConstraints { make in
            make.top.equalTo(getDirectionButton.snp.bottom).offset(15)
            make.leading.equalTo(addressLabel)
        }
    }
}
