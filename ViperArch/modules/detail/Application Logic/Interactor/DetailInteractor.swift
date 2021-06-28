//
//  DetailInteractor.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/22/21.
//
//

import Foundation
import UIKit

class DetailInteractor {
    
	// MARK: Properties
    
    weak var output: DetailInteractorOutput?
    private let service: DetailServiceType
    
    // MARK: Initialization
    
    init(service: DetailServiceType) {
        self.service = service
    }

    // MARK: Converting entities
    
}

// MARK: Detail interactor input interface

extension DetailInteractor: DetailInteractorInput {
    func getUserData(with user: UserDetailDM) {
        output?.obtained(user: user)
    }
    
    func notifyListScreen() {
        NotificationCenter.default.post(name: .init(rawValue: "notifyView"), object: nil)
    }
    
    func favouriteButtonTap(with name: String) {
        
        let list = GlobalData.favouritesList
        
        if list.contains(name) {
            
            if let presentIndex = list.firstIndex(of: name) {
                GlobalData.favouritesList.remove(at: presentIndex)
            }
        }
        else {
            GlobalData.favouritesList.append(name)
        }
        
    }
    
    func checkIsFavourite(for name: String) -> Bool {
        let list = GlobalData.favouritesList
        return list.contains(name)
    }
    
}
