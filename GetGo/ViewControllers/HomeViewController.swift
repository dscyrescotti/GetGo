//
//  HomeViewController.swift
//  GetGo
//
//  Created by Dscyre Scotti on 10/10/2021.
//

import UIKit
import MapKit
import SnapKit

class HomeViewController: UIViewController {
    var mapView: MKMapView!
    var currentLocationView: CurrentLocationView!
    var bottomContraints: NSLayoutConstraint!
    var titleLabel: UILabel = .init().then { label in
        label.font = .systemFont(ofSize: 27, weight: .bold)
        label.textColor = UIColor(named: "backgroundColor")
        label.text = "GetGo"
    }
    var rentTitleLabel: UILabel = .init().then { label in
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .systemPink
        label.text = "Rent a car"
    }
    var alertButton = CircleButton().then { view in
        view.setup(icon: "icoActionAlert")
    }
    var locateButton = CircleButton().then { view in
        view.setup(icon: "icoActionLocate")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bottomContraints.constant = -15
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        bottomContraints.constant = 250
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension HomeViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground
        setupMapView()
        currentLocationView = CurrentLocationView()
        currentLocationView.dropShadow()
        currentLocationView.makeCornersRadius(10)
        view.addSubview(currentLocationView)
        view.addSubview(rentTitleLabel)
        view.addSubview(alertButton)
        view.addSubview(locateButton)
        view.addSubview(titleLabel)
        currentLocationView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        bottomContraints = currentLocationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 250)
        bottomContraints.isActive = true
        
        rentTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(currentLocationView.snp.leading)
            make.bottom.equalTo(currentLocationView.snp.top).offset(-15)
        }
        locateButton.snp.makeConstraints { make in
            make.trailing.equalTo(currentLocationView.snp.trailing)
            make.bottom.equalTo(currentLocationView.snp.top).offset(-20)
        }
        alertButton.snp.makeConstraints { make in
            make.trailing.top.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapCurrentLocation(_:)), for: .touchUpInside)
        currentLocationView.containerView.addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupMapView() {
        mapView = MKMapView()
        view.addSubview(mapView)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        let location = CLLocationCoordinate2D(latitude: 16.8409, longitude: 96.1735)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: CLLocationDistance(exactly: 1000)!, longitudinalMeters: CLLocationDistance(exactly: 1000)!)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func didTapCurrentLocation(_ sender: UIButton) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        
        let vc = SearchResultViewController()
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}
