//
//  HomePresenter.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/21/21.
//

import Foundation
import UIKit

protocol HomePresenter {
    var router: HomeRouter? {get set}
    var interactor: HomeInteractor? {get set}
    var view: HomeView? {get set}
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
    func tableViewItemTapp(of index: IndexPath, vc: UIViewController, navigationController: UINavigationController )
}

class UserPresenter: HomePresenter {
    
    var users = [User]()
    
    func tableViewItemTapp(of index: IndexPath, vc: UIViewController, navigationController: UINavigationController) {
   
        (vc as! SecondVC).nameLabel.text = "Name: \(users[index.row].name)"
        (vc as! SecondVC).emailLabel.text = "Email: \(users[index.row].email)"
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    var interactor: HomeInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var view: HomeView?
    
    var router: HomeRouter?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            self.users = users
            view?.updateTableView(with: users)
            
        case .failure:
            view?.update(with: "Something went wrong!")
        }
    }
    
    
}

