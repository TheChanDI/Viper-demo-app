//
//  LoginViewController.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties
    let tvCellIdentifier = "tvCell"
    var presenter: LoginModuleInterface?
    var users = [NameModel]()
    var isNotify: Bool = false
    
    // MARK: IBOutlets
    
    lazy var tableView: UITableView = {
       let tv = UITableView()
        tv.isHidden = true
        tv.register(UITableViewCell.self, forCellReuseIdentifier: tvCellIdentifier)
        tv.separatorStyle = .none
        return tv
    }()
    
    lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.color = .blue
        loader.startAnimating()
        return loader
    }()
    
    
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        presenter?.getUserList()
        setup()
        
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        
        configureTabBar()
        configureLoader()
        configureTableView()
    }
    
    func configureTabBar() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let titleView = UIImageView(image: UIImage(systemName: "leaf.fill", withConfiguration: largeConfig)?.withTintColor(Colors.secondary, renderingMode: .alwaysOriginal))
        navigationItem.titleView = titleView
        
        let leftIcon = UIImage(systemName: "heart.fill")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: leftIcon, style: .plain, target: self, action: #selector(saveIconTapp))
    }
    
    @objc func saveIconTapp() {
        presenter?.navigateToFavouriteView()
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configureLoader() {
        view.addSubview(loader)
        loader.frame = .init(x: view.frame.width / 2, y: view.frame.height / 2, width: 30, height: 30)
        
    }
    
    
}

typealias tableViewDelegate = UITableViewDelegate & UITableViewDataSource

extension LoginViewController: tableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tvCellIdentifier, for: indexPath)
        cell.textLabel?.text = isNotify ? "Full name: \(users[indexPath.row].name)" :  users[indexPath.row].fullName
        cell.selectionStyle = .none
        cell.textLabel?.textColor = Colors.textColor
        return cell
    }
    
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.goToDetail(indexPath: indexPath)
    }
    
}

// MARK: LoginViewInterface
extension LoginViewController: LoginViewInterface {
    func getUserList(data: [NameModel]) {
        DispatchQueue.main.async {
            self.users = data
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
    func notifyView() {
        isNotify = true
        tableView.reloadData()
    }
    
    func gotError(of error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.loader.isHidden = true
            let alert = UIAlertController(title: "Error!", message: error, preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .default, handler: { (_) in
                
            }))
            
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
}
