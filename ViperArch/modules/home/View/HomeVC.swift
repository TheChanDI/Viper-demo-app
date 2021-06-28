//
//  HomeVC.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/21/21.
//

import UIKit

protocol HomeView: class {
    var presenter: HomePresenter? { get set }
    
    func updateTableView(with users: [User])
    func update(with error: String)
}

class HomeVC: UIViewController, HomeView {

    let tvCellIdentifier = "tvCell"
    
    var presenter: HomePresenter?
    
    var users = [User]()
    
    lazy var tableView: UITableView = {
       let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: tvCellIdentifier)
        return tv
    }()
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Home"
        configureTableView()
        
    
    }
    //MARK:- Methods
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func updateTableView(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.tableView.reloadData()
        }

    }
    
    func update(with error: String) {
        print(error)
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tvCellIdentifier, for: indexPath)
        cell.textLabel?.text = users[indexPath.row].username
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter?.tableViewItemTapp(of: indexPath, vc: SecondVC(), navigationController: navigationController!)
        
    }
    
    
}
