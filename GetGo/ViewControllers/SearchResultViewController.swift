//
//  SearchResultViewController.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    var currentLocationView: CurrentLocationView!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension SearchResultViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .black
        title = "Search results"
        currentLocationView = CurrentLocationView(isShowsGo: false)
        view.addSubview(currentLocationView)
        currentLocationView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        setupTableView()
        setupBackButton()
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "backgroundColor")
        tableView.separatorStyle = .none
        tableView.register(SearchResultCell.self, forCellReuseIdentifier: SearchResultCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view)
            make.top.equalTo(currentLocationView.snp.bottom)
        }
    }
    
    func setupBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.resizeImage(targetSize: .init(width: 20, height: 30)), style: .plain, target: self, action: #selector(dismiss))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.hidesBackButton = true
    }
    
    
    @objc func dismiss(_ sender: UIButton) {
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController!.popViewController(animated: false)
    }
}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.identifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        SearchResultHeaderView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CarDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
