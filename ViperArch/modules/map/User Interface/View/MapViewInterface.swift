//
//  MapViewInterface.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/24/21.
//
//

protocol MapViewInterface: class {
    func closeMapView()
    func getUserLocationData(data: UserDetailDM)
    func getAllData(data: [MapViewDM])
}
