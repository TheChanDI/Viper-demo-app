//
//  FavouritesPresenter.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/25/21.
//
//

import Foundation

class FavouritesPresenter {
    
	// MARK: Properties
    
    weak var view: FavouritesViewInterface?
    var interactor: FavouritesInteractorInput?
    var wireframe: FavouritesWireframeInput?

    // MARK: Converting entities
}

 // MARK: Favourites module interface

extension FavouritesPresenter: FavouritesModuleInterface {
    func deleteAllList() {
        interactor?.deleteAllList()
    }
    
    func deleteSpecificItem(indexPath: IndexPath) {
        interactor?.deleteSpecificItem(indexPath: indexPath)
    }
    

}

// MARK: Favourites interactor output interface

extension FavouritesPresenter: FavouritesInteractorOutput {
    
}
