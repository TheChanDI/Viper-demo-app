//
//  FavouritesViewController.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/25/21.
//
//

import UIKit

class FavouritesViewController: UIViewController {
    
    // MARK: Properties
    private let tvCellIdentifier = "favouriteCellIdentifier"
    var presenter: FavouritesModuleInterface?
    
    // MARK: IBOutlets
    
    lazy var tableView: UITableView = {
       let tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    
    // MARK: VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
    
    private func setup() {
        // all setup should be done here
        configureTableView()
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
       let leftIcon = UIImage(systemName: "trash")?.withTintColor(Colors.errorColor, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: leftIcon, style: .plain, target: self, action: #selector(allDeleteButtonTap))
    }
    
    @objc func allDeleteButtonTap() {
        if GlobalData.favouritesList.isEmpty {
            return
        }
        
        let alert = UIAlertController(title: "Do you want to remove all?", message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: "Remove", style: .default, handler: { [weak self] (_) in
            self?.presenter?.deleteAllList()
            self?.tableView.reloadData()
        }))
        alert.addAction(.init(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
     
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tvCellIdentifier)
        tableView.frame = view.bounds
    }
}

// MARK: FavouritesViewInterface
extension FavouritesViewController: FavouritesViewInterface {
    
}


//MARK: Other Extension
extension FavouritesViewController: TVDelegates {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalData.favouritesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tvCellIdentifier, for: indexPath)
        cell.textLabel?.text = GlobalData.favouritesList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter?.deleteSpecificItem(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
         }
    }
    

    
}


