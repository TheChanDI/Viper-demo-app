//
//  DetailPresenter.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import Foundation

class DetailPresenter {
    
	// MARK: Properties
    
    weak var view: DetailViewInterface?
    var interactor: DetailInteractorInput?
    var wireframe: DetailWireframeInput?

    // MARK: Converting entities
}

 // MARK: Detail module interface

extension DetailPresenter: DetailModuleInterface {
    func notifyScreen() {
        interactor?.notifyListScreen()
    }
    
    func navigateToMap() {
        wireframe?.navigateToMap()
    }
    
    func favouriteButtonTap(with name: String) {
        interactor?.favouriteButtonTap(with: name)
    }
    
    func checkIsFavourite(for name: String) -> Bool {
        return interactor?.checkIsFavourite(for: name) ?? false
    }
    
}

// MARK: Detail interactor output interface

extension DetailPresenter: DetailInteractorOutput {
    
    func obtained(user: UserDetailDM) {
     
        view?.updateView(with: user)
    }
    
    
    

}
