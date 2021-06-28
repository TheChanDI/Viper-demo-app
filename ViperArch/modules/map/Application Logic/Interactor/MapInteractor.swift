//
//  MapInteractor.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/24/21.
//
//

import Foundation

class MapInteractor {
    
	// MARK: Properties
    
    weak var output: MapInteractorOutput?
    private let service: MapServiceType
    var allData = [MapViewDM]()
    // MARK: Initialization
    
    init(service: MapServiceType) {
        self.service = service
    }

    // MARK: Converting entities
    
    func convertDataForMapView(data: [UserDetailDM]) {
        allData = data.map({
            return MapViewDM(name: $0.name, email: $0.email, phone: $0.phone, website: $0.website, address: $0.address, company: $0.company)
        })
        
        output?.getAllUserData(data: allData)
        
    }
}

// MARK: Map interactor input interface

extension MapInteractor: MapInteractorInput {
    func getUserLocationData(data: UserDetailDM, allData: [UserDetailDM]) {
        output?.getUserLocationData(data: data)
        convertDataForMapView(data: allData)
    }
}
