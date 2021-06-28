//
//  MapPresenter.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/24/21.
//
//

import Foundation

class MapPresenter {
    
	// MARK: Properties
    
    weak var view: MapViewInterface?
    var interactor: MapInteractorInput?
    var wireframe: MapWireframeInput?

    // MARK: Converting entities
}

 // MARK: Map module interface

extension MapPresenter: MapModuleInterface {
    func closeMapView() {
        wireframe?.dismissView()
    }
}

// MARK: Map interactor output interface

extension MapPresenter: MapInteractorOutput {
    func getAllUserData(data: [MapViewDM]) {
        view?.getAllData(data: data)
    }
    
    func getUserLocationData(data: UserDetailDM) {
        view?.getUserLocationData(data: data)
    }
    
    
}
