//
//  FavouritesInteractor.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/25/21.
//
//

import Foundation

class FavouritesInteractor {
    
	// MARK: Properties
    
    weak var output: FavouritesInteractorOutput?
    private let service: FavouritesServiceType
    
    // MARK: Initialization
    
    init(service: FavouritesServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: Favourites interactor input interface

extension FavouritesInteractor: FavouritesInteractorInput {
    func deleteAllList() {
        GlobalData.favouritesList.removeAll()
    }
    
    func deleteSpecificItem(indexPath: IndexPath) {
        GlobalData.favouritesList.remove(at: indexPath.row)
    }
}
