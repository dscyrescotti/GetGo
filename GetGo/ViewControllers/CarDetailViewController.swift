//
//  CarDetailViewController.swift
//  GetGo
//
//  Created by Dscyre Scotti on 11/10/2021.
//

import UIKit

class CarDetailViewController: UIViewController {
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension CarDetailViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .black
        let label = UILabel()
        label.text = "Booking ID: 44123331"
        label.font = .boldSystemFont(ofSize: 15)
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icoActionCopy"), for: .normal)
        let vStack = UIStackView()
        vStack.axis = .horizontal
        vStack.spacing = 5
        vStack.addArrangedSubview(label)
        vStack.addArrangedSubview(button)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: vStack)
        setupTableView()
        setupBackButton()
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(CarDetailHeaderCell.self, forCellReuseIdentifier: CarDetailHeaderCell.identifier)
        tableView.register(PickUpLocationCell.self, forCellReuseIdentifier: PickUpLocationCell.identifier)
        tableView.register(CarDetailButtonCell.self, forCellReuseIdentifier: CarDetailButtonCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.bottom.equalTo(view)
        }
    }
    
    func setupBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.resizeImage(targetSize: .init(width: 20, height: 30)), style: .plain, target: self, action: #selector(dismiss))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.hidesBackButton = true
    }
    
    @objc func dismiss(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
}

extension CarDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailHeaderCell.identifier, for: indexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PickUpLocationCell.identifier, for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailButtonCell.identifier, for: indexPath) as? CarDetailButtonCell else {
                return UITableViewCell()
            }
            if indexPath.row == 2 {
                cell.setup(title: "Estimated total", subTitle: "Amount is not final", description: "S$52.00", icon: "chevron.right")
            } else if indexPath.row == 3 {
                cell.setup(title: "Need help?", icon: "icoHelpHelp")
            } else if indexPath.row == 4 {
                cell.setup(title: "Cancel this booking", icon: "icoHelpCancel")
            }
            return cell
        }
    }
}

